import 'package:app_missing/presentation/widgets/card/card_missing_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InputImage extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? initialImageUrl;
  final List<File>? initialImages;
  final ValueNotifier<List<File>> notifier;

  const InputImage({
    super.key,
    required this.label,
    required this.icon,
    this.initialImageUrl,
    this.initialImages,
    required this.notifier,
  });

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  late List<File> _selectedImages;
  @override
  void initState() {
    _selectedImages = widget.initialImages ?? [];
    widget.notifier.value = _selectedImages;
    super.initState();
  }

  final int _maxImages = 5;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images != null && images.isNotEmpty) {
      setState(() {
        // Añadir las imágenes seleccionadas hasta un máximo de 5.
        final newImages = images
            .map((image) => File(image.path))
            .take(_maxImages - _selectedImages.length)
            .toList();
        _selectedImages.addAll(newImages);
        widget.notifier.value = _selectedImages;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          vertical: 8.0, horizontal: 20.0),
      child: ListView(
        children: [
          _selectedImages.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.6, // Ajusta el 100.0 según el alto de cada elemento.
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CardMissingPhoto(
                          fileImage: _selectedImages[index],
                          onDelete: () {
                            setState(() {
                              _selectedImages.removeAt(index);
                              widget.notifier.value = _selectedImages;
                            });
                          },
                        ),
                      );
                    },
                  ),
                )
              : const Align(
                  alignment: Alignment.center,
                  child: Text("No hay imagenes registradas"),
                ),
          Row(
            children: [
              const Icon(Icons.image),
              const SizedBox(
                width: 15,
              ),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 179, 0, 1),
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: _selectedImages.length < _maxImages ? _pickImage : null,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange[140],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.amber),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, size: 40, color: Colors.amber),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Selecciona una imagen',
                    style: TextStyle(color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          if (_selectedImages.length > _maxImages)
            const Text(
              'No puedes agregar más de 5 imágenes',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
