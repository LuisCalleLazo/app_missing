import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/models/missing/missing_detail_model.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:app_missing/shared/constants/default_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:dio/dio.dart';
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

  Future<void> updateMissingDetail(
      MissingDetail newValue, int missingId, BuildContext context) async {
    // Haciendo peticion
    final newValueMissing = await missingRepo.updateMissing(
        MissingDetailModel.toModel(newValue), missingId, context);

    // Actualizar el registro de la lista
    int index = _missingDetails.indexWhere((detail) => detail.id == missingId);
    _missingDetails[index] = newValueMissing;
    notifyListeners();
  }

  Future<void> deleteMisssingDetail(int missingId, BuildContext context) async {
    await missingRepo.deleteMissing(missingId, context);
    int index = _missingDetails.indexWhere((detail) => detail.id == missingId);
    _missingDetails.remove(_missingDetails[index]);
    notifyListeners();
  }

  Future<void> addMissingDetail(
      MissingDetail newValue, BuildContext context) async {
    // Haciendo peticion
    final newValueMissing = await missingRepo.createMissing(
        MissingDetailModel.toModel(newValue), context);

    // Agregar a la lista el nuevo registro
    _missingDetails.add(newValueMissing);
    notifyListeners();
  }

  // Estado de tipo de foto
  MissingPhotosType _typePhotos = MissingPhotosType.front;
  MissingPhotosType get thisType => _typePhotos;

  void setTypePhotos(MissingPhotosType type) {
    _typePhotos = type;
    notifyListeners();
  }

  Future<void> uploadImagesMissing(FormData data, BuildContext context) async {
    await missingRepo.uploadPhotosMissing(data, thisType, context);
    switch (thisType) {
      case MissingPhotosType.front:
        selectMissing.photosFront = true;
        break;
      case MissingPhotosType.left:
        selectMissing.photosLeft = true;
        break;
      case MissingPhotosType.rigth:
        selectMissing.photosRigth = true;
        break;
      default:
        selectMissing.photosFront = false;
        selectMissing.photosLeft = false;
        selectMissing.photosRigth = false;
        break;
    }
    notifyListeners();
  }
}
