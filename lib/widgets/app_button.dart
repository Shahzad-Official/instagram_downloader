import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pinterest_video_downloader/constants/app_colors.dart';
import 'package:pinterest_video_downloader/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final String text;
  final double? height, width;
  final VoidCallback? onTap;
  final bool isLoading;
  const AppButton({
    Key? key,
    this.color,
    required this.text,
    this.height,
    this.width,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.gradientColors,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: isLoading
                  ? const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 20,
                    )
                  : color != null
                      ? GradientText(
                          text: text,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )
                      : AppText(
                          text: text,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
