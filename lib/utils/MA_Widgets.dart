import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MA_Styles.dart';

// norel-Aboty
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myTextField(
    {text,
    String? icon,
    bool,
    TextEditingController? controller,
    Function? validator}) {
  return Container(
    height: 50,
    child: TextFormField(
      validator: (input) => validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5),
        //  errorStyle: TextStyle(fontSize: 14),
        hintStyle: TextStyle(
          color: AppColors.genderTextColor,
        ),
        hintText: text,
        prefixIcon: Image.asset(
          icon!,
          cacheHeight: 20,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    ),
  );
}

// norel-Aboty
Widget myerrorMessage({text, paddingerror}) {
  return Positioned(
      bottom: 0.h,
      child: Padding(
        padding: EdgeInsets.only(right: paddingerror),
        child: Text(text,
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'DM Sans',
                letterSpacing: 0.1.sp)),
      ));
}

Widget myTextFormField(
    {keyboadtypeinput,
    textLabel,
    textHint,
    String? icon,
    textObscure,
    TextEditingController? controller,
    Function? validator}) {
  return TextFormField(
    obscureText: textObscure,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
              text: textLabel,
              style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DM Sans',
                  letterSpacing: 0.1.sp),
              children: [
                TextSpan(text: '*', style: TextStyle(color: AppColors.orange))
              ]),
        ),
        hintText: textHint,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        errorStyle: TextStyle(
            color: AppColors.orange,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'DM Sans'),
        hintStyle: TextStyle(
          color: AppColors.dark,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          fontFamily: 'DM Sans',
          letterSpacing: 0.1.sp,
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.orange)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.grey,
        )),
        prefixIcon: Padding(
            padding: EdgeInsets.only(
                top: 15.h, bottom: 21.h, left: 8.w, right: 15.w),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                icon!,
                width: 36.w,
                height: 36.h,
              ),
            ))),
    validator: (value) => validator!(value),
    controller: controller,
  );
}

Widget myTextFormField2(
    {keyboadtypeinput,
    textLabel,
    textHint,
    String? icon,
    textObscure,
    TextEditingController? controller,
    Function? validator}) {
  return TextFormField(
    obscureText: textObscure,
    keyboardType: keyboadtypeinput,
    decoration: InputDecoration(
        /*contentPadding:
            EdgeInsets.only(top: 10.h, bottom: 10.h, right: 5.w, left: 5.w),*/
        label: RichText(
          text: TextSpan(
              text: textLabel,
              style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DM Sans',
                  letterSpacing: 0.1.sp),
              children: [
                TextSpan(text: '*', style: TextStyle(color: AppColors.orange))
              ]),
        ),
        hintText: textHint,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedErrorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        errorStyle: TextStyle(
            color: AppColors.orange,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'DM Sans',
            letterSpacing: 0.1.sp),
        hintStyle: TextStyle(
          color: AppColors.dark,
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          fontFamily: 'DM Sans',
          letterSpacing: 0.1.sp,
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.grey,
        )),
        prefixIcon: Padding(
            padding:
                EdgeInsets.only(top: 0.h, bottom: 0.h, left: 5.w, right: 5.w),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  icon!,
                  height: 31.h,
                  width: 33.w,
                )))),
    validator: (value) => validator!(value),
    controller: controller,
  );
}

Widget elevatedButton2({text, Function? onpress}) {
  return ElevatedButton(
    onPressed: () {
      onpress!();
    },
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.orange),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
            EdgeInsets.only(top: 12.h, bottom: 14.h, right: 36.w, left: 35.w)),
        textStyle: MaterialStateProperty.all(TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600))),
    child: Text(text),
  );
}

Widget elevatedButton3({text, Function? onpress}) {
  return ElevatedButton(
    onPressed: () {
      onpress!();
    },
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.orange),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
            EdgeInsets.only(top: 12.h, bottom: 14.h, right: 36.w, left: 35.w)),
        textStyle: MaterialStateProperty.all(TextStyle(
            fontFamily: 'Inter',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600))),
    child: Text(text),
  );
}

Widget titleBar({text, String? icon, nn, ct}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
          iconSize: 70.sp,
          onPressed: () {
            Navigator.push(
                ct, PageRouteBuilder(pageBuilder: (_, __, ___) => nn));
          },
          icon: SvgPicture.asset(icon!)),
      Text(
        text,
        style: TextStyle(
          fontSize: 28.sp,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget myelementSetting({text, String? icon, ct, classname}) {
  return Row(
    children: [
      Padding(padding: EdgeInsets.only(right: 40.w)),
      IconButton(
          onPressed: () {
            Navigator.push(
                ct, PageRouteBuilder(pageBuilder: (_, __, ___) => classname));
          },
          icon: SvgPicture.asset(icon!)),
      SizedBox(
        width: 10.w,
      ),
      TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500)),
        onPressed: () {
          Navigator.push(
              ct, PageRouteBuilder(pageBuilder: (_, __, ___) => classname));
        },
        //padding: EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              fontFamily: 'DM Sans',
              letterSpacing: 0.1.sp,
              color: Colors.black),
        ),
      )
    ],
  );
}

Widget myTextFormField3(
    {keyboadtypeinput,
    textLabel,
    textHint,
    String? icon,
    textObscure,
    TextEditingController? controller,
    Function? validator}) {
  return Container(
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(border: Border.all()),
    child: TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.all(10.0).r,
        labelText: 'Email:',
        labelStyle: TextStyle(color: Colors.red, height: 1.h),
        prefixIcon: Icon(Icons.email_outlined),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        prefixStyle: TextStyle(
          inherit: true,
          color: Colors.red,
        ),
      ),
    ),
  );
}

Widget elevatedButton({text, Function? onpress, width, height}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: AppColors.orange,
    ),
    onPressed: () {
      onpress!();
    },
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

/*Widget elevateButtonRight({text, Function? onpress, Icon? icon}) {
  return ElevatedButton(
    onPressed: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Download'), // <-- Text
        SizedBox(
        width: 5,
        ),
        Icon(icon),
      ],
    ),
    );
}*/

Widget elevatedButtonright({text, Function? onpress, width, height, icon}) {
  return ElevatedButton.icon(
    // <-- ElevatedButton
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: AppColors.orange,
    ),
    onPressed: () {
      onpress!();
    },
    label: Text(
      text,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    icon: icon,
  );
}

Widget textButton({text, fontSize, Color? color}) {
  return TextButton(
    onPressed: null,
    child: Text(
      text,
      style: GoogleFonts.dmSans(color: color, fontSize: fontSize),
    ),
  );
}

Widget myText({text, style, textAlign}) {
  return Text(
    text,
    style: style,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
  );
}

Widget socialAppsIcons({text, Function? onPressed}) {
  return InkWell(
    onTap: () => onPressed!(),
    child: Container(
      margin: EdgeInsets.all(10),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(text),
        ),
      ),
    ),
  );
}
