import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_pay/core/db/preference_store.dart';
import 'package:smart_pay/core/keys/pref_keys.dart';
import 'package:smart_pay/core/network/base_api.dart';

@lazySingleton
class Api extends BaseApi {
  static Dio? _dio;

  Api() {
    _dio ??= Dio();
  }

  Future<Dio> _getInstance({bool enabledDioLogger = true}) async {
    String? storageToken = sharedPrefUtils.getString(key: PrefKeys.AUTH_TOKEN);

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': storageToken != 'null' ? storageToken : '',
    };

    _dio!.options.headers = headers;
    _dio!.options.responseType = ResponseType.json;

    if (enabledDioLogger) {
      _dio!.interceptors.add(LogInterceptor(
        request: true,
        error: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
    return _dio!;
  }

  // Future<Response> get(
  //   String uri, {
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken? cancelToken,
  //   ProgressCallback? onReceiveProgress,
  // }) async {
  //   final Dio dio = await _getInstance();
  //   return await dio.get(
  //     apiUrl + uri,
  //     queryParameters: queryParameters,
  //     options: options,
  //     cancelToken: cancelToken,
  //     onReceiveProgress: onReceiveProgress,
  //   );
  // }
  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    dynamic data,
  }) async {
    final Dio dio = await _getInstance();
    options ??= Options(method: 'GET');
    return await dio.request(
      apiUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Dio dio = await _getInstance();
    options ??= Options();

    // if (data is Map<String, dynamic> && dataContainsFiles(data)) {
    //   FormData formData = FormData.fromMap({
    //     ...data.map((key, value) => MapEntry(key, prepareFileData(value))),
    //   });
    //   data = formData;
    //   options.contentType = 'multipart/form-data';
    // }

    return await dio.post(
      apiUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Dio dio = await _getInstance();
    options ??= Options();

    // if (data is Map<String, dynamic> && dataContainsFiles(data)) {
    //   FormData formData = FormData.fromMap({
    //     ...data.map((key, value) => MapEntry(key, prepareFileData(value))),
    //   });
    //   data = formData;
    //   options.contentType = 'multipart/form-data';
    // }

    return await dio.put(
      apiUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Dio dio = await _getInstance();
    options ??= Options();

    // if (data is Map<String, dynamic> && dataContainsFiles(data)) {
    //   FormData formData = FormData.fromMap({
    //     ...data.map((key, value) => MapEntry(key, prepareFileData(value))),
    //   });
    //   data = formData;
    //   options.contentType = 'multipart/form-data';
    // }

    return await dio.patch(
      apiUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final Dio dio = await _getInstance();
    return await dio.delete(
      apiUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response> download(String uri, String savePath,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    final Dio dio = await _getInstance();
    return await dio.download(
      apiUrl + uri,
      savePath,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  bool dataContainsFiles(Map<String, dynamic> data) {
    return data.values
        .any((element) => element is File || element is List<File>);
  }

  // dynamic prepareFileData(dynamic value) {
  //   if (value is File) {
  //     return MultipartFile.fromFileSync(value.path,
  //         filename: basename(value.path));
  //   } else if (value is List<File>) {
  //     return value
  //         .map((file) => MultipartFile.fromFileSync(file.path,
  //             filename: basename(file.path)))
  //         .toList();
  //   } else {
  //     return value;
  //   }
  // }
}
