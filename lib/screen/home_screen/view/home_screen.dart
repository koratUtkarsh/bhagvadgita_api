import 'package:bhagvadgita_api/screen/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.readApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BhagvatGita"),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: homeController.dataList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  homeController.chNo=homeController.dataList[index].id!;

                  Get.toNamed('/slok');

                },
                child: ListTile(
                  leading: Text(
                    "${homeController.dataList[index].id}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "${homeController.dataList[index].nameTranslated}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
