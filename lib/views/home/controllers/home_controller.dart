import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_video_downloader/utils/storage_utils.dart';
import 'package:pinterest_video_downloader/views/download/download.dart';
import 'package:pinterest_video_downloader/views/home/data/fetch_data.dart';
import 'package:pinterest_video_downloader/views/home/home_view.dart';
import 'package:pinterest_video_downloader/views/home/models/data_model.dart';

enum FileTypes {
  reel,
  video,
  photo,
  story,
  igtv,
}

class HomeController extends GetxController {
  TextEditingController url = TextEditingController();
  final FetchData _fetchData = FetchData();
  FileTypes selectedType = FileTypes.reel;
  changeFileType(FileTypes type) {
    selectedType = type;
    update();
  }

  bool hasError = false;
  changeError(bool value) {
    hasError = value;
    update();
  }

  DataModel data = DataModel();
  bool isLoading = false;
  getData() async {
    data = DataModel();
    isLoading = true;
    update();
    await _fetchData.fetchData(url.text);
    data = _fetchData.dataModel;
    isLoading = false;
    update();
    Get.to(
      () => Download(
        type: selectedType,
      ),
    );
  }

  bool isDownloading = false;
  double progress = 0.0;

  Future<String> pathName() async {
    String path1;
    String extension = ".mp4";
    if (selectedType == FileTypes.photo) {
      path1 = data.data!.data!.first.url!.split("/").last.split(".").first;
      extension = ".png";
    } else {
      path1 = data.data!.data!.first.url!.substring(data.data!.data!.first.url!.length - 20).split("=").first;
    }

    String fileName = "${selectedType.name}_$path1$extension";
    var directory = await StorageUtils.createFolder();
    String filePath = "${directory.path}$fileName";
    return filePath;
  }

  download(context) async {
    progress = 0.0;
    update();
    isDownloading = true;
    update();
    String path = await pathName();

    await Dio().download(
      selectedType == FileTypes.photo ? data.data!.data!.first.thumbnail.toString() : data.data!.data!.first.url.toString(),
      path,
      onReceiveProgress: (count, total) {
        progress = count / total;
        update();
      },
    ).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("File has been Downloaded Successfully"),
        ),
      );
      url.text = "";
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ));
    }).catchError((err) {
      debugPrint(err.toString());
    });
    isDownloading = false;
    update();
  }
}
