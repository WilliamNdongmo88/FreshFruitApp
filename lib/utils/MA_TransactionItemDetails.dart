// ignore_for_file: sort_child_properties_last, avoid_print, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/MA_DataController.dart';
import '../views/MA_EditeData.dart';
import '../views/MA_TransactionPage.dart';
import '../views/homePage/MA_homePage.dart';
import 'MA_CallableWidget.dart';
import 'MA_TransactionItem.dart';
import 'MA_Widgets.dart';

// ignore: must_be_immutable
class TransactionScreen extends StatefulWidget {
  List<TransactionItem> transaction;
  int index;
  bool isListTransaction;
  static const transactionScreenPage = '/TransactionScreen';
  TransactionScreen(
      {super.key,
      required this.transaction,
      required this.index,
      required this.isListTransaction});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState(
      this.transaction, this.index, this.isListTransaction);
}

class _TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
  List<TransactionItem> transaction;
  int index;
  bool isListTransaction;
  _TransactionScreenState(this.transaction, this.index, this.isListTransaction);
  var txt = 'Nom du bénéficiaire';
  late String indexOfStatutTransaction = '';

  Future<void> updatesTransfert(bools) async {
    DataController dataController = DataController();
    print('++++++++ transaction_index---> ${transaction[index]}');
    await dataController.updateTransfert(transaction[index], bools);
  }

  @override
  void initState() {
    indexOfStatutTransaction = transaction[index].status;
    super.initState();
  }

  void funChange(changetxt) {
    setState(() {
      print(
          '++++++++++++ Modifier status +++++++++++++++ $changetxt  $isListTransaction');
      // txt = changetxt;
      if (changetxt == "Open_pop_up") {
        showDialog(
          context: context,
          builder: (ctx) => Center(
              child: GetDataForm(ctx: ctx, callBackFunction: funInputChange)),
        );
      } else if (changetxt == 'WithoutLabel' && isListTransaction == false) {
        Navigator.pushNamed(
            context, TransactionListScreen.transactionListScreen);
      } else if (changetxt == 'WithoutLabel' && isListTransaction == true) {
        print('----back with true---- ${transaction[index].status}');
        if (indexOfStatutTransaction == 'OPEN' ||
            indexOfStatutTransaction == 'En Attente') {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  TransactionPage(
                      isListTransaction: isListTransaction,
                      currentTransaction: 1),
            ),
          );
        } else if (indexOfStatutTransaction == 'Terminé') {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  TransactionPage(
                      isListTransaction: isListTransaction,
                      currentTransaction: 2),
            ),
          );
        } else {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  TransactionPage(
                      isListTransaction: isListTransaction,
                      currentTransaction: 3),
            ),
          );
        }
      } else if (changetxt == 'Modifier') {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                EditeData(transaction: transaction, index: index),
          ),
        );
      } else if (changetxt == 'Annuler' ||
          changetxt == 'Supprimer' ||
          changetxt == 'Relancer' ||
          changetxt == 'Confirmer') {
        showDialog(
          context: context,
          builder: (ctx) => showdialog(
              ctx: ctx, changetxt: changetxt, callBackFunction: changeStatus),
        );
      }
    });
  }

  void changeStatus(changetxt) {
    bool bools = false;
    setState(() {
      print('changetxt--> $changetxt');
      if (changetxt == 'CANCELED') {
        bools = true;
        indexOfStatutTransaction = changetxt;
        updatesTransfert(bools);
      } else if (changetxt == 'IN APPROVAL') {
        indexOfStatutTransaction = changetxt;
        updatesTransfert(bools);
      } else if (changetxt == 'Confirmer') {
        indexOfStatutTransaction = 'OPEN';
        updatesTransfert(bools);
      } else {
        indexOfStatutTransaction = changetxt;
        updatesTransfert(bools);
      }
    });
  }

  void funChange2(changetxt) {
    setState(() {
      if (changetxt == 0) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                TransactionListScreen(),
          ),
        );
      }
    });
  }

  late bool valueOfBool = false;
  var codeReception = 'null';
  void funInputChange(dataMap) {
    setState(() {
      if (dataMap["boolValue"] == true) {
        valueOfBool = true;
        codeReception = dataMap["password"];
        print('dataMap--> $dataMap');
      }
    });
  }

  List<String> tabs = ["Transaction", "Destinataire", "Expéditeur"];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.r, top: 10.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildIconButton(
                            iconColor: const Color.fromRGBO(17, 16, 15, 1),
                            iconButton: Icons.arrow_back_ios,
                            buttonText: '',
                            fontSizeIcon: 35.w,
                            callBackFunction: funChange),
                        Text(
                          'Détail de la transaction',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70.r),
                    width: double.infinity,
                    height: 140.h,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(242, 78, 30, 1),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$txt ',
                                // '$index ' '$isListTransaction',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              if (transaction[index].toBank == true) ...[
                                Text(
                                  '${transaction[index].bankNom}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ] else
                                Text(
                                  '${transaction[index].receiverName}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (indexOfStatutTransaction == 'IN APPROVAL') ...[
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(top: 175.r, left: 5.r, right: 5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.white,
                                child: buildIconButtonSvg(
                                    iconColor:
                                        const Color.fromRGBO(17, 16, 15, 1),
                                    iconSvg: 'assets/cancel2.svg',
                                    buttonText: 'Annuler',
                                    fontSizeIcon: 35.w,
                                    callBackFunction: funChange),
                                padding: EdgeInsets.all(13.r),
                                shape: const CircleBorder(),
                              ),
                              SizedBox(height: 3.h),
                              Text('Annuler',
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.white,
                                child: buildIconButtonSvg(
                                    iconColor: Colors.black,
                                    buttonText: 'Modifier',
                                    iconSvg: 'assets/edit.svg',
                                    fontSizeIcon: 36.w,
                                    callBackFunction: funChange),
                                padding: EdgeInsets.all(13.r),
                                shape: CircleBorder(),
                              ),
                              SizedBox(height: 3.h),
                              Text("Modifier",
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                          SizedBox(width: 5.h),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.white,
                                child: buildIconButtonSvg(
                                    iconColor: Color.fromRGBO(17, 16, 15, 1),
                                    iconSvg: 'assets/confirm.svg',
                                    buttonText: 'Confirmer',
                                    fontSizeIcon: 35.w,
                                    callBackFunction: funChange),
                                padding: EdgeInsets.all(13.r),
                                shape: const CircleBorder(),
                              ),
                              SizedBox(height: 8.h),
                              Text("Confirmer",
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ] else if (indexOfStatutTransaction == 'OPEN') ...[
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(top: 175.r, left: 5.r, right: 5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                    child: MaterialButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  textColor: Colors.white,
                                  child: buildIconButtonSvg(
                                      iconColor:
                                          const Color.fromRGBO(17, 16, 15, 1),
                                      iconSvg: 'assets/cancel2.svg',
                                      buttonText: 'Annuler',
                                      fontSizeIcon: 35.sp,
                                      callBackFunction: funChange),
                                  padding: EdgeInsets.all(13.r),
                                  shape: const CircleBorder(),
                                )),
                                SizedBox(height: 3.h),
                                Text('Annuler',
                                    style: TextStyle(fontSize: 16.sp)),
                              ],
                            ),
                          ),
                          SizedBox(width: 80.h),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.white,
                                child: buildIconButtonSvg(
                                    iconColor: Colors.black,
                                    buttonText: 'Modifier',
                                    iconSvg: 'assets/edit.svg',
                                    fontSizeIcon: 36.w,
                                    callBackFunction: funChange),
                                padding: EdgeInsets.all(13.r),
                                shape: CircleBorder(),
                              ),
                              SizedBox(height: 3.h),
                              Text("Modifier",
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ] else if (indexOfStatutTransaction == 'CANCELED') ...[
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(top: 175.r, left: 5.r, right: 5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                    child: MaterialButton(
                                  onPressed: () {},
                                  color: Colors.white,
                                  textColor: Colors.white,
                                  child: buildIconButtonSvg(
                                      iconColor:
                                          const Color.fromRGBO(17, 16, 15, 1),
                                      iconSvg: 'assets/delete.svg',
                                      buttonText: 'Supprimer',
                                      fontSizeIcon: 35.w,
                                      callBackFunction: funChange),
                                  padding: EdgeInsets.all(13.h),
                                  shape: const CircleBorder(),
                                )),
                                SizedBox(height: 3.h),
                                Text('Supprimer',
                                    style: TextStyle(fontSize: 16.sp)),
                              ],
                            ),
                          ),
                          SizedBox(width: 5.h),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.white,
                                child: buildIconButtonSvg(
                                    iconColor: Colors.black,
                                    buttonText: 'Modifier',
                                    iconSvg: 'assets/edit.svg',
                                    fontSizeIcon: 36.w,
                                    callBackFunction: funChange),
                                padding: EdgeInsets.all(13.r),
                                shape: CircleBorder(),
                              ),
                              SizedBox(height: 3.h),
                              Text("Modifier",
                                  style: TextStyle(fontSize: 16.sp)),
                            ],
                          ),
                          SizedBox(width: 5.h),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                color: Colors.white,
                                textColor: Colors.white,
                                child: buildIconButtonSvg(
                                    iconColor: Color.fromRGBO(17, 16, 15, 1),
                                    iconSvg: 'assets/relancer.svg',
                                    buttonText: 'Relancer',
                                    fontSizeIcon: 35.w,
                                    callBackFunction: funChange),
                                padding: EdgeInsets.all(13.r),
                                shape: const CircleBorder(),
                              ),
                              SizedBox(height: 3.h),
                              Text("Relancer",
                                  style: TextStyle(fontSize: 16.h)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  /* Tab Bar */
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: transaction[index].status == 'Terminé'
                            ? 230.r
                            : 265.r,
                        left: 18.r,
                        right: 18.r),
                    height:
                        transaction[index].status == 'Terminé' ? 510.r : 480.r,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(25), //border corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1), //color of shadow
                          spreadRadius: 3, //spread radius
                          blurRadius: 3, // blur radius
                          offset: Offset(-3, 3), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        /// CUSTOM TABBAR
                        Padding(
                          padding:
                              EdgeInsets.only(top: 15.r, left: 5.r, right: 5.r),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60.h,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: tabs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            current = index;
                                            print('current--> $current');
                                            print('index--> $index');
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          margin: EdgeInsets.all(5.r),
                                          width: 111.w,
                                          height: 35.h,
                                          decoration: BoxDecoration(
                                            border: current == index
                                                ? Border(
                                                    bottom: BorderSide(
                                                        color: const Color
                                                                .fromRGBO(
                                                            242, 78, 30, 1),
                                                        width: 3.0.w,
                                                        style:
                                                            BorderStyle.solid),
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(
                                              tabs[index],
                                              style: GoogleFonts.inter(
                                                  fontSize: current == index
                                                      ? 18.sp
                                                      : 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.normal,
                                                  color: current == index
                                                      ? const Color.fromRGBO(
                                                          242, 78, 30, 1)
                                                      : Color(0XFF6F6F6F)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),

                        /// MAIN BODY
                        Padding(
                          padding: EdgeInsets.only(top: 15.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              tabDetails(
                                  index: index,
                                  transaction: transaction,
                                  valueTab: tabs[current],
                                  callBackFunction: funChange,
                                  valueOfBool: valueOfBool,
                                  indexOfStatutTransaction:
                                      indexOfStatutTransaction,
                                  codeReception: codeReception),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  /* Tab Bar */
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar:
            getFooter(callBackFunction: funChange2, currentIndex: 1),
      ),
    );
  }
}
