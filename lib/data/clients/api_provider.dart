import 'package:dio/dio.dart';

import '../models/api_result.dart';
import '../models/endpoint.dart';

abstract class ApiProviderProtocol {
  Future<ApiResult> request({required Endpoint endpoint});
}

class ApiProvider implements ApiProviderProtocol {
  final _dio = Dio();

  ApiProvider({required String baseUrl}) {
    _dio.options.baseUrl = baseUrl;
  }
  
  @override
  Future<ApiResult> request({required Endpoint endpoint}) async {
    try {
      final response = await _dio.request(
        endpoint.path,
        data: endpoint.body,
        queryParameters: endpoint.queryParameters,
        options: Options(
          method: endpoint.method,
        ),
      );

      return ApiSuccess(data: response.data);
    } on DioException catch (error) {
      return ApiError(message: error.toString());
    }
  }
}