import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

Dio client() {
  var dio = Dio();

  dio.options.baseUrl = 'https://www.googleapis.com/youtube/v3';
  dio.options.connectTimeout = 10000;
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) => requestInterceptor(options, handler),
    onResponse: (response, handler) => responseInterceptor(response, handler),
    onError: (error, handler) => errorInterceptor(error, handler),
  ));
  return dio;
}

//-- info : onRequest
void requestInterceptor(
  RequestOptions options,
  RequestInterceptorHandler handler,
) {
  logger.d(options);
  handler.next(options);
}

//-- info : onResponse
void responseInterceptor(
    Response response,
    ResponseInterceptorHandler handler,
    ) {
  logger.d(response.data);
  handler.next(response);
}

//-- info : onError
void errorInterceptor(
    DioError error,
    ErrorInterceptorHandler handler,
    ) {
  logger.d(error.message);
  handler.next(error);
}