import 'dart:io';

import 'package:app_missing/domain/entities/missing.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:flutter/material.dart';

abstract class MissingRepository {
  Future<List<MissingDetail>> listMissingDetail(BuildContext context);
  Future<List<File>> getImgsMissing(int missingId, MissingPhotosType type, BuildContext context);
}
