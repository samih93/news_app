import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/news_layoutController.dart';
import 'package:news_app/modules/search/searchscreen.dart';
import 'package:news_app/shared/styles/colors.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
      builder: (newsLayoutController) => Scaffold(
        appBar: AppBar(
          title: Text("News"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(NewsSearchScreen());
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  newsLayoutController.onchangeThem();
                  print(newsLayoutController.isDarkMode);
                },
                icon: Icon(Icons.brightness_4_outlined)),
          ],
        ),
        body: newsLayoutController.screens[newsLayoutController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            currentIndex: newsLayoutController.currentIndex,
            onTap: (index) {
              newsLayoutController.onchangeIndex(index);
              if (index == 1) {
                newsLayoutController.getAllSports();
              }
              if (index == 2) {
                newsLayoutController.getAllScience();
              }
            },
            items: newsLayoutController.bottomItems),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     print(newsLayoutController.business.length);
        //   },
        //   child: Icon(Icons.add),
        // ),
      ),
    );
  }
}
