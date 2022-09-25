import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/global_widgets/movie_card.dart';
import 'package:flutter_tentwenty_app/screens/watch_screen/watch_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class WatchScreen extends GetView<WatchController> {
  const WatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WatchController>(builder: (_) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Watch",
                    style: TextStyle(
                        fontFamily: "Popins",
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.searchScreen);
                    },
                    icon: const FaIcon(
                      Icons.search,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.movieModel.results?.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18.0, top: 16),
                      child: GestureDetector(
                        onTap: () async {
                          await Get.toNamed(Routes.movieDetailScreen,
                              arguments: controller
                                  .movieModel.results![index].id
                                  .toString());
                        },
                        child: VideoCard(
                            name: controller.movieModel.results?[index].title
                                    .toString() ??
                                "",
                            imageUrl:
                                "https://image.tmdb.org/t/p/original/${controller.movieModel.results?[index].posterPath.toString()}"),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
