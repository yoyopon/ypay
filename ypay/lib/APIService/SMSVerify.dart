import 'package:http/http.dart' as http;
import 'dart:convert';

class URLS {
  static const String BASE_URL = 'http://sms.roloq.com:97/api';
}

class SMSVerify {
  static Future<String> SMSSent(String phoneNo, String codeno) async {
    final response = await http.get(
        '${URLS.BASE_URL}/sms_otp.aspx?_phoneno=${phoneNo}&_content=${codeno} is verification code from +Mya Thinn Kyu&_username=0936847970&_pass_word=aa47970&_brand_name=MyaThinnKyu');
    if (response.statusCode == 200) {
      return codeno;
    } else {
      return null;
    }
  }
}
