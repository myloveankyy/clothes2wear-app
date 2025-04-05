// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? email,
    String? password,
    String? authToken,
    String? userID,
    String? fullName,
  })  : _email = email,
        _password = password,
        _authToken = authToken,
        _userID = userID,
        _fullName = fullName;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "AuthToken" field.
  String? _authToken;
  String get authToken => _authToken ?? '';
  set authToken(String? val) => _authToken = val;

  bool hasAuthToken() => _authToken != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;

  bool hasUserID() => _userID != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['Email'] as String?,
        password: data['Password'] as String?,
        authToken: data['AuthToken'] as String?,
        userID: data['UserID'] as String?,
        fullName: data['FullName'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Email': _email,
        'Password': _password,
        'AuthToken': _authToken,
        'UserID': _userID,
        'FullName': _fullName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Password': serializeParam(
          _password,
          ParamType.String,
        ),
        'AuthToken': serializeParam(
          _authToken,
          ParamType.String,
        ),
        'UserID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'FullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['Password'],
          ParamType.String,
          false,
        ),
        authToken: deserializeParam(
          data['AuthToken'],
          ParamType.String,
          false,
        ),
        userID: deserializeParam(
          data['UserID'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['FullName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        password == other.password &&
        authToken == other.authToken &&
        userID == other.userID &&
        fullName == other.fullName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([email, password, authToken, userID, fullName]);
}

UserStruct createUserStruct({
  String? email,
  String? password,
  String? authToken,
  String? userID,
  String? fullName,
}) =>
    UserStruct(
      email: email,
      password: password,
      authToken: authToken,
      userID: userID,
      fullName: fullName,
    );
