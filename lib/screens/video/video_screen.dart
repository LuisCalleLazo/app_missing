import 'package:app_missing/components/button/btn_text_dev.dart';
import 'package:app_missing/components/card/card_person_dev.dart';
import 'package:app_missing/components/card/card_video_dev.dart';
import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
];

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videos encontrados"),
        automaticallyImplyLeading: false,
      ),
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Placeholder(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.transparent,
            height: 70,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Datos del video"),
                ),
                const FieldView(
                  fieldName: "Fecha",
                  value: Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Text("2024 / 12 /08 | 23:34:12"),
                  ),
                ),
                const FieldView(
                  fieldName: "Duracion",
                  value: Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Text("10 [min]"),
                  ),
                ),
                FieldView(
                  fieldName: "Ubicación",
                  value: BtnTextDev(
                    text: "Google Maps",
                    onPressed: () {},
                    width: 120,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return const CardVideoDev();
            },
          ),
        ),
      ]),
    );
  }
}
