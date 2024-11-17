
import 'package:dio/dio.dart';
import '../../shared/utils/types.dart';

abstract class MissingDatasource {
  Future<Response> listMissings();
  Future<Response> getZipFilesMissing(int missingId, MissingPhotosType type);
  Future<Response> createMissing(Map<String, dynamic> missing);
}
