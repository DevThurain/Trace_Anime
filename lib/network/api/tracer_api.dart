import 'dart:io';

import 'package:anime_tracker/constants/api_constants.dart';
import 'package:anime_tracker/models/search_results.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tracer_api.g.dart';

@RestApi(baseUrl: ApiConstants.BASED_URL)
abstract class TracerApi {
  factory TracerApi(Dio dio) = _TracerApi;

  @GET('/search')
  Future<SearchResult> searchWithUrl(@Query('url') String url);

  @POST('/search')
  @MultiPart()
  Future<SearchResult> searchWithImage(@Path('image') File image);

}
