import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/screens/search_screen/search_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_textfield.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (_) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 209, 207, 207),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.16,
                width: Get.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomTextFieldWidget(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.grey,
                            ),
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: FaIcon(
                              FontAwesomeIcons.xmark,
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "TV shows, movies and more",
                          elevation: 1,
                          onChanged: controller.search,
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Flexible(
                      //   child: SelectCityButton(
                      //     onTap: () {},
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              controller.searchModel.results == null
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.movieModel.results?.length,
                            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            //   crossAxisCount: 2,
                            //   mainAxisSpacing: 8.0,
                            //   crossAxisSpacing: 8.0,
                            // ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return MovieCard(
                                  name: controller
                                          .movieModel.results?[index].title ??
                                      "",
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/original/${controller.movieModel.results?[index].backdropPath.toString()}");
                            }),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.searchModel.results!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  trailing: const Icon(Icons.menu_sharp),
                                  title: Text(controller
                                          .searchModel.results?[index].title
                                          .toString() ??
                                      ""),
                                  subtitle: Text(controller.searchModel
                                          .results?[index].originalTitle
                                          .toString() ??
                                      ""),
                                  leading: Image(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/original/${controller.searchModel.results?[index].backdropPath.toString()}")),
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

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 6,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop),
            ),
          ),
          // child: Image(
          //   image: AssetImage(imageUrl),
          // ),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
