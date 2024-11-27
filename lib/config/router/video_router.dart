import 'package:app_missing/presentation/pages/video/video_detail_page.dart';
import 'package:app_missing/presentation/pages/video/video_play_page.dart';
import 'package:app_missing/presentation/pages/video/video_stream_page.dart';
import 'package:go_router/go_router.dart';

const String pathBase = "/video";

final List<GoRoute> videoRoutes = [
  GoRoute(
    path: '$pathBase/detail',
    name: VideoDetailPage.name,
    builder: (context, state) => const VideoDetailPage(),
  ),
  GoRoute(
    path: '$pathBase/play',
    name: VideoPlayPage.name,
    builder: (context, state) => const VideoPlayPage(),
  ),
  GoRoute(
    path: '$pathBase/stream',
    name: VideoStreamPage.name,
    builder: (context, state) => const VideoStreamPage(),
  ),
];
