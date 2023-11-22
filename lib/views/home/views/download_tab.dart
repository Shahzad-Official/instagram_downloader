import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_video_downloader/constants/app_spacing.dart';
import 'package:pinterest_video_downloader/views/home/controllers/home_controller.dart';
import 'package:pinterest_video_downloader/widgets/app_button.dart';

class DownloadTab extends StatelessWidget {
  const DownloadTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          children: [
            AppSpacing.heightspace20,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(FileTypes.values.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: AppButton(
                      onTap: () {
                        _.changeFileType(FileTypes.values[index]);
                      },
                      color: _.selectedType == FileTypes.values[index] ? null : Colors.white,
                      height: 45,
                      width: 75,
                      text: FileTypes.values[index].name.toUpperCase(),
                    ),
                  );
                }),
              ),
            ),
            AppSpacing.heightspace20,
            TextFormField(
              controller: _.url,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                hintText: "Paste Your Link Here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
              ),
            ),
            AppSpacing.heightspace20,
            AppButton(
              height: 45,
              isLoading: _.isLoading,
              onTap: () async {
                await _.getData();
              },
              text: "Download",
            ),
            AppSpacing.heightspace20,
            const Text(
              "Frequently Asked Questions (FAQs)",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ExpansionTile(
              title: Text(
                "1. Is Instagram Downloader safe to use?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                Text(
                  "Instagram Downloader prioritises user safety and employs security measures to protect your data.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            const ExpansionTile(
              title: Text(
                "2. What formats are supported for video downloads?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                Text(
                  "Instagram Downloader supports MP4 format for high-definition video downloads and png for photos.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            const ExpansionTile(
              title: Text(
                "3. Do I need to register or pay to use Instagram Downloader?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                Text(
                  "No, the tool is free, and no registration or fees are required.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            const ExpansionTile(
              title: Text(
                "4. Can I download content on mobile devices?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                Text(
                  "Instagram Downloader is compatible with computers, tablets, and mobile devices.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            AppSpacing.heightspace20,
          ],
        );
      },
    );
  }
}
