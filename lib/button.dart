import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button{
  final String value;
  final Color bgColor;
  final Color fgColor;

  Button(this.value, this.bgColor, this.fgColor);
}

    List<Button> buttons=[
      Button("C",   const Color(0xff33e53c).withOpacity(0.6),   Colors.grey.shade800),
      Button("+/-", const Color(0xffd7f825).withOpacity(0.7),   Colors.grey.shade800),
      Button("%",   const Color(0xffd7f825).withOpacity(0.7),   Colors.grey.shade800),
      Button("/",   const Color(0xffffb199).withOpacity(0.6),   Colors.white),
      Button("7",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("8",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("9",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("*",   const Color(0xffffb199).withOpacity(0.6),    Colors.white),
      Button("4",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("5",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("6",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("+",   const Color(0xffffb199).withOpacity(0.6),    Colors.white),
      Button("1",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("2",   const Color(0xffe3eeff).withOpacity(0.8),  Colors.grey.shade900),
      Button("3",   const Color(0xffe3eeff).withOpacity(0.8),   Colors.grey.shade900),
      Button("-",   const Color(0xffffb199).withOpacity(0.6),    Colors.white),
      Button(".",   const Color(0xffe3eeff).withOpacity(0.7),   Colors.grey.shade900),
      Button("0",   const Color(0xffe3eeff).withOpacity(0.7),   Colors.grey.shade900),
      Button("=",   const Color(0xff4791db).withOpacity(0.6),    Colors.grey.shade800),


    ];