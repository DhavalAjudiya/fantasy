import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamImagePage extends StatelessWidget {
  TeamImagePage({super.key});
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Image.network(homeController.teamImage.value)],
        ),
      ),
    );
  }
}
