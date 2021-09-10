import 'package:get/get.dart';
import 'package:heroes/app/bindings/detail_binding.dart';
import 'package:heroes/app/bindings/home_binding.dart';
import 'package:heroes/app/bindings/search_binding.dart';
import 'package:heroes/app/ui/pages/detail_page/detail_page.dart';
import 'package:heroes/app/ui/pages/home_page/home_page.dart';
import 'package:heroes/app/ui/pages/search_page/search_page.dart';

import 'app_route.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoute.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoute.DETAIL,
        page: () => DetailPage(),
        binding: DetailBinding()),
    GetPage(
        name: AppRoute.SEARCH,
        page: () => SearchPage(),
        binding: SearchBinding()),
  ];
}
