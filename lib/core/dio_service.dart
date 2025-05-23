import 'dart:io';

import 'package:VOX/core/package_info_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_service.g.dart';

@Riverpod(keepAlive: true)
Dio dioService(Ref ref) {
  final packageInfo = ref.watch(packageInfoServiceProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: const String.fromEnvironment('API_URL'),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {HttpHeaders.userAgentHeader: packageInfo.value ?? ''},
    ),
  );
  dio.interceptors.add(QueuedInterceptor());
  return dio;
}
