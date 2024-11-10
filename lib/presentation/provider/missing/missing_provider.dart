import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:flutter/material.dart';

class MissingProvider extends ChangeNotifier {
  final MissingRepositoryImpl missingRepo =
      MissingRepositoryImpl(MissingDatasourceImpl());
  List<MissingDetail> _missingDetails = [];
  bool _isLoading = false;
  List<MissingDetail> get missingDetails => _missingDetails;
  bool get isLoading => _isLoading;

  Future<void> listDetail(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    _missingDetails = await missingRepo.listMissingDetail(context);
    _isLoading = false;
    notifyListeners();
  }
}
