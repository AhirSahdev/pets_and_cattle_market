import 'package:flutter/material.dart';

class MobileNumberProvider with ChangeNotifier {
  String? _mobileNumber;

  String? get mobileNumber => _mobileNumber;


  void setMobileNumber(String number) {
    _mobileNumber = number;

    notifyListeners();
  }


}
class UserInfoProvider with ChangeNotifier {
  Object? _userDetail;

  Object? get userDetail => _userDetail;


  void setUserDetail(data){
    _userDetail = data;
    notifyListeners();
  }


}

