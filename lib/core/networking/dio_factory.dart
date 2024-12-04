import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeout = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio(
        BaseOptions(
          connectTimeout: timeout,
          receiveTimeout: timeout,
        ),
      );
      addDioInterceptor();
      return dio!;
    }
    return dio!;
  }

  static void addDioInterceptor() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}
