import 'package:bhagvadgita_api/screen/home_screen/view/home_screen.dart';
import 'package:bhagvadgita_api/screen/slok_screen/view/slok_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: '/', page:() =>  HomeScreen()),
        GetPage(name: '/slok', page:() =>  SlokScreen()),
      ],
    )
  );
}