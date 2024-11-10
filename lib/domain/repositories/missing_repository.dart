import 'package:app_missing/domain/entities/missing.dart';
import 'package:flutter/material.dart';

abstract class MissingRepository {
  Future<List<MissingDetail>> listMissingDetail(BuildContext context);
}
