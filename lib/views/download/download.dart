import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinterest_video_downloader/constants/app_spacing.dart';
import 'package:pinterest_video_downloader/views/home/controllers/home_controller.dart';
import 'package:pinterest_video_downloader/widgets/app_button.dart';
import 'package:pinterest_video_downloader/widgets/app_text.dart';
import 'package:pinterest_video_downloader/widgets/app_video_player.dart';
import 'package:pinterest_video_downloader/widgets/gradient_app_bar.dart';

class Download extends StatefulWidget {
  final FileTypes type;
  const Download({
    super.key,
    required this.type,
  });

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  final HomeController _controller = Get.put(HomeController());
  @override
  void initState() {
    _controller.hasError = false;
    Permission.manageExternalStorage.request();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(
        titleText: "Download File",
        actions: [],
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (_) {
            if (_.data.data == null) {
              return const Center(
                child: AppText(
                  text: "No Data Found!",
                ),
              );
            } else {
              return Column(
                children: [
                  AppSpacing.heightspace10,
                  widget.type == FileTypes.photo
                      ? Expanded(
                          child: Image.network(
                            _.data.data!.data!.first.thumbnail.toString(),
                          ),
                        )
                      : Expanded(
                          child: AppVideoPlayer(
                            url: _.data.data!.data!.first.url.toString(),
                          ),
                        ),
                  AppSpacing.heightspace10,
                  _.isDownloading
                      ? Column(
                          children: [
                            Text(
                              "Downloading  ${(_.progress * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            AppSpacing.heightspace5,
                            LinearProgressIndicator(
                              value: _.progress,
                              minHeight: 7,
                            ),
                            AppSpacing.heightspace10,
                          ],
                        )
                      : const SizedBox(),
                  _.hasError
                      ? const SizedBox()
                      : Center(
                          child: AppButton(
                            height: 55,
                            width: 150,
                            onTap: _.isDownloading
                                ? () {}
                                : () async {
                                    await _.download(context);
                                  },
                            text: "Download",
                          ),
                        ),
                  AppSpacing.heightspace20,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
