import 'dart:io';

import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/infraestructure/models/missing/missing_detail_model.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:flutter/material.dart';

abstract class MissingRepository {
  Future<List<MissingDetail>> listMissingDetail(BuildContext context);
  Future<List<File>> getImgsMissing(
      int missingId, MissingPhotosType type, BuildContext context);
  Future<MissingDetail> createMissing(MissingDetailModel missing, BuildContext context);
}
