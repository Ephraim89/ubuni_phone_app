// This Class Handles Json Data from the internet
import 'dart:async';
import 'package:http/http.dart' as http;

class PhoneJson {
  static Future getPhoneJson() {
    return http.get(Uri.parse("https://www.paa.ubuni.co.tz/phones"));
  }
}
