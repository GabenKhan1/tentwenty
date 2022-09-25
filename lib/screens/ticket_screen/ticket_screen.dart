import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/core/theme/values/colors.dart';
import 'package:flutter_tentwenty_app/global_widgets/custom_button.dart';
import 'package:flutter_tentwenty_app/routes/app_routes.dart';
import 'package:flutter_tentwenty_app/screens/ticket_screen/ticket_controller.dart';
import 'package:get/get.dart';

class TicketScreen extends GetView<TicketController> {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.13,
                width: Get.width,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.2,
                          ),
                          Center(
                            child: Text(
                              controller.title ?? "The King's Man",
                              style: const TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Center(
                      child: Text(
                        "In Theaters December 22, 2021",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: primary,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 18.0, top: 100),
                child: Text(
                  "Date",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 16),
                child: SizedBox(
                  width: Get.width,
                  height: 60,
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 6.0, right: 6),
                            child: chipWidget("5 Mar"));
                      }),
                ),
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.34,
                  child: ListView.builder(
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "12:30",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "CineTech + Hall 1",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Container(
                                height: Get.height * 0.25,
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: const DecorationImage(
                                      image: AssetImage("assets/3.jpeg"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Row(
                                children: const [
                                  Text(
                                    "From",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    " 50\$ ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    " or ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "2500 bonus",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 18.0),
                child: CustomElevatedButtonWidget(
                    text: "Select Seats",
                    onPressed: () {
                      Get.toNamed(Routes.paymentScreen);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Chip chipWidget(String text) {
  return Chip(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))),
    padding: const EdgeInsets.only(right: 18, bottom: 14, top: 14, left: 18),
    label: Text(
      text,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    backgroundColor: primary,
    elevation: 5,
  );
}
