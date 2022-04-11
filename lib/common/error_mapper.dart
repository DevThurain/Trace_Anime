import 'dart:convert';

import 'package:anime_tracker/constants/api_constants.dart';
import 'package:anime_tracker/models/app_error.dart';
import 'package:dio/dio.dart';




class ErrorMapper {
  static mapDioToAppError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        {
          return AppError(
              errorCode: ApiConstants.STATUS_CODE_CONNECT_TIMEOUT,
              message: ApiConstants.app_error_msg_connection_timeout);
        }

      case DioErrorType.receiveTimeout:
        {
          return AppError(
              errorCode: ApiConstants.STATUS_CODE_RECEIVE_TIMEOUT,
              message: ApiConstants.app_error_msg_connection_timeout);
        }

      case DioErrorType.response:
        return AppError(
            errorCode: int.parse(dioError.response!.statusCode.toString()),
            message:
                takeMessageFromDioResponseJsont(dioError.response.toString()));

      default:
        {
          var message = dioError.error ?? "unknown error ";
          return AppError(errorCode: 0, message: message.toString());
        }
    }
  }

  static String takeMessageFromDioResponseJsont(String message) {
    final messageJson = json.decode(message);
    return messageJson['message'].toString();
  }
}
