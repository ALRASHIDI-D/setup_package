import 'dart:convert';
import 'dart:io';

import 'package:common_setup/core/api_helper/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../cache_helper/cache_helper.dart';
import 'package:common_setup/dependency_injection.dart' as di;

import '../utils/entities/customize_app_entity.dart';
import 'error_exceptions.dart/server_exception.dart';
import 'status_codes.dart';

class DioProvider extends ApiConsumer {
  final Dio dioClient;
  final CacheHelper cacheHelper;

  DioProvider({required this.dioClient, required this.cacheHelper}) {
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
    dioClient.options
      ..headers = {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        "Connection": "keep-alive"
      }
      ..validateStatus(200)
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 30)
      ..receiveDataWhenStatusError = true
      ..followRedirects = false;
    if (!kReleaseMode) {
      dioClient.interceptors.add(PrettyDioLogger(
          responseBody: true, requestHeader: true, requestBody: true));
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters, bool sendToken = false}) async {
    await handleSendToken(sendToken);
    try {
      final response =
          await dioClient.get(path, queryParameters: queryParameters);
      return handleResposneAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {required body,
      Map<String, dynamic>? queryParameters,
      bool sendToken = false}) async {
    await handleSendToken(sendToken);
    try {
      final response = await dioClient.post(path, data: body);

      return handleResposneAsJson(
        response,
      );
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  handleSendToken(bool sendToken) async {
    if (di.sl<CustomizeAppEntity>().appUseToken ?? false) {
      String? token = await cacheHelper.getToken();
      if (sendToken) {
        if ((token?.isNotEmpty) ?? false) {
          dioClient.options.headers.addEntries({
            (di.sl<CustomizeAppEntity>().tokenKeyUsedInApp ?? ''): token
          }.entries);
        } else if (dioClient.options.headers.keys
            .contains(di.sl<CustomizeAppEntity>().tokenKeyUsedInApp)) {
          dioClient.options.headers.remove(
            di.sl<CustomizeAppEntity>().tokenKeyUsedInApp,
          );
        }
      }
    }
  }

  dynamic _handleDioError(DioException error) async {
    // var log = {
    //   "status_code": error.response?.statusCode,
    //   "request_url": error.response?.realUri.toString(),
    //   "request_body": error.requestOptions.data,
    //   "request_response": error.response?.data,
    // };
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException('ُTime out');
      case DioExceptionType.badCertificate:
        throw const UnauthorizedException('');
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();

          case StatusCode.unauthorized:
            throw UnauthorizedException(
                error.response?.data?['Message'] ?? 'Unauthorized');
          case StatusCode.forbidden:
            throw UnauthorizedException(
                error.response?.data?['Message'] ?? 'Unauthorized');

          case StatusCode.notFound:
            throw const NotFoundException();
          default:
            throw const FormatDataException();
        }

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      case DioExceptionType.cancel:
        throw const InternalServerErrorException();

      default:
        throw const FormatDataException();
    }
  }

  dynamic handleResposneAsJson(Response<dynamic> response,
      {bool retiveToken = false}) {
    try {
      if (response.data.runtimeType != String) {
        return response.data;
      }
      return json.decode(response.data);
    } on FormatException catch (_) {
      if (retiveToken) {
        return response.data.toString();
      } else {
        throw const FormatDataException();
      }
    }
  }
}
