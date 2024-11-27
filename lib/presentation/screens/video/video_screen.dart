import 'package:app_missing/presentation/provider/missing/missing_provider.dart';
import 'package:app_missing/presentation/provider/video/video_provider.dart';
import 'package:app_missing/presentation/screens/video/video_stream_screen.dart';
import 'package:app_missing/presentation/services/value_notifier_manager.dart';
import 'package:app_missing/presentation/widgets/card/card_video_dev.dart';
import 'package:app_missing/presentation/widgets/dropdown/dropdown_dev.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

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

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  bool _isDataLoaded = false;
  final valueManagerString = ValueNotifierManager<String?>();

  _loadData() {
    final missingProvider = Provider.of<VideoProvider>(context, listen: false);
    if (!_isDataLoaded &&
        missingProvider.videoList.isEmpty &&
        missingProvider.isLoading) {
      missingProvider.getListVideo(context);
      setState(() {
        _isDataLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("VideoScreen"),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          _loadData();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Videos encontrados",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            DropdownDev(
              width: 200,
              heigth: 45,
              items: ["Missing 1", "Missing 2"],
              text: "Missing Search",
              value: valueManagerString.getNotifier('missing_select'),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Consumer<VideoProvider>(
          builder: (context, missingProvider, child) {
            return RefreshIndicator(
              onRefresh: () async {
                missingProvider.setEmptyList();
                setState(() {
                  _isDataLoaded = false;
                  _loadData();
                });
              },
              child: missingProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: missingProvider.videoList.length,
                      itemBuilder: (context, index) {
                        final detail = missingProvider.videoList[index];
                        return CardVideoDev(
                          missingId: detail.id,
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
