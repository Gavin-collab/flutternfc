import 'package:flutter/material.dart';

Widget pageButton(
    double height, double width, Function onPressed, String showText) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: height / 7),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Text(
            showText,
            style: TextStyle(color: Colors.white, fontSize: height / 5),
          ),
          decoration: BoxDecoration(
            
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ),
  );
}

Widget textTitle(String content, double fontSize) {
  return Text(
    content,
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.w700,
      fontSize: fontSize
    ),
  );
}
