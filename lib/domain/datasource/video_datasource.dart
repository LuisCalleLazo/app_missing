import 'package:dio/dio.dart';

abstract class VideoDatasource {
  Future<Response> getListFounds(int missingId);
}
