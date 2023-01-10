import 'package:dio/dio.dart';
import 'package:github_api/services/logger.dart';

class WebHttp {
  final Dio _dio = Dio();
  final String accessToken = '';
  final String _baseUrl = 'https://api.GitHub.com';

  WebHttp() {
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.baseUrl = _baseUrl;
    _dio.options.headers = {"Accept": "application/vnd.github+json"};
    _dio.options.headers['Authorization'] = "Token $accessToken";
    _dio.interceptors.add(Logging());
  }

  Future<Response> getUser(String userName) async {
    try {
      return await _dio.get('/users/$userName');
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data;
      } else {
        throw e;
      }
    }
  }

  Future<Response> getRepos(String userName) async {
    try {
      return await _dio.get('/users/$userName/repos');
    } on DioError catch (error) {
      if (error.response != null) {
        throw error.response!.data;
      } else {
        throw error;
      }
    }
  }

  Future<Response> getLanguageUseCountByRegion(
      String language, String location, String year) async {
    try {
      return await _dio.get(
          '/search/users?q=language:$language+created:$year+location:$location');
    } on DioError catch (error) {
      if (error.response != null) {
        throw error.response!.data;
      } else {
        throw error;
      }
    }
  }
}
