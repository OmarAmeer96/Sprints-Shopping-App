import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/core/theming/font_family_helper.dart';

class Styles {
  static TextStyle font22AppBar = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: FontFamilyHelper.suwannaphumBlack,
  );

  static TextStyle font20HeaderSection = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: FontFamilyHelper.suwannaphumBold,
  );

  static TextStyle font14HeaderSection = TextStyle(
    color: Colors.deepOrange,
    fontSize: 14,
    fontFamily: FontFamilyHelper.suwannaphumRegular,
  );

  static TextStyle font14ProductName = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: FontFamilyHelper.suwannaphumBold,
  );

  static TextStyle font12ProductPrice = TextStyle(
    color: Colors.grey[800],
    fontSize: 12,
    fontFamily: FontFamilyHelper.suwannaphumRegular,
  );
}
