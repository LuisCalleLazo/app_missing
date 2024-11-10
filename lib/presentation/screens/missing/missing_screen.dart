import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/widgets/card/card_person_dev.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MissingScreen extends StatelessWidget {
  const MissingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final missingProvider = Provider.of<MissingProvider>(context);
    // Inicia la carga de datos cuando el widget se construye
    if (missingProvider.missingDetails.isEmpty && !missingProvider.isLoading) {
      missingProvider.listDetail(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personas desaparecidas"),
        automaticallyImplyLeading: false,
      ),
      body: missingProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: missingProvider.missingDetails.length,
              itemBuilder: (context, index) {
                final detail = missingProvider.missingDetails[index];
                return CardPersonDev(data: detail);
              },
            ),
    );
  }
}
