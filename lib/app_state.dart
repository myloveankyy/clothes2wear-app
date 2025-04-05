import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

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
      _LightBG = prefs.getString('ff_LightBG') ?? _LightBG;
    });
    _safeInit(() {
      _DarkBG = prefs.getString('ff_DarkBG') ?? _DarkBG;
    });
    _safeInit(() {
      _OrderDetails = prefs.getString('ff_OrderDetails') ?? _OrderDetails;
    });
    _safeInit(() {
      _Response = prefs.getString('ff_Response') ?? _Response;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_orderJSON')) {
        try {
          _orderJSON = jsonDecode(prefs.getString('ff_orderJSON') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _supportActivity = prefs.getInt('ff_supportActivity') ?? _supportActivity;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_UserDatabase')) {
        try {
          final serializedData = prefs.getString('ff_UserDatabase') ?? '{}';
          _UserDatabase =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _LightBG =
      'https://images.unsplash.com/photo-1707061788728-faccae9ed5d5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8ZGF5JTIwdmlld3xlbnwwfHx8fDE3NDIyMDQxNjZ8MA&ixlib=rb-4.0.3&q=80&w=1080';
  String get LightBG => _LightBG;
  set LightBG(String value) {
    _LightBG = value;
    prefs.setString('ff_LightBG', value);
  }

  String _DarkBG =
      'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxuaWdodHxlbnwwfHx8fDE3NDIyMDY1OTl8MA&ixlib=rb-4.0.3&q=80&w=1080';
  String get DarkBG => _DarkBG;
  set DarkBG(String value) {
    _DarkBG = value;
    prefs.setString('ff_DarkBG', value);
  }

  String _OrderDetails =
      '{\"userId\":\"89333913-940c-4632-b71b-db66f8e58599\",\"totalPrice\":5000,\"orderItems\":[{\"productId\":\"0201e940-204f-40bc-b166-33e00b9e47c9\",\"sizeId\":\"1c48ccd0-97ea-48bb-9599-ca2b940f9905\",\"imageId\":\"4813277b-6eed-4044-a294-904e85ff0457\",\"quantity\":2,\"price\":5000,\"colorId\":\"9d2c32d3-5e5f-4f8a-9fad-228fe63783eb\"}]}';
  String get OrderDetails => _OrderDetails;
  set OrderDetails(String value) {
    _OrderDetails = value;
    prefs.setString('ff_OrderDetails', value);
  }

  String _Response = '';
  String get Response => _Response;
  set Response(String value) {
    _Response = value;
    prefs.setString('ff_Response', value);
  }

  dynamic _orderJSON = jsonDecode(
      '{\"userId\":\"89333913-940c-4632-b71b-db66f8e58599\",\"totalPrice\":5000,\"orderItems\":[{\"productId\":\"0201e940-204f-40bc-b166-33e00b9e47c9\",\"sizeId\":\"1c48ccd0-97ea-48bb-9599-ca2b940f9905\",\"imageId\":\"4813277b-6eed-4044-a294-904e85ff0457\",\"quantity\":2,\"price\":5000,\"colorId\":\"9d2c32d3-5e5f-4f8a-9fad-228fe63783eb\"}]}');
  dynamic get orderJSON => _orderJSON;
  set orderJSON(dynamic value) {
    _orderJSON = value;
    prefs.setString('ff_orderJSON', jsonEncode(value));
  }

  int _supportActivity = 0;
  int get supportActivity => _supportActivity;
  set supportActivity(int value) {
    _supportActivity = value;
    prefs.setInt('ff_supportActivity', value);
  }

  UserStruct _UserDatabase = UserStruct();
  UserStruct get UserDatabase => _UserDatabase;
  set UserDatabase(UserStruct value) {
    _UserDatabase = value;
    prefs.setString('ff_UserDatabase', value.serialize());
  }

  void updateUserDatabaseStruct(Function(UserStruct) updateFn) {
    updateFn(_UserDatabase);
    prefs.setString('ff_UserDatabase', _UserDatabase.serialize());
  }

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
  }

  String _publicKey = '';
  String get publicKey => _publicKey;
  set publicKey(String value) {
    _publicKey = value;
  }

  List<ChatMessageStruct> _chatMessages = [];
  List<ChatMessageStruct> get chatMessages => _chatMessages;
  set chatMessages(List<ChatMessageStruct> value) {
    _chatMessages = value;
  }

  void addToChatMessages(ChatMessageStruct value) {
    chatMessages.add(value);
  }

  void removeFromChatMessages(ChatMessageStruct value) {
    chatMessages.remove(value);
  }

  void removeAtIndexFromChatMessages(int index) {
    chatMessages.removeAt(index);
  }

  void updateChatMessagesAtIndex(
    int index,
    ChatMessageStruct Function(ChatMessageStruct) updateFn,
  ) {
    chatMessages[index] = updateFn(_chatMessages[index]);
  }

  void insertAtIndexInChatMessages(int index, ChatMessageStruct value) {
    chatMessages.insert(index, value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  String _receiverId = '0';
  String get receiverId => _receiverId;
  set receiverId(String value) {
    _receiverId = value;
  }

  bool _isConnected = false;
  bool get isConnected => _isConnected;
  set isConnected(bool value) {
    _isConnected = value;
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  set errorMessage(String value) {
    _errorMessage = value;
  }

  List<String> _onlineUsers = [];
  List<String> get onlineUsers => _onlineUsers;
  set onlineUsers(List<String> value) {
    _onlineUsers = value;
  }

  void addToOnlineUsers(String value) {
    onlineUsers.add(value);
  }

  void removeFromOnlineUsers(String value) {
    onlineUsers.remove(value);
  }

  void removeAtIndexFromOnlineUsers(int index) {
    onlineUsers.removeAt(index);
  }

  void updateOnlineUsersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    onlineUsers[index] = updateFn(_onlineUsers[index]);
  }

  void insertAtIndexInOnlineUsers(int index, String value) {
    onlineUsers.insert(index, value);
  }

  List<String> _chatPairs = [];
  List<String> get chatPairs => _chatPairs;
  set chatPairs(List<String> value) {
    _chatPairs = value;
  }

  void addToChatPairs(String value) {
    chatPairs.add(value);
  }

  void removeFromChatPairs(String value) {
    chatPairs.remove(value);
  }

  void removeAtIndexFromChatPairs(int index) {
    chatPairs.removeAt(index);
  }

  void updateChatPairsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    chatPairs[index] = updateFn(_chatPairs[index]);
  }

  void insertAtIndexInChatPairs(int index, String value) {
    chatPairs.insert(index, value);
  }

  String _socketAuthToken = '';
  String get socketAuthToken => _socketAuthToken;
  set socketAuthToken(String value) {
    _socketAuthToken = value;
  }

  dynamic _mainSocket;
  dynamic get mainSocket => _mainSocket;
  set mainSocket(dynamic value) {
    _mainSocket = value;
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
