import 'package:app_missing/domain/datasource/missing_datasource.dart';
import 'package:dio/dio.dart';
import '../../presentation/services/api_client_secure.dart';
import '../../shared/utils/types.dart';

class MissingDatasourceImpl extends MissingDatasource {
  final Dio _client = apiSecure;

  @override
  Future<Response> listMissings() async {
    final response = await _client.get('/api/v1/missing');
    return response;
  }

  @override
  Future<Response> getZipFilesMissing(
      int missingId, MissingPhotosType type) async {
    final response = await _client.get(
      '/api/v1/missing/$missingId/${type.index}',
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    return response;
  }

  @override
  Future<Response> createMissing(Map<String, dynamic> missing) async {
    final response = await _client.post(
      '/api/v1/missing',
      data: missing,
    );
    return response;
  }

  @override
  Future<Response> deleteMissing(int missingId) async {
    final response = await _client.delete('/api/v1/missing/$missingId');
    return response;
  }

  @override
  Future<Response> updateMissing(
      Map<String, dynamic> missing, int missingId) async {
    final response = await _client.put(
      '/api/v1/missing/$missingId',
      data: missing,
    );
    return response;
  }

  @override
  Future<Response> uploadPhotosMissing(
      FormData photosMissing, MissingPhotosType type) async {
    final response = await _client.post(
      '/api/v1/missing/photos/${type.index}',
      data: photosMissing,
    );
    return response;
  }

  @override
  Future<Response> listMissingSingle() async {
    final response = await _client.get('/api/v1/missing/single');
    return response;
  }
}
