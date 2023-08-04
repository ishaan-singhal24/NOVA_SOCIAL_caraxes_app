import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class HttpService {
  final String baseUrl;
  final String? authToken;
  final Map<String, String>? addToHeader;

  HttpService({
    required this.baseUrl,
    this.authToken,
    this.addToHeader,
  }) {
    if (addToHeader != null) {
      Map<String, String> thirdMap = {};
      thirdMap.addAll(headers);
      thirdMap.addAll(addToHeader!);
      headers = thirdMap;
    }
  }

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> makeGetRequest(
    String url, {
    String param = '',
    bool nonAuth = false,
    bool needResponseData = false,
  }) async {
    try {
      if (!nonAuth) {
        if (authToken?.isNotEmpty ?? false) {
          headers['Authorization'] = 'Bearer $authToken';
        }
      } else {
        headers.remove('Authorization');
      }
      url = baseUrl + url;
      if (param.isNotEmpty) {
        url = url + param;
      }
      Logger.logMsg(this, url);
      var response = await get(Uri.parse(url), headers: headers);
      return needResponseData ? response : await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makeCustomTokenGetRequest(
      String url, String param, String token) async {
    try {
      url = baseUrl + url + param;
      headers['Authorization'] = 'Bearer $token';
      var response = await get(Uri.parse(url), headers: headers);
      return response;
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makePostRequest(String url, dynamic payload,
      {bool nonAuth = false, bool needResponseData = false}) async {
    try {
      url = baseUrl + url;
      if (!nonAuth) {
        if (authToken?.isNotEmpty ?? false) {
          headers['Authorization'] = 'Bearer $authToken';
        }
      } else {
        headers.remove('Authorization');
      }
      Logger.logMsg(this, url);
      Logger.logMsg(this, payload.toString());
      Logger.logMsg(this, headers.toString());
      var response =
          await post(Uri.parse(url), headers: headers, body: payload);
      print(response.statusCode);
      return needResponseData ? response : await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> makePatchRequest(String url, dynamic payload,
      [bool nonAuth = false, bool needResponseData = false]) async {
    try {
      url = baseUrl + url;
      if (!nonAuth) {
        if (authToken?.isNotEmpty ?? false) {
          headers['Authorization'] = 'Bearer $authToken';
        }
      } else {
        headers.remove('Authorization');
      }

      var response =
          await patch(Uri.parse(url), headers: headers, body: payload);
      return needResponseData ? response : await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makeCustomTokenPatchRequest(
      String url, dynamic payload, String token) async {
    try {
      headers['Authorization'] = 'Bearer $token';
      url = baseUrl + url;
      var response =
          await patch(Uri.parse(url), headers: headers, body: payload);
      return response;
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makePinPostRequest(
      String url, dynamic payload, String token) async {
    try {
      var encodedBody = payload.keys
          .map((key) => '$key=${payload[key]}')
          .join('&')
          .toString();
      url = baseUrl + url;
      var headers = <String, String>{
        'Content-type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var response =
          await post(Uri.parse(url), headers: headers, body: encodedBody);
      return response;
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makeCustomTokenPostRequest(
      String url, dynamic payload, String token,
      [bool needResponseData = false]) async {
    try {
      headers['Authorization'] = 'Bearer $token';
      url = baseUrl + url;
      Logger.logMsg(this, url);
      Logger.logMsg(this, payload.toString());
      var response =
          await post(Uri.parse(url), headers: headers, body: payload);
      return needResponseData ? response : await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makePutRequest(
    String url,
    dynamic payload, [
    bool nonAuth = false,
  ]) async {
    try {
      if (!nonAuth) {
        headers['Authorization'] = 'Bearer $authToken';
      } else {
        headers.remove('Authorization');
      }
      url = baseUrl + url;
      var response = await put(Uri.parse(url), headers: headers, body: payload);
      return await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makeDeleteRequest(
    String url, [
    bool nonAuth = false,
  ]) async {
    try {
      if (!nonAuth) {
        headers['Authorization'] = 'Bearer $authToken';
      } else {
        headers.remove('Authorization');
      }
      url = baseUrl + url;
      var response = await delete(Uri.parse(url), headers: headers);
      return await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makeMultipartPostRequest(
      String url, String filePath, Map<String, String> data,
      {bool nonAuth = false, String fileFieldName = 'file'}) async {
    try {
      return _makeMultipartRequest(
          'POST', url, filePath, data, nonAuth, fileFieldName);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> makeMultipartPatchRequest(
      String url, String filePath, Map<String, String> data,
      [bool nonAuth = false, String fileFieldName = 'file']) async {
    try {
      return _makeMultipartRequest(
          'PATCH', url, filePath, data, nonAuth, fileFieldName);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> _makeMultipartRequest(
      String requestType, String url, String filePath, Map<String, String> data,
      [bool nonAuth = false, String fileFieldName = 'file']) async {
    try {
      var req = MultipartRequest(requestType, Uri.parse(baseUrl + url));
      var headers = <String, String>{
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
      };

      if (!nonAuth) {
        headers['Authorization'] = 'Bearer $authToken';
      }
      if (data.isNotEmpty) {
        req.fields.addAll(data);
      }
      if (filePath.isNotEmpty) {
        req.files.add(await MultipartFile.fromPath(fileFieldName, filePath));
      }
      req.headers.addAll(headers);
      var streamedRes = await req.send();
      var response = await Response.fromStream(streamedRes);
      return await responseData(response);
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      throw FetchDataException(e);
    }
  }

  Future<dynamic> downloadFileRequest(String url) async {
    try {
      var response = await get(Uri.parse(url));
      return response.bodyBytes;
    } on SocketException {
      throw SocketException(AppStrings.noInternet);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> responseData(Response response) async {
    var responseJson = json.decode(response.body);
    Logger.logMsg(this, 'Request status code: ${response.statusCode}');
    Logger.logMsg(this, 'Request response: ${jsonEncode(responseJson)}');
    switch (response.statusCode) {
      case 200:
      case 201:
      case 206:
        // if (response.headers['authorization'] != null) {
        //   authToken = response.headers['authorization'].toString().substring(7);
        //   await SecureStorage().addPreferences(AppKeyNames.auth, authToken);
        // }
        // if (responseJson['error'] == null) {
        //   return responseJson['data'];
        // }
        // throw InvalidDataException(responseJson['message'].toString());
        return responseJson;
      case 400:
      case 510:
      //   throw BadRequestException(responseJson['error']['info']);
      // case 401:
      //   AppEnvironment.navigator
      //       .pushNamedAndRemoveUntil(AuthRoutes.enterMobile, (route) => false);
      //   throw UnauthorisedException(AppStrings.sessionExpired);
      // case 403:
      //   throw BadRequestException(AppStrings.verifyEmail);
      case 404:
      case 500:
      case 503:
        var message = AppStrings.serverError;
        // if (responseJson['error']['info'] != null) {
        //   message = responseJson['error']['info'].toString();
        // } else if (responseJson['error']['name'] != null) {
        //   if (responseJson['error']['name']
        //       .toString()
        //       .contains('JsonWebTokenError')) {
        //     AppEnvironment.navigator.pushNamedAndRemoveUntil(
        //         AuthRoutes.enterMobile, (route) => false);
        //     throw UnauthorisedException(AppStrings.sessionExpired);
        //   }
        //   message = responseJson['error']['name'].toString();
        // }
        throw FetchDataException(message);
      default:
        var message = AppStrings.somethingWrong;
        if (responseJson['error']['info'] != null) {
          message = responseJson['error']['info'].toString();
        } else if (responseJson['error']['message'] != null) {
          message = responseJson['error']['message'].toString();
        }
        throw BadRequestException(message);
    }
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
