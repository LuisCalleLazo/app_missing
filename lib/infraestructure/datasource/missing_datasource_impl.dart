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
}
