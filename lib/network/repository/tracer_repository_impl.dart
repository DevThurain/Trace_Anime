import 'dart:io';

import 'package:anime_tracker/common/error_mapper.dart';
import 'package:anime_tracker/models/search_results.dart';
import 'package:anime_tracker/models/app_error.dart';
import 'package:anime_tracker/network/api/tracer_api.dart';
import 'package:anime_tracker/network/client/dio_client.dart';
import 'package:anime_tracker/network/repository/tracer_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class TracerRepositoryImpl extends TracerRepository {
  late final TracerApi tracerApi;

  static final TracerRepositoryImpl _singleton =
      TracerRepositoryImpl.internal();

  factory TracerRepositoryImpl() {
    return _singleton;
  }

  TracerRepositoryImpl.internal() {
    tracerApi = DioClient().getTracerClient();
  }

  @override
  Future<Either<AppError, SearchResult>> searchWithUrl(String url) async {
    try {
      var response = await tracerApi.searchWithUrl(url);
      return Right(response);
    } on DioError catch (e) {
      return Left(ErrorMapper.mapDioToAppError(e));
    } on JsonUnsupportedObjectError catch (_) {
      return Left(AppError(errorCode: 0, message: "Respond is not Json"));
    } on TypeError catch (_) {
      return Left(AppError(errorCode: 0, message: "Invalid Json Type"));
    }
  }

  @override
  Future<Either<AppError, SearchResult>> searchWithImage(File image) async {
    try {
      var response = await tracerApi.searchWithImage(image);
      return Right(response);
    } on DioError catch (e) {
      return Left(ErrorMapper.mapDioToAppError(e));
    } on JsonUnsupportedObjectError catch (_) {
      return Left(AppError(errorCode: 0, message: "Respond is not Json"));
    } on TypeError catch (_) {
      return Left(AppError(errorCode: 0, message: "Invalid Json Type"));
    }
  }
}
