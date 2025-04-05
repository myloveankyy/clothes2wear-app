// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends BaseStruct {
  ChatMessageStruct({
    String? id,
    String? senderId,
    String? receiverId,
    String? message,
    DateTime? createdAt,
    bool? isUser,
  })  : _id = id,
        _senderId = senderId,
        _receiverId = receiverId,
        _message = message,
        _createdAt = createdAt,
        _isUser = isUser;

  // "id" field.
  String? _id;
  String get id => _id ?? 'default';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "senderId" field.
  String? _senderId;
  String get senderId => _senderId ?? 'default';
  set senderId(String? val) => _senderId = val;

  bool hasSenderId() => _senderId != null;

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? 'default';
  set receiverId(String? val) => _receiverId = val;

  bool hasReceiverId() => _receiverId != null;

  // "message" field.
  String? _message;
  String get message => _message ?? 'default';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime get createdAt =>
      _createdAt ?? DateTime.fromMicrosecondsSinceEpoch(1743186600000000);
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "isUser" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  set isUser(bool? val) => _isUser = val;

  bool hasIsUser() => _isUser != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        id: data['id'] as String?,
        senderId: data['senderId'] as String?,
        receiverId: data['receiverId'] as String?,
        message: data['message'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        isUser: data['isUser'] as bool?,
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'senderId': _senderId,
        'receiverId': _receiverId,
        'message': _message,
        'createdAt': _createdAt,
        'isUser': _isUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'senderId': serializeParam(
          _senderId,
          ParamType.String,
        ),
        'receiverId': serializeParam(
          _receiverId,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'isUser': serializeParam(
          _isUser,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        senderId: deserializeParam(
          data['senderId'],
          ParamType.String,
          false,
        ),
        receiverId: deserializeParam(
          data['receiverId'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        isUser: deserializeParam(
          data['isUser'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        id == other.id &&
        senderId == other.senderId &&
        receiverId == other.receiverId &&
        message == other.message &&
        createdAt == other.createdAt &&
        isUser == other.isUser;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, senderId, receiverId, message, createdAt, isUser]);
}

ChatMessageStruct createChatMessageStruct({
  String? id,
  String? senderId,
  String? receiverId,
  String? message,
  DateTime? createdAt,
  bool? isUser,
}) =>
    ChatMessageStruct(
      id: id,
      senderId: senderId,
      receiverId: receiverId,
      message: message,
      createdAt: createdAt,
      isUser: isUser,
    );
