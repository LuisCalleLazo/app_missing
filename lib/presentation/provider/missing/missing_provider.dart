import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:app_missing/shared/constants/default_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:flutter/material.dart';

class MissingProvider extends ChangeNotifier {
  final MissingRepositoryImpl missingRepo =
      MissingRepositoryImpl(MissingDatasourceImpl());

  // Estado de lista de personas desaparecidas
  List<MissingDetail> _missingDetails = [];
  bool _isLoading = true;

  // Estado de persona seleccionada
  bool forCreate = true;
  MissingDetail selectMissing = defaultMissingDetail;

  List<MissingDetail> get missingDetails => _missingDetails;
  bool get isLoading => _isLoading;

  Future<void> listDetail(BuildContext context) async {
    _missingDetails = await missingRepo.listMissingDetail(context);
    _isLoading = false;
    notifyListeners();
  }

  void setEmptyList() {
    _missingDetails = [];
    _isLoading = true;
    notifyListeners();
  }

  // Método para actualizar forCreate
  void setForCreate(bool value) {
    forCreate = value;
    notifyListeners();
  }

  // Método para actualizar selectMissing
  void setSelectMissing(MissingDetail value) {
    selectMissing = value;
    notifyListeners();
  }

  // Estado de tipo de foto
  MissingPhotosType _typePhotos = MissingPhotosType.front;
  MissingPhotosType get thisType => _typePhotos;

  void setTypePhotos(MissingPhotosType type) {
    _typePhotos = type;
    notifyListeners();
  }
}
