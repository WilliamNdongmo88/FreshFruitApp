import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_City.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_Country.dart';
import 'package:money_app/utils/MA_Constant.dart';

import '../utils/MA_TransactionItem.dart';
import '../views/homePage/MA_homePage.dart';
import 'Helper classes/MA_Helper_User.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_TransfertInformation.dart';

class DataController extends GetxController {
  var isLoading = false.obs;

  List<MA_Helper_Country> CountryList = <MA_Helper_Country>[].obs;
  RxList<MA_Helper_Country> CountryListToDispatch = <MA_Helper_Country>[].obs;
  RxString token = ''.obs;

  List<TransactionItemToFireBase> transfertList =
      <TransactionItemToFireBase>[].obs;

/*
  author: Franc TOUTCHA
  * This is a function which help you to call cloud functions
  * It take 2 params
  *functionName:a param of type String that is the name of the Firebase Cloud function. ex: nl_manage_country
  * data :an object which is the param of the cloud function... exp:{"action": "GET-ALL-WITH-CITIES"}
*/
  Future<dynamic> callCloudFunction(String functionName, data) async {
    print('***** before specify the Could Function name *********');
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable(functionName);
    print('***** after specify the Could Funct name *********');
    try {
      HttpsCallableResult result =
          await callable.call(data); // Make the callable cloud function call

      // Check the status code
      print("]]]]]]]]]]]]]]]]result before traitement****************");
      print(result);
      print(result.data);
      if (result.data['code'] == '200' /* && result.data['exit'] == 'OK'*/) {
        // Successful response
        print('Cloud function call successful');
        print('Response: ${result.data['message']}');
        return {"body": result.data['body']};
      } else {
        if (result.data['code'] != '200') {
          // Error occurred
          print('Error calling cloud function');
          print('Status code: ${result.data['code']}');
          print('Error message: ${result.data['message']}');
          return {
            "ErrorCode": result.data['code'],
            "message": result.data['message']
          };
        }
        if (result.data['exit'] == 'KO') {
          //empty body
          return {"message": result.data['message']};
        }
      }
    } on FirebaseFunctionsException catch (e) {
      // Handle specific Firebase Cloud Functions exception
      print('Firebase Cloud Functions Exception:');
      print('Code: ${e.code}');
      print('Message: ${e.message}');
      print('Details: ${e.details}');
    } catch (e) {
      // Exception occurred
      print(e.runtimeType);
      print('Exception calling cloud function: $e');
    }
  }

  Future<List<MA_Helper_Country>> retrieveCountry() async {
    print(FirebaseAuth.instance.currentUser);
    print("enter in nl_manage_country");
    dynamic result = await callCloudFunction(
        'nl_manage_country', {"action": "GET-ALL-WITH-CITIES"});
    if (result['ErrorCode'] == null) {
      if (result['message'] != null) {
        //empty result
        print('enter In empty response scope');
        print(result['message']);
      } else {
        print('enter In good response scope');
        //List<MA_Helper_Country> CountryList = [];
        print(result['body']);
        CountryList = List<MA_Helper_Country>.from(result['body'].map(
          (country) => MA_Helper_Country(
            code: country['code'],
            name: country['name'],
            currency: country['currency'],
            id: country['id'],
            iso2: country['iso2'],
            iso3: country['iso3'],
            cities: List<MA_Helper_City>.from(country['cities'].map(
              (city) => MA_Helper_City(
                id: city['id'],
                code: city['code'],
                name: city['name'],
                countryId: city['country_id'],
              ),
            )),
          ),
        ));
        print(CountryList[0].code);
      }
    } else {
      //an error occur
      print('enter In error response scope');
      print(result['ErrorCode']);
      print(result['message']);
    }
    return CountryList;
  }

  Future<String?> sendToken(String token) async {
    String? msg;
    dynamic result = await callCloudFunction('nl_manage_users', {
      "action": "UPDATE",
      "user": {"fcmToken": token}
    });
    if (result['ErrorCode'] == null) {
      if (result['message'] != null) {
        //empty result
        print('*** sendToken function: enter In empty response scope ***');
        print(result['message']);
        msg = "K.O.1";
      } else {
        print('*** enter In good response scope: sendToken function ***');
        print(result['body'].runtimeType);
        msg = result['body'];
        //Get.to(()=> TransactionListScreen());
      }
    } else {
      //an error occur
      print('enter In error response scope: sendToken function');
      print(result['ErrorCode']);
      print(result['message']);
      msg = "K.O";
    }
    return msg;
  }

  Future<String> createUser(MA_Helper_User user) async {
    isLoading(true);
    print(FirebaseAuth.instance.currentUser);
    print("enter in nl_manage_users");
    String msg = "empty";
    dynamic result = await callCloudFunction('nl_manage_users', {
      "action": "SAVE",
      "user": {
        "userId": user.userId,
        "firstname": user.firstname,
        "lastname": user.lastname,
        "email": user.email,
        "country": user.country,
        "city": user.city,
        "phone": user.phone,
        "gender": user.gender
      }
    });
    if (result['ErrorCode'] == null) {
      if (result['message'] != null) {
        //empty result
        print('enter In empty response scope');
        print(result['message']);
        msg = "K.O.1";
        isLoading(false);
      } else {
        print('enter In good response scope');
        print(result['body'].runtimeType);
        msg = result['body'];
        await FirebaseAuth.instance.currentUser?.updateDisplayName(user.firstname+' '+user.lastname);
        isLoading(false);
        Get.to(() => TransactionListScreen());
      }
    } else {
      //an error occur
      print('enter In error response scope');
      print(result['ErrorCode']);
      print(result['message']);
      msg = "K.O";
      isLoading(false);
    }
    return msg;
  }

  void updateCountryList(List<MA_Helper_Country> listC) {
    CountryListToDispatch.value = listC;
  }

  void setToken(String toknC) {
    token.value = toknC;
  }

  Future<dynamic> createTransfert(MA_Helper_Transfert transfert) async {
    print('***** Enter in createTransfert *********');
    String msg = '';
    String date = getDate(DateTime.now());
    dynamic result ;
    if (transfert.ManualInfo != null) {
      print('***** Enter in if ManualInfo *********');
       result = await callCloudFunction('nl_manage_request', {
        "action": "SAVE",
        "transfert": {
          "amount": transfert.Amount,
          "status": "OPEN",
          "createdDate": date,
          "receiver": {
            "nom": transfert.ManualInfo?.Name,
            "telephone": transfert.ManualInfo?.phoneNumber
          },
          "inZoneCity": transfert.SenderCity,
          "outZoneCity": transfert.ReceiverCity,
          "codeReception": transfert.ReceptionCode,
        }
      });
      if (result['ErrorCode'] == null) {
        if (result['message'] != null) {
          //empty result
          print('enter In empty response scope');
          print(result['message']);
          msg = "K.O.1";
        } else {
          print('enter In good response scope');
          print(result['body'].runtimeType);
          msg = result['body'];
        }
      } else {
        //an error occur
        print('enter In error response scope');
        print(result['ErrorCode']);
        print(result['message']);
        msg = "K.O";
      }
    } else if (transfert.BankInfo != null) {
      print('***** Enter in else if BankInfo *********');
       result = await callCloudFunction('nl_manage_request', {

        "action": "SAVE",
        "transfert": {
          "amount": transfert.Amount,
          "status": "OPEN",
          //"createdDate": date,
          "bank": {
            "nom": transfert.BankInfo?.Name,
            "intitule": transfert.BankInfo?.Intitule,
          },
          "inZoneCity": transfert.SenderCity,
          "outZoneCity": transfert.ReceiverCity,
          "codeReception": transfert.ReceptionCode,
        }
      });
      print('entire response ààààààààà');//{exit: KO, code: failed-precondition, message: inZoneCity and outZoneCity can not have a same value}
                                         //{exit: OK, code: 200, message: Transfert Created, body: hDWL2WwUeRoVEWuGrtN2}
                                         //{exit: KO, code: failed-precondition, message: Transfert must have inZone and outZone city}
      print(result);
      if (result['ErrorCode'] == null) {
        if (result['message'] != null) {
          //empty result
          print('enter In empty response scope');
          print(result['message']);
          msg = "K.O.1";
        } else {
          print('enter In good response scope');
          print(result['body'].runtimeType);
          msg = result['body'];
        }
      } else {
        //an error occur
        print('enter In error response scope');
        print(result['ErrorCode']);
        print(result['message']);
        msg = "K.O";
      }
    }
    return result;
  }

  String getDate(DateTime data) {
    DateTime today = data;
    String month = getMonthByNumber(today.month);
    String dateStr = "$month ${today.day}, ${today.year}";
    return dateStr;
  }

  String getMonthByNumber(int numb) {
    var data = numb;

    switch (data) {
      case 1:
        {
          return "January";
        }

      case 2:
        {
          return "February";
        }

      case 3:
        {
          return "March";
        }

      case 4:
        {
          return "April";
        }

      case 5:
        {
          return "May";
        }

      case 6:
        {
          return "June";
        }

      case 7:
        {
          return "July";
        }

      case 8:
        {
          return "August";
        }

      case 9:
        {
          return "September";
        }

      case 10:
        {
          return "October";
        }

      case 11:
        {
          return "November";
        }

      case 12:
        {
          return "December";
        }

      default:
        {
          return "";
        }
    }
  }

  Future<List<TransactionItemToFireBase>> retrieveTransferts() async {
    print(FirebaseAuth.instance.currentUser);
    
    dynamic result =
        await callCloudFunction('nl_manage_request', {"action": "GET-ALL"});
    print("result----> $result");
    if (result['ErrorCode'] == null) {
      if (result['message'] != null) {
        //empty result
        print('enter In empty response scope');
        print(result['message']);
      } else {
        print('enter In good response scope');
        print("---> $result['body']");
        transfertList = List<TransactionItemToFireBase>.from(result['body'].map(
          (json) => TransactionItemToFireBase(
            id: json['id'],
            lastTimeInPending: json['lastTimeInPending'],
            amount: json['amount'],
            bank: json['bank'],
            codeReception: json['codeReception'],
            createdDate: json['createdDate'],
            deposit: json['deposit'],
            description: json['description'],
            inZone: json['inZone'],
            outZone: json['outZone'],
            owner: json['owner'],
            ownerId: json['ownerId'],
            receiver: json['receiver'],
            status: json['status'],
            to_bank: json['to_bank'],
          ),
        ));
      }
    } else {
      //an error occur
      print('enter In error response scope');
      print(result['ErrorCode']);
      print(result['message']);
    }
    return transfertList;
  }

  Future<List<TransactionItemToFireBase>> retrieveOneTransfert({required TransactionItem transfert}) async {
    print(FirebaseAuth.instance.currentUser);
    print("enter in nl_manage_request");
    dynamic result =
        await callCloudFunction('nl_manage_request', {"action": "GET-INFO", "transfertId": transfert.id});
    if (result['ErrorCode'] == null) {
      if (result['message'] != null) {
        //empty result
        print('enter In empty response scope');
        print(result['message']);
      } else {
        print('enter In good response scope');
        print("---> $result['body']");
        transfertList.add(TransactionItemToFireBase(
          id: result['body']['id'],
          lastTimeInPending: result['body']['lastTimeInPending'],
          amount: result['body']['amount'],
          bank: result['body']['bank'],
          codeReception: result['body']['codeReception'],
          createdDate: result['body']['createdDate'],
          deposit: result['body']['deposit'],
          description: result['body']['description'],
          inZone: result['body']['inZone'],
          outZone: result['body']['outZone'],
          owner: result['body']['owner'],
          ownerId: result['body']['ownerId'],
          receiver: result['body']['receiver'],
          status: result['body']['status'],
          to_bank: result['body']['to_bank'],
        ));
      }
    } else {
      //an error occur
      print('enter In error response scope');
      print(result['ErrorCode']);
      print(result['message']);
    }
    return transfertList;
  }

  Future<void> updateTransfert(
      {TransactionItem? transfert, bool? bools}) async {
    print('***** Update bools  $bools');
    // print('***** Update Transfert Id  ${transfert!.id}');
    // print('***** Update Transfert status  ${transfert.status}');
    // print('***** Update Transfert outZoneCity  ${transfert.outZoneCity}');
    // print('***** Update Transfert outZoneCountry  ${transfert.outZoneCountry}');
    print('***** Update Transfert start *********');
    if (transfert!.status == 'OPEN' ||
        transfert!.status == 'IN APPROVAL' && bools == true) {
      await callCloudFunction('nl_manage_request', {
        "action": "UPDATE",
        "transfert": {
          // "amount": transfert.Amount,
          "status": "CANCELED",
          // "createdDate": date,
          // "receiver": {
          //   "nom": transfert.ManualInfo?.Name,
          //   "telephone": transfert.ManualInfo?.phoneNumber
          // },
          // "inZoneCity": transfert.SenderCity,
          // "outZoneCity": transfert.ReceiverCity,
          // "codeReception": transfert.ReceptionCode,
        },
        "transfertId": transfert.id
      });
    } else if (transfert.status == 'CANCELED' && bools == false) {
      await callCloudFunction('nl_manage_request', {
        "action": "UPDATE",
        "transfert": {
          // "amount": transfert.Amount,
          "status": "IN APPROVAL",
          // "createdDate": date,
          // "receiver": {
          //   "nom": transfert.ManualInfo?.Name,
          //   "telephone": transfert.ManualInfo?.phoneNumber
          // },
          // "inZoneCity": transfert.SenderCity,
          // "outZoneCity": transfert.ReceiverCity,
          // "codeReception": transfert.ReceptionCode,
        },
        "transfertId": transfert.id
      });
    } else if (transfert.status == 'IN APPROVAL' && bools == false) {
      await callCloudFunction('nl_manage_request', {
        "action": "UPDATE",
        "transfert": {
          // "amount": transfert.Amount,
          "status": "OPEN",
          // "createdDate": date,
          // "receiver": {
          //   "nom": transfert.ManualInfo?.Name,
          //   "telephone": transfert.ManualInfo?.phoneNumber
          // },
          // "inZoneCity": transfert.SenderCity,
          // "outZoneCity": transfert.ReceiverCity,
          // "codeReception": transfert.ReceptionCode,
        },
        "transfertId": transfert.id
      });
    } else if(transfert.toBank == false){
      print('***** Update Transfert Id  ${transfert!.id}');
      print('***** Update Transfert status  ${transfert.receiverName}');
      print('***** Update Transfert status  ${transfert.receiverTel}');
      print('***** Update Transfert outZoneCity  ${transfert.outZoneCity}');
      print(
          '***** Update Transfert outZoneCountry  ${transfert.outZoneCountry}');
      print('***** Update Transfert status  ${transfert.codeReception}');
      await callCloudFunction('nl_manage_request', {
        "action": "UPDATE",
        "transfert": {
          // "amount": transfert.Amount,
          // "status": "OPEN",
          "receiver": {
            "nom": transfert.receiverName,
            "telephone": transfert.receiverTel
          },
          "outZoneCity": transfert.outZoneCity,
          "codeReception": transfert.codeReception,
        },
        "transfertId": transfert.id
      });
    } else if (transfert.toBank == true){
      await callCloudFunction('nl_manage_request', {
        "action": "UPDATE",
        "transfert": {
          // "amount": transfert.Amount,
          // "status": "OPEN",
          // "createdDate": date,
          "bank": {
            "intitule": transfert.bankIntitule,
            "nom": transfert.bankNom
          },
          "outZoneCity": transfert.outZoneCity,
          "codeReception": transfert.codeReception,
        },
        "transfertId": transfert.id
      });
    }
    print('***** Update Transfert end *********');
  }
}
