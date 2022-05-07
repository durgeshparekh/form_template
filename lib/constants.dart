import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF75589C);
const kProgressColor = Color(0xFFE2AE7E);
const kPrimaryLightColor = Color(0xFF8B74B1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF5C4789), Color(0xFF8262A6)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kWhiteTextColor = Color(0xFFFFFFFF);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Minimum 6 characters required";
const String kMatchPassError = "Passwords don't match";
const String kCompanyNameNullError = "Please enter your company name";
const String kAnnualRevenueNullError = "Please enter annual revenue";
const String kInvalidMobileError = "Please enter valid mobile number";
const String kAddressNullError = "Please enter your address";

Map<String, dynamic> formData = {};
