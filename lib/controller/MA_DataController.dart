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

class DataController extends GetxController {
  var isLoading = false.obs;

  List<MA_Helper_Country> CountryList = <MA_Helper_Country>[].obs;
  List<TransactionItemToFireBase> transfertList =
      <TransactionItemToFireBase>[].obs;
  RxList<MA_Helper_Country> CountryListToDispatch = <MA_Helper_Country>[].obs;
/*
  author: Franc TOUTCHA
  * This is a function which help you to call cloud functions
  * It take 2 params
  *functionName:a param of type String that is the name of the Firebase Cloud function. ex: nl_manage_country
  * data :an object which is the param of the cloud function... exp:{"action": "GET-ALL-WITH-CITIES"}
*/
  Future<dynamic> callCloudFunction(String functionName, data) async {
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable(functionName);
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

  Future<List<TransactionItemToFireBase>> retrieveTransferts() async {
    print(FirebaseAuth.instance.currentUser);
    print("enter in nl_manage_request");
    dynamic result =
        await callCloudFunction('nl_manage_request', {"action": "GET-ALL"});
    if (result['ErrorCode'] == null) {
      if (result['message'] != null) {
        //empty result
        print('enter In empty response scope');
        print(result['message']);
      } else {
        print('enter In good response scope');
        print(result['body']);
        transfertList = List<TransactionItemToFireBase>.from(result['body'].map(
          (json) => TransactionItemToFireBase(
            lastTimeInPending: json['lastTimeInPending'],
            amont: json['amont'],
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
}
