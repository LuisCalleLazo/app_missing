import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/widgets/card/card_person_dev.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MissingScreen extends StatefulWidget {
  const MissingScreen({super.key});

  @override
  State<MissingScreen> createState() => _MissingScreenState();
}

class _MissingScreenState extends State<MissingScreen> {
  bool _isDataLoaded = false;

  void _loadData() {
    final missingProvider =
        Provider.of<MissingProvider>(context, listen: false);
    if (!_isDataLoaded &&
        missingProvider.missingDetails.isEmpty &&
        !missingProvider.isLoading) {
      missingProvider.listDetail(context);
      setState(() {
        _isDataLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("MissingScreen"),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          _loadData();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Personas desaparecidas"),
            automaticallyImplyLeading: false,
          ),
          body: Consumer<MissingProvider>(
            builder: (context, missingProvider, child) {
              return missingProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: missingProvider.missingDetails.length,
                      itemBuilder: (context, index) {
                        final detail = missingProvider.missingDetails[index];
                        return CardPersonDev(data: detail);
                      },
                    );
            },
          )),
    );
  }
}
