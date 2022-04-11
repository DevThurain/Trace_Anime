import 'package:anime_tracker/network/api/tracer_api.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final tracerApi;
  late Dio dio;

  static final DioClient _singleton = DioClient.internal();

  factory DioClient(){
    return _singleton;
  }

  DioClient.internal() {
    dio = Dio();
    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }
  TracerApi getTracerClient() {
    dio.options.headers.addAll({"Content-Type": "multipart/form-data"});
    dio.options.headers.addAll({"Accept": "application/json"});
    tracerApi = TracerApi(dio);
    return tracerApi;
  }
}
