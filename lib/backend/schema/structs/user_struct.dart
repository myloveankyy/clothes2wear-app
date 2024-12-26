// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? name,
    String? username,
    int? phoneNumber,
    int? showSplash,
  })  : _name = name,
        _username = username,
        _phoneNumber = phoneNumber,
        _showSplash = showSplash;

  // "Name" field.
  String? _name;
  String get name => _name ?? 'Aniket Pradhan';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Username" field.
  String? _username;
  String get username => _username ?? 'myloveankyy';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "Phone-Number" field.
  int? _phoneNumber;
  int get phoneNumber => _phoneNumber ?? 8638019522;
  set phoneNumber(int? val) => _phoneNumber = val;

  void incrementPhoneNumber(int amount) => phoneNumber = phoneNumber + amount;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "Show-Splash" field.
  int? _showSplash;
  int get showSplash => _showSplash ?? 0;
  set showSplash(int? val) => _showSplash = val;

  void incrementShowSplash(int amount) => showSplash = showSplash + amount;

  bool hasShowSplash() => _showSplash != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        name: data['Name'] as String?,
        username: data['Username'] as String?,
        phoneNumber: castToType<int>(data['Phone-Number']),
        showSplash: castToType<int>(data['Show-Splash']),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Name': _name,
        'Username': _username,
        'Phone-Number': _phoneNumber,
        'Show-Splash': _showSplash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Username': serializeParam(
          _username,
          ParamType.String,
        ),
        'Phone-Number': serializeParam(
          _phoneNumber,
          ParamType.int,
        ),
        'Show-Splash': serializeParam(
          _showSplash,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['Username'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['Phone-Number'],
          ParamType.int,
          false,
        ),
        showSplash: deserializeParam(
          data['Show-Splash'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        name == other.name &&
        username == other.username &&
        phoneNumber == other.phoneNumber &&
        showSplash == other.showSplash;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, username, phoneNumber, showSplash]);
}

UserStruct createUserStruct({
  String? name,
  String? username,
  int? phoneNumber,
  int? showSplash,
}) =>
    UserStruct(
      name: name,
      username: username,
      phoneNumber: phoneNumber,
      showSplash: showSplash,
    );
