import 'package:flutter/material.dart';

//text form box shadow
final BoxShadow boxShadowForInputText = BoxShadow(
    color: Colors.grey.withOpacity(.5),
    blurRadius: 20.0, // soften the shadow
    spreadRadius: 0.0, //extend the shadow
    offset: Offset(
      5.0, // Move to right 10  horizontally
      5.0, // Move to bottom 10 Vertically
    ));

//card box shadow
final BoxShadow boxShadowCard = BoxShadow(
    color: Colors.black12, offset: Offset(0.0, 10.0), blurRadius: 10.0);
