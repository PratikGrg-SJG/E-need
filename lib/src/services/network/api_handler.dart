import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:e_needs/src/core/development/console.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../core/app/texts.dart';
import '../../core/configs/api_config.dart';
import '../../core/error/api_exceptions.dart';
import '../../core/error/failures.dart';
import '../../features/user/auth/presentation/screens/login/login_screen.dart';
import '../../models/common_http_status_code_model.dart';
import '../../utils/custom_toasts.dart';
import '../local/secure_storage.dart';

class ApiHandler {
  static const int timeOutDuration = 60;
  var client = http.Client();
  final Map<String, String> _headers = {
    contentTypeText: applicationJsonText,
    acceptText: applicationJsonText
  };

  //DELETE
  Future<dynamic> delete(String api,
      {dynamic payloadObj, bool isauth = true}) async {
    var uri = Uri.parse(ApiConfig.baseUrl + api);
    var token = SharedPreference.getAuthToken();
    String? payload;
    if (payloadObj != null) {
      payload = json.encode(payloadObj);
    }
    try {
      var response = await http
          .delete(uri,
              body: payload,
              headers: isauth == true
                  ? {
                      contentTypeText: applicationJsonText,
                      acceptText: applicationJsonText,
                      authorizationText: "Bearer $token"
                    }
                  : _headers)
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  //GET
  Future<dynamic> get(
    String api, {
    Map<String, String>? header,
    bool? isauth = false,
    bool isCustomApi = false,
    String? context,
  }) async {
    print("i am inside search map");
    var uri = isCustomApi == true
        ? Uri.parse(api.toString())
        : Uri.parse(ApiConfig.baseUrl + api);

    try {
      String? token;
      if (isauth ?? false) {
        token = SharedPreference.getAuthToken();
      }
      var response = await http
          .get(
            uri,
            headers: header ??
                {
                  contentTypeText: applicationJsonText,
                  acceptText: applicationJsonText,
                  if (isauth ?? false) authorizationText: "Bearer $token"
                },
          )
          .timeout(const Duration(seconds: timeOutDuration));
      console(response.body);
      console(uri);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

//PATCH
  Future<dynamic> patch(String api,
      {dynamic payloadObj, bool? isauth = true}) async {
    var uri = Uri.parse(ApiConfig.baseUrl + api);
    try {
      var payload = json.encode(payloadObj);
      var token = SharedPreference.getAuthToken();
      var response = await http
          .patch(uri,
              body: payload,
              headers: isauth == true
                  ? {
                      contentTypeText: applicationJsonText,
                      acceptText: applicationJsonText,
                      authorizationText: "Bearer $token"
                    }
                  : _headers)
          .timeout(const Duration(seconds: timeOutDuration));
      console(response.body);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  //PUT
  Future<dynamic> put(String api, dynamic payloadObj,
      {bool? isauth = true}) async {
    var uri = Uri.parse(ApiConfig.baseUrl + api);
    var payload = json.encode(payloadObj);
    var token = await SharedPreference.getAuthToken();
    try {
      var response = await http
          .put(uri,
              body: payload,
              headers: isauth == true
                  ? {
                      contentTypeText: applicationJsonText,
                      acceptText: applicationJsonText,
                      authorizationText: "Bearer $token"
                    }
                  : _headers)
          .timeout(const Duration(seconds: timeOutDuration));
      console(response.body);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  //POST
  Future<dynamic> post(
    String api,
    dynamic payloadObj, {
    bool? isauth = true,
    bool? checkout = false,
    Map<String, String>? checkoutHeader,
    Map<String, String>? header,
    bool? isCustomApi = false,
  }) async {
    // http.Client getClient() => BrowserClient()..withCredentials = true;
    var uri = isCustomApi == true
        ? Uri.parse(api.toString())
        : Uri.parse(ApiConfig.baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var token = await SharedPreference.getAuthToken();

      var response = await http
          .post(
            uri,
            body: payload,
            headers: checkout == true
                ? checkoutHeader
                : isauth == true
                    ? {
                        contentTypeText: applicationJsonText,
                        acceptText: "application/json",
                        authorizationText: "Bearer $token"
                      }
                    : _headers,
          )
          .timeout(
            const Duration(seconds: timeOutDuration),
          );

      console(response.body);
      return _processResponse(response);
    } on SocketException catch (e) {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  Future<dynamic> postWithImage(
    String api, {
    dynamic payloadObj,
    File? file,
    String method = 'POST',
    String? imageKey,
    Map<String, String>? header,
    bool? isauth = false,
  }) async {
    var uri = Uri.parse(
      ApiConfig.baseUrl + api,
    );

    try {
      var token = SharedPreference.getAuthToken();
      // var token = SharedPreference.getAuthToken();

      var request = http.MultipartRequest(method, uri);
      request.headers.addAll(
        isauth == true
            ? {
                contentTypeText: applicationJsonText,
                authorizationText: "Bearer $token"
              }
            : _headers,
      );
      if (file != null) {
        request.files.add(
          await http.MultipartFile.fromPath("$imageKey", file.path,
              contentType: MediaType('image', 'jpg')),
        );
      }

      Map<String, String> serializedData = {};
      payloadObj?.forEach((key, value) {
        if (value is String) {
          serializedData[key] = value;
        } else {
          serializedData[key] = json.encode(value);
        }
      });
      request.fields.addAll(serializedData);
      var data = await request.send();
      var response = await http.Response.fromStream(data);
      console(response.body);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  //multiple images
  Future<dynamic> postWithMultipleImage(
    String api, {
    Map<String, dynamic>? payloadObj,
    List<Map<String, File>>? files,
    String method = 'POST',
    Map<String, String>? header,
    bool? isauth = false,
  }) async {
    var uri = Uri.parse(
      ApiConfig.baseUrl + api,
    );
    try {
      var token = SharedPreference.getAuthToken();
      var request = http.MultipartRequest(method, uri);
      request.headers.addAll(
        isauth == true
            ? {
                contentTypeText: applicationJsonText,
                authorizationText: "Bearer $token"
              }
            : _headers,
      );
      if ((files?.isNotEmpty ?? false)) {
        for (var data in files!) {
          for (var e in data.entries) {
            request.files.add(
              await http.MultipartFile.fromPath(
                e.key,
                e.value.path,
                contentType: MediaType('image', 'jpg'),
              ),
            );
          }
        }
      }

      Map<String, String> serializedData = {};
      payloadObj?.forEach((key, value) {
        if (value is String) {
          serializedData[key] = value;
        } else if (value is List) {
          serializedData[key] = json.encode(value.join(","));
        } else {
          serializedData[key] = json.encode(value);
        }
      });

      request.fields.addAll(serializedData);

      var data = await request.send();
      var response = await http.Response.fromStream(data);
      console(response.body);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  Future<dynamic> postWithImages(
    String api, {
    Map<String, dynamic>? payloadObj,
    File? file1,
    File? file2,
    String method = 'POST',
    String? image1Key,
    String? image2Key,
    Map<String, String>? header,
    bool? isauth = false,
  }) async {
    var uri = Uri.parse(
      ApiConfig.baseUrl + api,
    );
    try {
      var token = SharedPreference.getAuthToken();
      var request = http.MultipartRequest(method, uri);
      request.headers.addAll(
        isauth == true
            ? {
                contentTypeText: applicationJsonText,
                authorizationText: "$bearerText $token"
              }
            : _headers,
      );
      if (file1 != null) {
        request.files.add(
          await http.MultipartFile.fromPath("$image1Key", file1.path,
              contentType: MediaType('image', 'jpg')),
        );
      }
      if (file2 != null) {
        request.files.add(
          await http.MultipartFile.fromPath("$image2Key", file2.path,
              contentType: MediaType('image', 'jpg')),
        );
      }

      Map<String, String> serializedData = {};
      payloadObj?.forEach((key, value) {
        if (value is String) {
          serializedData[key] = value;
        } else {
          serializedData[key] = json.encode(value);
        }
      });

      request.fields.addAll(serializedData);

      var data = await request.send();
      var response = await http.Response.fromStream(data);
      console(response.body);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(noInternetConnectionText, uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
    }
  }

  void logout({required BuildContext context}) async {
    await SharedPreference.resetCredentials();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
    successToast(msg: "Successfully logged out");
  }

  dynamic _processResponse(http.Response response) async {
    print("I am inside :: _processResponse");
    switch (response.statusCode) {
      case 200:
      case 201:
      case 304:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson.toString();
      case 401:
        String? res = _customHttpStatusCodeHandler(response);
        if (res != null) {
          throw ApiFailure(
            json.decode(response.body)["message"],
            customCode: json.decode(response.body)["customCode"],
          );
        }

      default:
        String? res = _customHttpStatusCodeHandler(response);
        if (res != null) {
          throw ApiFailure(
            json.decode(response.body)["message"],
            customCode: json.decode(response.body)["customCode"],
          );
        }
        throw ApiException(
          json.decode(response.body)["message"],
          response.request?.url.toString(),
        );
    }
  }

  String? _customHttpStatusCodeHandler(http.Response response) {
    var responseJson = utf8.decode(response.bodyBytes);
    CommonHttpStatusCodeModel commonHttpStatusCodeModel =
        commonHttpStatusCodeModelFromJson(responseJson.toString());
    print("I am inside :: _customHttpStatusCodeHandler");
    print(commonHttpStatusCodeModel.toJson());

    if (commonHttpStatusCodeModel.customCode == 1002 ||
        commonHttpStatusCodeModel.customCode == 1003 ||
        commonHttpStatusCodeModel.customCode == 400) {
      return responseJson.toString();
    } else {
      return null;
    }
  }
}
