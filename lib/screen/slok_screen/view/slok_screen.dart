import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen/controller/home_controller.dart';

class SlokScreen extends StatefulWidget {
  const SlokScreen({super.key});

  @override
  State<SlokScreen> createState() => _SlokScreenState();
}

class _SlokScreenState extends State<SlokScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getSlokApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Slok"),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: homeController.slokList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  "${homeController.slokList[index].id}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "${homeController.slokList[index].text}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
