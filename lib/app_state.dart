import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userEMAIL = prefs.getString('ff_userEMAIL') ?? _userEMAIL;
    });
    _safeInit(() {
      _userPASSWORD = prefs.getString('ff_userPASSWORD') ?? _userPASSWORD;
    });
    _safeInit(() {
      _UserID = prefs.getString('ff_UserID') ?? _UserID;
    });
    _safeInit(() {
      _CookieTOKEN = prefs.getString('ff_CookieTOKEN') ?? _CookieTOKEN;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _splashSHOW = 0;
  int get splashSHOW => _splashSHOW;
  set splashSHOW(int value) {
    _splashSHOW = value;
  }

  String _userEMAIL = '';
  String get userEMAIL => _userEMAIL;
  set userEMAIL(String value) {
    _userEMAIL = value;
    prefs.setString('ff_userEMAIL', value);
  }

  String _userPASSWORD = '';
  String get userPASSWORD => _userPASSWORD;
  set userPASSWORD(String value) {
    _userPASSWORD = value;
    prefs.setString('ff_userPASSWORD', value);
  }

  String _Cart = '0';
  String get Cart => _Cart;
  set Cart(String value) {
    _Cart = value;
  }

  String _UserID = '';
  String get UserID => _UserID;
  set UserID(String value) {
    _UserID = value;
    prefs.setString('ff_UserID', value);
  }

  String _CookieTOKEN = '';
  String get CookieTOKEN => _CookieTOKEN;
  set CookieTOKEN(String value) {
    _CookieTOKEN = value;
    prefs.setString('ff_CookieTOKEN', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
