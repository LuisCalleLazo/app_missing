import 'dart:io';

import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/services/data_to_formdata.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:app_missing/presentation/widgets/input/input_image.dart';
import 'package:app_missing/shared/utils/enum_to_value.dart';
import 'package:app_missing/shared/utils/types.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MissingPhotosPage extends StatefulWidget {
  static String name = "missing_photos";
  const MissingPhotosPage({super.key});

  @override
  State<MissingPhotosPage> createState() => _MissingPhotosPageState();
}

class _MissingPhotosPageState extends State<MissingPhotosPage> {
  final MissingRepositoryImpl repository =
      MissingRepositoryImpl(MissingDatasourceImpl());

  bool _doRequest = false;
  List<File> _imageFiles = [];
  bool _isLoading = false;
  String? _error;
  final ValueNotifier<List<File>> _imageFilesNotifier = ValueNotifier([]);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _checkAndLoadData();
  }

  void _checkAndLoadData() {
    final missingProvider =
        Provider.of<MissingProvider>(context, listen: false);

    switch (missingProvider.thisType) {
      case MissingPhotosType.front:
        if (missingProvider.selectMissing.photosFront) {
          _fetchImages();
        }
        break;
      case MissingPhotosType.left:
        if (missingProvider.selectMissing.photosLeft) {
          _fetchImages();
        }
        break;
      case MissingPhotosType.rigth:
        if (missingProvider.selectMissing.photosRigth) {
          _fetchImages();
        }
        break;
      default:
        if (missingProvider.selectMissing.photosFront) {
          _fetchImages();
        }
        break;
    }
  }

  Future<void> _fetchImages() async {
    setState(() {
      _isLoading = true;
      _doRequest = true;
    });

    try {
      final missingProvider =
          Provider.of<MissingProvider>(context, listen: false);
      final images = await repository.getImgsMissing(
        missingProvider.selectMissing.id,
        missingProvider.thisType,
        context,
      );
      setState(() {
        _imageFiles = images;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final missingProvider =
        Provider.of<MissingProvider>(context, listen: false);
    String textPhotosType = missingProvider.thisType.localizedText('es');
    double widthAll = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fotos de $textPhotosType ${missingProvider.selectMissing.fullName}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else if (_error != null)
            Center(child: Text('Error: $_error'))
          else if (_doRequest && _imageFiles.isEmpty)
            const Center(child: Text('No images available.'))
          else if (_doRequest)
            InputImage(
              label: "Selecciona imágenes",
              icon: Icons.abc,
              initialImages: _imageFiles,
              notifier: _imageFilesNotifier,
            )
          else
            Align(
              alignment: Alignment.center,
              child: InputImage(
                label: "Selecciona imágenes",
                icon: Icons.abc,
                notifier: _imageFilesNotifier,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 30, bottom: 30),
            child: Align(
              alignment: Alignment.bottomRight,
              child: BtnTextDev(
                onPressed: () {
                  context.pop();
                },
                text: "Cancelar",
                width: (widthAll * 0.5) - 90,
                color: const Color.fromARGB(255, 9, 78, 135),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 30),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: BtnTextDev(
                disable: false,
                onPressed: () async {
                  FormData formData = FormData();
                  formData = await DataToFormdata.addImagesFormData(
                      formData, _imageFilesNotifier, "Photos");

                  formData.fields.add(
                    MapEntry(
                      'MissingId',
                      missingProvider.selectMissing.id.toString(),
                    ),
                  );
                  if (!mounted) return;
                  // ignore: use_build_context_synchronously
                  await missingProvider.uploadImagesMissing(formData, context);
                  if (!mounted) return;
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  context.pop();
                },
                text: "Guardar",
                width: (widthAll * 0.5) - 90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
