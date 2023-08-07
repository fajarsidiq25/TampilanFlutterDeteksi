import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(Routes.DASBOARD);
            },
          ),
        ),
        body: Column(children: <Widget>[
          Text(
            'DETEKSI RAUT WAJAH',
            style: TextStyle(fontSize: 24, fontFamily: "Serif", height: 2.0),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Image(
          //       image: CachedNetworkImageProvider(
          //           "https://res.cloudinary.com/dk55ik2ah/image/upload/v1683267510/motor_lvmf4f.jpg"),
          //       width: 150,
          //       height: 200,
          //     ),
          //     Image(
          //       image: CachedNetworkImageProvider(
          //           "https://res.cloudinary.com/dk55ik2ah/image/upload/v1683267510/sepeda_bs1421.jpg"),
          //       width: 150,
          //       height: 200,
          //     ),
          //   ],
          // )
        ]));
  }
}
