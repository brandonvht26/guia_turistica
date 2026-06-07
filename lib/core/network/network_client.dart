import 'package:dio/dio.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient() : _dio = Dio() {
    _dio.options = BaseOptions(
      // baseUrl: 'https://api.tu-servidor.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // Interceptor para Loguear las peticiones (útil en desarrollo)
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

    // Aquí podrías agregar otro interceptor para manejar el Token de Autenticación
  }

  Dio get dio => _dio;
}
