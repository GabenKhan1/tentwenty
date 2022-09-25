import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/screens/movie_detail_screen/movie_detail_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/theme/values/colors.dart';
import '../../global_widgets/custom_button.dart';
import '../../routes/app_routes.dart';

class MovieDetailScreen extends GetView<MovieDetailController> {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MovieDetailController>(
        builder: (_) {
          return Scaffold(
            body: Scaffold(
              body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height / 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${controller.movieDetailModel.backdropPath.toString()}"),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height * 0.015,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    "Watch",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontSize: 26,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.17,
                              ),
                              Center(
                                child: Text(
                                  "In Thetres ${DateFormat.yMMMEd().format(controller.movieDetailModel.releaseDate ?? DateTime.now())}",
                                  style: const TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              SizedBox(
                                width: Get.width * 0.7,
                                height: Get.height * 0.08,
                                child: CustomElevatedButtonWidget(
                                  onPressed: () {
                                    Get.toNamed(Routes.ticketScreen,
                                        arguments:
                                            controller.movieDetailModel.title);
                                  },
                                  text: "Get Tickets",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 3, color: primary),
                                    borderRadius: BorderRadius.circular(16)),
                                width: Get.width * 0.7,
                                height: Get.height * 0.08,
                                child: CustomElevatedButtonWidget(
                                  color: Colors.transparent,
                                  onPressed: () {
                                    Get.toNamed(Routes.videoPlayerScreen,
                                        arguments: controller
                                            .movieDetailModel.id
                                            .toString());
                                    // Get.to(() => const VideoPlayerScreen(),
                                    //     arguments:
                                    //         controller.movieDetailModel.video,
                                    //     binding: VideoPlayerBindings());
                                  },
                                  icon: Icons.play_arrow,
                                  text: "Watch Trailer",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Geners",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 16),
                              child: SizedBox(
                                width: Get.width,
                                height: 60,
                                child: ListView.builder(
                                    physics: const ScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller
                                            .movieDetailModel.genres?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 6.0, right: 6),
                                          child: chipWidget(
                                              controller.movieDetailModel
                                                      .genres?[index].name ??
                                                  "",
                                              controller
                                                          .movieDetailModel
                                                          .genres?[index]
                                                          .name ==
                                                      "Horror"
                                                  ? green
                                                  : controller
                                                              .movieDetailModel
                                                              .genres?[index]
                                                              .name ==
                                                          "Thriller"
                                                      ? pink
                                                      : controller
                                                                  .movieDetailModel
                                                                  .genres?[
                                                                      index]
                                                                  .name ==
                                                              "Action"
                                                          ? yellow
                                                          : controller
                                                                      .movieDetailModel
                                                                      .genres?[
                                                                          index]
                                                                      .name ==
                                                                  "Adventure"
                                                              ? purple
                                                              : controller
                                                                          .movieDetailModel
                                                                          .genres?[
                                                                              index]
                                                                          .name ==
                                                                      "Science Fiction"
                                                                  ? green
                                                                  : primary));
                                    }),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     chipWidget(
                            //         controller
                            //                 .movieDetailModel.genres?[0].name ??
                            //             "Action",
                            //         Colors.green),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     chipWidget(
                            //         controller
                            //                 .movieDetailModel.genres?[1].name ??
                            //             "Thetre",
                            //         Colors.pink),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     chipWidget(
                            //         controller
                            //                 .movieDetailModel.genres?[2].name ??
                            //             "Science",
                            //         const Color.fromARGB(255, 0, 0, 0)),
                            //     const SizedBox(
                            //       width: 10,
                            //     ),
                            //     chipWidget(
                            //         controller
                            //                 .movieDetailModel.genres?[0].name ??
                            //             "Fication",
                            //         Colors.amber)
                            //   ],
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Overview",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                text: controller.movieDetailModel.overview,
                                style: const TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.black,
                                    fontSize: 18.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Chip chipWidget(String text, Color color) {
  return Chip(
    padding: const EdgeInsets.only(right: 10, bottom: 4, top: 4, left: 10),
    label: Text(
      text,
      style: const TextStyle(
          fontFamily: "Poppins",
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    ),
    backgroundColor: color,
    elevation: 5,
  );
}
