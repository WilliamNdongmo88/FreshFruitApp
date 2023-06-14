import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MA_Styles.dart';

Widget myTextField({label, text, String? icon, bool, TextEditingController? controller,Function? validator}) {
  return Container(
    height: 50,
    child: TextFormField(

      validator: (input)=> validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
          contentPadding:EdgeInsets.only(top: 5, bottom: 0),
        //  errorStyle: TextStyle(fontSize: 14),
          hintStyle: TextStyle(
            fontSize: 18, color: AppColors.genderTextColor,
          ),
          labelStyle: TextStyle(fontSize: 18, color: AppColors.grayText),
          hintText: text,
          labelText: label,
          prefixIcon: Image.asset(
            icon!,
            cacheHeight: 20,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),


  );
}

Widget elevatedButtonright({text, Function? onpress, width, height, icon}){
  return ElevatedButton.icon(   // <-- ElevatedButton
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

Widget textButton({text, fontSize, Color? color}){
    return TextButton(
      onPressed: null,
      child: Text(text, style: GoogleFonts.dmSans(color: color, fontSize: fontSize),),
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

Widget socialAppsIcons({text,Function? onPressed}) {
  return InkWell(
    onTap: ()=> onPressed!(),
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

/*Widget dropDownmenuWithSearch({controller, menuItem, itemType}){
  return DropdownMenu<IconLabel>(
      controller: controller,
      enableFilter: false,
      leadingIcon: const Icon(Icons.search),
      label: const Text('Icon'),
      dropdownMenuEntries: menuItem,
      inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (itemType? icon) {
        setState(() {
        selectedIcon = icon;
        });

      },
   );
}*/

/*Widget dropDownmenu({controller, menuItem, itemType}){
    return DropdownMenu<ColorLabel>(
      initialSelection: ColorLabel.green,
      controller: controller,
      label: const Text('Color'),
      dropdownMenuEntries: menuItem,
      onSelected: (ColorLabel? color) {
        setState(() {
          selectedColor = color;
        });
      },
    );
}*/
