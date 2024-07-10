import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:amjad_solutions_test/constants/api_constants.dart';
import 'package:amjad_solutions_test/services/network_service/api_failure.dart';
import 'package:amjad_solutions_test/services/network_service/api_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiClient {
  static const int _timeOut = 120;
  final _dio = Dio();
  Future<ApiResponse> get(
    String path, {
    String? baseUrl,
    Uri? uri,
    Map<String, String>? headers,
    Map<String, dynamic>? parameters,
    int? timeOut,
  }) async {
    final url =
        uri ?? Uri.http(baseUrl ?? ApiConstants.baseUrl, path, parameters);
    // Logger().i(url);
    return await requestServer(() async {
      final response = await _dio
          .getUri(
            url,
            options: Options(headers: headers),
          )
          .timeout(Duration(seconds: timeOut ?? _timeOut));

      return _handleStatusCode(response);
    });
  }

  Future<ApiResponse> post(
    String path, {
    String? baseUrl,
    Object? body,
    Map<String, String>? headers,
    Map<String, dynamic>? parameters,
  }) async {
    final url = Uri.http(baseUrl ?? ApiConstants.baseUrl, path, parameters);
  Logger().i(url);
  Logger().i(body);
    return await requestServer(() async {
      final response = await _dio
          .postUri(url, data: body, options: Options(headers: headers))
          .timeout(const Duration(seconds: _timeOut));
Logger().d(response.data);
      return _handleStatusCode(response);
    });
  }


  Future<ApiResponse> requestServer(Future Function() computation) async {
    try {
      return await computation();
    } on SocketException {
      throw "No Internet Connection";
    } on FormatException {
      throw "Format Error";
    } on HttpException {
      throw "Something Went Wrong";
    } on TimeoutException {
      throw "Time Out Error";
    } on DioException catch (error) {
      throw _checkDioErrorType(error);
      // throw error;
    }
  }

  _checkDioErrorType(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw "Connection Time out";
      case DioExceptionType.sendTimeout:
        throw "Send Timeout";
      case DioExceptionType.receiveTimeout:
        throw "Receive timeout";
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          _handleStatusCode(error.response!);
        } else {
          throw "Some thing went wrong";
        }
      case DioExceptionType.cancel:
        throw "The request is canceled";
      case DioExceptionType.connectionError:
        throw "Connection Error";
      default:
        throw "Something went wrong";
    }
  }
}

ApiResponse _handleStatusCode(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      final headers = response.headers;
      dynamic body;
      try {
        body = jsonDecode(response.data);
      } catch (error) {
        body = response.data;
      }
      return ApiResponse(
        body: body,
        headers: headers,
        statusCode: response.statusCode
      );
    case 204:
      return ApiResponse(
        body: response.data,
        headers: response.headers,
      );
    case 400:
      throw "Bad Request Error";
    case 401:
    case 403:
      throw AppFailure(
          code: response.statusCode, message: response.data['message']);
    case 422:
      throw AppFailure(
          code: response.statusCode, message: response.data['message']);
    case 404:
      throw "Not Found";
    case 500:
    default:
      throw "internal Server Error";
  }
}
