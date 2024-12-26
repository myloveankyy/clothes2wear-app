import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Registeration Group Code

class RegisterationGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/api';
  static Map<String, String> headers = {};
  static SendEmailPasswordCall sendEmailPasswordCall = SendEmailPasswordCall();
  static SendEmailAndOTPCall sendEmailAndOTPCall = SendEmailAndOTPCall();
  static SendFirstAndLastNameCall sendFirstAndLastNameCall =
      SendFirstAndLastNameCall();
}

class SendEmailPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = RegisterationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Email Password',
      apiUrl: '$baseUrl/auth/app-register',
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
}

class SendEmailAndOTPCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
  }) async {
    final baseUrl = RegisterationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "otp": "${escapeStringForJson(otp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Email and OTP',
      apiUrl: '$baseUrl/auth/app-register/verify-otp',
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
}

class SendFirstAndLastNameCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
    String? lastName = '',
  }) async {
    final baseUrl = RegisterationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "firstName": "${escapeStringForJson(firstName)}",
  "lastName": "${escapeStringForJson(lastName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send First and Last Name',
      apiUrl: '$baseUrl/auth/app-register/change-name',
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

  List? cartItems(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems''',
        true,
      ) as List?;
  String? fullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.fullName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  List? wishlist(dynamic response) => getJsonField(
        response,
        r'''$.user.wishlistItem''',
        true,
      ) as List?;
  List? userREVIEW(dynamic response) => getJsonField(
        response,
        r'''$.user.reviews''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End Registeration Group Code

/// Start Login Group Code

class LoginGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/api';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
}

class LoginCall {
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
      callName: 'Login',
      apiUrl: '$baseUrl/auth/login',
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
  dynamic loginUSER(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? loginUSERID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? loginEMAIL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? loginFULLNAME(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.fullName''',
      ));
  List? loginCART(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems''',
        true,
      ) as List?;
  List? loginWISHLIST(dynamic response) => getJsonField(
        response,
        r'''$.user.wishlistItem''',
        true,
      ) as List?;
  List? loginREVIEWS(dynamic response) => getJsonField(
        response,
        r'''$.user.reviews''',
        true,
      ) as List?;
}

/// End Login Group Code

/// Start Home Page Designs Group Code

class HomePageDesignsGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/api';
  static Map<String, String> headers = {};
  static ShowcaseCall showcaseCall = ShowcaseCall();
  static HeroSlidersCall heroSlidersCall = HeroSlidersCall();
  static NewArrivalsCall newArrivalsCall = NewArrivalsCall();
  static WhatsTrendingCall whatsTrendingCall = WhatsTrendingCall();
  static NewsArrivalsCall newsArrivalsCall = NewsArrivalsCall();
}

class ShowcaseCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HomePageDesignsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Showcase',
      apiUrl: '$baseUrl/customs/showcases/get',
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

  List? showcases(dynamic response) => getJsonField(
        response,
        r'''$.showcases''',
        true,
      ) as List?;
  String? showcaseID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.showcases[:].id''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.showcases[:].title''',
      ));
  String? imgurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.showcases[:].imageUrl''',
      ));
  String? hyperlink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.showcases[:].hyperLink''',
      ));
  String? createddDATE(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.showcases[:].createdAt''',
      ));
  String? updatedAT(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.showcases[:].updatedAt''',
      ));
  List? categoryHYPERLINK(dynamic response) => getJsonField(
        response,
        r'''$.showcases[:].categoryHyperLink''',
        true,
      ) as List?;
}

class HeroSlidersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HomePageDesignsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Hero Sliders',
      apiUrl: '$baseUrl/customs/hero-sliders/get',
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

  List? heroSliders(dynamic response) => getJsonField(
        response,
        r'''$.heroSliders''',
        true,
      ) as List?;
  List<String>? herloSliderIDs(dynamic response) => (getJsonField(
        response,
        r'''$.heroSliders[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.heroSliders[:].imageUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hyperLink(dynamic response) => (getJsonField(
        response,
        r'''$.heroSliders[:].hyperLink''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? categoryLink(dynamic response) => getJsonField(
        response,
        r'''$.heroSliders[:].categoryHyperLink''',
        true,
      ) as List?;
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.heroSliders[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.heroSliders[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NewArrivalsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HomePageDesignsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'New Arrivals',
      apiUrl: '$baseUrl/customs/new-arrivals/get',
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

  List? newArrivals(dynamic response) => getJsonField(
        response,
        r'''$.newArrivals''',
        true,
      ) as List?;
  List<String>? newArrivalsID(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].imageUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hyperlink(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].hyperLink''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? mrp(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].mrp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? upatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class WhatsTrendingCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HomePageDesignsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Whats Trending',
      apiUrl: '$baseUrl/customs/trending/get',
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

  List? trendingProducts(dynamic response) => getJsonField(
        response,
        r'''$.trendingProducts''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? videoURL(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].videoUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? craetedAt(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatarUrl(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].avatarUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hyperLink(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].hyperLink''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? price(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.trendingProducts[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NewsArrivalsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = HomePageDesignsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'News Arrivals',
      apiUrl: '$baseUrl/customs/new-arrivals/get',
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

  List? newArrivals(dynamic response) => getJsonField(
        response,
        r'''$.newArrivals''',
        true,
      ) as List?;
  List<String>? updatedAt(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? mrp(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].mrp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? hyperlink(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].hyperLink''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? imageUrl(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].imageUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.newArrivals[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Home Page Designs Group Code

/// Start User Data Group Code

class UserDataGroup {
  static String getBaseUrl() => 'https://www.clothes2wear.com/api';
  static Map<String, String> headers = {};
  static SingleUserDataCARTCall singleUserDataCARTCall =
      SingleUserDataCARTCall();
  static SingleUserDataWISHLISTCall singleUserDataWISHLISTCall =
      SingleUserDataWISHLISTCall();
  static SingleUserDataCall singleUserDataCall = SingleUserDataCall();
}

class SingleUserDataCARTCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? data = '',
  }) async {
    final baseUrl = UserDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Single User Data CART',
      apiUrl: '$baseUrl/users/get/single-user',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': userID,
        'data': data,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  List? cartItems(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems''',
        true,
      ) as List?;
  List<String>? cartID(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cartItemsUpdated(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].updatedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? cartProducts(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems[:].product''',
        true,
      ) as List?;
  List<String>? cartProductID(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cartProductTitle(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? quantity(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].quantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? cartProductSLUG(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? cratProductThumbnail(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.thumbnailUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? carProductPRICE(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.displayPrice''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? cartProductINVENTORY(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory''',
        true,
      ) as List?;
  List<String>? cartproductInventoryID(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? inventoryID(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].productId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? mrp(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].mrp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? size(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].size''',
        true,
      ) as List?;
  List<String>? sizeID(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].size.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sizeName(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].size.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sizeSlug(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].size.slug''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? stock(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].stock''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? minQuantity(dynamic response) => (getJsonField(
        response,
        r'''$.user.cartItems[:].product.inventory[:].minQuantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? productDiscounts(dynamic response) => getJsonField(
        response,
        r'''$.user.cartItems[:].product.discounts''',
        true,
      ) as List?;
  int? currentPage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.currentPage''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalPages''',
      ));
  int? totalItems(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalItems''',
      ));
}

class SingleUserDataWISHLISTCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? data = '',
  }) async {
    final baseUrl = UserDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Single User Data WISHLIST',
      apiUrl: '$baseUrl/users/get/single-user',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
        'data': data,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstName''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  List? wishlist(dynamic response) => getJsonField(
        response,
        r'''$.user.wishlist''',
        true,
      ) as List?;
  dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.user.wishlist[:].product''',
      );
  String? productID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.wishlist[:].product.id''',
      ));
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.wishlist[:].product.title''',
      ));
  String? slug(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.wishlist[:].product.slug''',
      ));
  String? thumbnailURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.wishlist[:].product.thumbnailUrl''',
      ));
  int? displayprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user.wishlist[:].product.displayPrice''',
      ));
  int? totalpages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalPages''',
      ));
  int? currentpage(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.currentPage''',
      ));
  int? totalItems(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalItems''',
      ));
}

class SingleUserDataCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = UserDataGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Single User Data',
      apiUrl: '$baseUrl/users/get/single-user',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.firstName''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  List? address(dynamic response) => getJsonField(
        response,
        r'''$.user.addresses''',
        true,
      ) as List?;
  String? addressID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].id''',
      ));
  String? useraddressID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].userId''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].fullName''',
      ));
  String? addressLine1(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].addressLine1''',
      ));
  String? addressLine2(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].addressLine2''',
      ));
  bool? isdefault(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.user.addresses[:].isDefault''',
      ));
  String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].state''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].city''',
      ));
  String? zipcode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].zipCode''',
      ));
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].country''',
      ));
  String? mobilenumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].mobileNumber''',
      ));
  String? createdAT(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].createdAt''',
      ));
  String? updatedAT(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.addresses[:].updatedAt''',
      ));
  String? userStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.status''',
      ));
}

/// End User Data Group Code

class RemoveCartCall {
  static Future<ApiCallResponse> call({
    String? cartitemid = '16099eb4-3386-4c67-85c2-d085ccaab6ba',
  }) async {
    final ffApiRequestBody = '''
{
  "cartItemId": "${escapeStringForJson(cartitemid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Remove Cart',
      apiUrl: 'https://www.clothes2wear.com/api/cart/remove',
      callType: ApiCallType.POST,
      headers: {
        'x-middleware-set-cookie':
            'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4OTMzMzkxMy05NDBjLTQ2MzItYjcxYi1kYjY2ZjhlNTg1OTkiLCJlbWFpbCI6ImFua3l5LnBhZGhsZWJoYWlAZ21haWwuY29tIiwicm9sZSI6IkJVWUVSIiwiaWF0IjoxNzM0OTU3NDEzLCJleHAiOjE3MzYxNjcwMTN9.E2En3wRccWsfDAipGPXVVcNzRGHwcOShHkNZu15H-Lw;',
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
