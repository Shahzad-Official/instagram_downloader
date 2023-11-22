import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pinterest_video_downloader/views/home/models/data_model.dart';

class FetchData {
  DataModel dataModel = DataModel();
  fetchData(String url) async {
    var body = jsonEncode({"url": url});

    await post(
      Uri.parse("https://chapbuy.com/social-downloader/social-downloader/insta-fb"),
      body: body,
      headers: {
        "Content-Type": "application/json",
      },
    ).then((value) {
      var data = jsonDecode(value.body);
      if (data['success']) {
        dataModel = DataModel.fromJson(data);
      } else {
        Get.snackbar("Error", data['message'].toString());
      }
    }).catchError((err) {
      debugPrint("fetch error => $err");
    });
  }
}
