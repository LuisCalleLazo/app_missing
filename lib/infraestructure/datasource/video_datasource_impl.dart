import 'package:app_missing/domain/datasource/video_datasource.dart';
import 'package:app_missing/presentation/services/api_client_secure.dart';
import 'package:dio/dio.dart';

class VideoDatasourceImpl extends VideoDatasource {
  final Dio _client = apiSecure;

  @override
  Future<Response> getListFounds(int missingId) async {
    final response = await _client.get('/api/v1/found/list/$missingId');
    return response;
  }
}
