import 'dart:io';

import 'package:app_missing/infraestructure/datasource/missing_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/missing_repository_impl.dart';
import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/widgets/button/btn_text_dev.dart';
import 'package:app_missing/presentation/widgets/card/card_missing_photo.dart';
import 'package:app_missing/presentation/widgets/input/input_image.dart';
import 'package:app_missing/shared/utils/enum_to_value.dart';
import 'package:app_missing/shared/utils/types.dart';
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

  void _deleteImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
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
            ListView.builder(
              itemCount: _imageFiles.length,
              itemBuilder: (context, index) {
                return CardMissingPhoto(
                  fileImage: _imageFiles[index],
                  onDelete: () => _deleteImage(index),
                );
              },
            )
          else
            const Align(
              alignment: Alignment.center,
              child: InputImage(
                label: "Selecciona imágenes",
                icon: Icons.abc,
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
                onPressed: () {},
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
