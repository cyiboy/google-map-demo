
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';

Color kPrimaryColor = Color(0xFF00A74E);
Color blueLight = Color(0xFF00A74E);
Color primaryText= Color(0xFF434343);
Color secondaryText= Color(0xFF888888);
Color kGrey = Color(0xFFC4C4C4);
Color kGrey2 = Color(0xFFEEEEEE);
Color blueGrey = Color(0xFFD5DDE0);
Color kSecondaryColor = Color(0xFFFEFEFE);

final headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: primaryText,

);

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 2),

  // border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  // enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    // borderRadius: BorderRadius.all(Radius.circular(1)),
    borderSide: BorderSide(color: kPrimaryColor),

  );
}


const GOOGLE_MAPS_API_KEY = "AIzaSyCWmG9Ea98O1RgB1j-oUR8AtlQCcTueTwM";
const COUNTRY = "NG";

GoogleMapsPlaces places = GoogleMapsPlaces(apiKey: GOOGLE_MAPS_API_KEY);