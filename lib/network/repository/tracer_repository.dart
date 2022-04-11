import 'dart:io';

import 'package:anime_tracker/models/app_error.dart';
import 'package:anime_tracker/models/search_results.dart';
import 'package:dartz/dartz.dart';

abstract class TracerRepository {
  Future<Either<AppError, SearchResult>> searchWithUrl(String url);
  Future<Either<AppError, SearchResult>> searchWithImage(File image);
}
