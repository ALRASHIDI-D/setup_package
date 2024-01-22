import 'package:common_setup/core/extensions/app_size_extension.dart';
import 'package:common_setup/core/extensions/text_style_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/consts.dart';

extension ToastExtension on BuildContext {
  errorToast({String? title, String? content}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      commonSnackBar(
          content: title ?? '',
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          iconData: Icons.error_outline_rounded,
          title: title ?? 'error_title'.tr()),
    );
  }

  SnackBar commonSnackBar(
      {required String content,
      required Color backgroundColor,
      required Color foregroundColor,
      required IconData iconData,
      required String title}) {
    return SnackBar(
      padding: EdgeInsets.zero,
      content: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            constraints: BoxConstraints(minHeight: height * 0.06),
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defualtPadding,
                vertical: AppConstants.defualtPadding),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius:
                    BorderRadius.circular(AppConstants.defualtRadius / 2)),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: foregroundColor,
                  size: 30,
                ),
                emptyWidthBox(width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textStyleRegular().copyWith(
                          color: foregroundColor, fontWeight: FontWeight.bold),
                    ),
                    emptyHeightBox(height * 0.005),
                    SizedBox(
                      width: width * 0.75,
                      child: Text(
                        content,
                        style:
                            textStyleSmall().copyWith(color: foregroundColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );
  }


}
