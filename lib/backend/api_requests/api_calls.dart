import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Category Group Code

class CategoryGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/api';
  static Map<String, String> headers = {};
  static CategoriesCall categoriesCall = CategoriesCall();
}

class CategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = CategoryGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Categories',
      apiUrl: '${baseUrl}/admin/menu/categories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? accessories(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '65c23155-a575-4a10-9499-224aec8d7b53')]''',
        true,
      ) as List?;
  List? western(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '43477596-82e0-4096-9d36-97c00a9789ca')]''',
        true,
      ) as List?;
  List? kids(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '03be6483-69e1-4acd-a0e6-008417abf4df')]''',
        true,
      ) as List?;
  List? salwarSuit(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '19a414ae-11d6-415c-b1fe-9b070fb95378')]''',
        true,
      ) as List?;
  List? lehenga(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '6b1f9b4c-333c-47c7-827e-336da240a2bd')]''',
        true,
      ) as List?;
  List? occasions(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '714bde57-efd1-4e68-9c5c-587e3c0eda9b')]''',
        true,
      ) as List?;
  List? dressMaterials(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '87b5bd50-3f9e-4dc5-bdc8-db1fd70b6dc8')]''',
        true,
      ) as List?;
  List? saree(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '8b0b29f5-1313-476e-8fc5-62fd6bd3d621')]''',
        true,
      ) as List?;
  List? indoWestern(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == '8d738486-ebd7-48df-a819-f83730f97f4b')]''',
        true,
      ) as List?;
  List? men(dynamic response) => getJsonField(
        response,
        r'''$..subcategories[?(@.categoryId == 'c5b17afe-4cb8-4154-b472-a7fbb070ea1b')]''',
        true,
      ) as List?;
}

/// End Category Group Code

/// Start Payment Group Code

class PaymentGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/';
  static Map<String, String> headers = {};
  static CreateOrderCall createOrderCall = CreateOrderCall();
}

class CreateOrderCall {
  Future<ApiCallResponse> call({
    String? encryptedData = '',
  }) async {
    final baseUrl = PaymentGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "encryptedData": "${escapeStringForJson(encryptedData)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create order',
      apiUrl: '${baseUrl}api/orders/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Cookie':
            'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4OTMzMzkxMy05NDBjLTQ2MzItYjcxYi1kYjY2ZjhlNTg1OTkiLCJlbWFpbCI6ImFua3l5LnBhZGhsZWJoYWlAZ21haWwuY29tIiwicm9sZSI6IkJVWUVSIiwiaWF0IjoxNzQyMjY1NjIyLCJleHAiOjE3NDM0NzUyMjJ9.lKyAht-nOYs2B8Zav1YO4VBVIqraqc8lGJzdKFy4gjU',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Payment Group Code

/// Start Login Group Code

class LoginGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/api';
  static Map<String, String> headers = {};
  static LoginUserCall loginUserCall = LoginUserCall();
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = LoginGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login User',
      apiUrl: '${baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? userEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? userFullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.fullName''',
      ));
  String? userToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.token''',
      ));
}

/// End Login Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
