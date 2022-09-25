import 'package:flutter_tentwenty_app/routes/app_routes.dart';
import 'package:flutter_tentwenty_app/screens/dashboard/dashboard.dart';
import 'package:flutter_tentwenty_app/screens/dashboard/dashboard_binding.dart';
import 'package:flutter_tentwenty_app/screens/movie_detail_screen/movie_detail_binding.dart';
import 'package:flutter_tentwenty_app/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:flutter_tentwenty_app/screens/payment_screen/payment_screen.dart';
import 'package:flutter_tentwenty_app/screens/search_screen/search_binding.dart';
import 'package:flutter_tentwenty_app/screens/search_screen/search_screen.dart';
import 'package:flutter_tentwenty_app/screens/ticket_screen/ticket_binding.dart';
import 'package:flutter_tentwenty_app/screens/ticket_screen/ticket_screen.dart';
import 'package:flutter_tentwenty_app/screens/videoplayer/video_player_binding.dart';
import 'package:flutter_tentwenty_app/screens/watch_screen/watch_binding.dart';
import 'package:flutter_tentwenty_app/screens/watch_screen/watch_screen.dart';
import 'package:get/route_manager.dart';

import '../screens/videoplayer/video_player_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => Dashboard(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.searchScreen,
      page: () => const SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.movieDetailScreen,
      page: () => const MovieDetailScreen(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: Routes.watchScreen,
      page: () => const WatchScreen(),
      binding: WatchBinding(),
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: Routes.ticketScreen,
      page: () => const TicketScreen(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: Routes.videoPlayerScreen,
      page: () => const VideoPlayerScreen(),
      binding: VideoPlayerBindings(),
    ),
  ];
}
