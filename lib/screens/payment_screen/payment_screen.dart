import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/values/colors.dart';
import '../../global_widgets/custom_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white2,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.11,
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
                          const Center(
                            child: Text(
                              "The King's Man",
                              style: TextStyle(
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
                        "March 5,2021 | 12:30 Hall 1",
                        style: TextStyle(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.08,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.34,
                  child: Container(
                    height: Get.height * 0.25,
                    width: Get.width * 0.8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/3.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/p.png",
                    height: 70,
                    width: 70,
                  ),
                  Image.asset(
                    "assets/m.png",
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 7,
                  color: black2,
                ),
              ),
              Container(
                height: Get.height * 0.4,
                width: Get.width,
                decoration: const BoxDecoration(color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/p.png",
                          height: 50,
                          width: 70,
                        ),
                        const Text(
                          "Selected",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: Get.width * 0.2,
                        ),
                        Image.asset(
                          "assets/p.png",
                          height: 50,
                          width: 70,
                        ),
                        const Text(
                          "Not Available",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/p.png",
                          height: 50,
                          width: 70,
                        ),
                        const Text(
                          "(50\$)     ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: Get.width * 0.2,
                        ),
                        Image.asset(
                          "assets/p.png",
                          height: 50,
                          width: 70,
                        ),
                        const Text(
                          "Regular (50\$)",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16)),
                        width: Get.width * 0.36,
                        height: Get.height * 0.07,
                        child: CustomElevatedButtonWidget(
                            color: Colors.transparent,
                            text: "4/3 row  X",
                            fontSize: 20,
                            onPressed: () {}),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(16)),
                            width: Get.width * 0.3,
                            height: Get.height * 0.08,
                            child: CustomElevatedButtonWidget(
                                color: Colors.transparent,
                                text: "\$ 50",
                                onPressed: () {}),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.03,
                        ),
                        SizedBox(
                          width: Get.width * 0.6,
                          child: CustomElevatedButtonWidget(
                              text: "Proceed to Pay", onPressed: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
