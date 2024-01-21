import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/utils/app_images.dart';

extension ImageEtention on String {
  Widget imageFromAsset(
      {double? width,
      double? height,
      Color? color,
      BoxFit? fit = BoxFit.contain}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      color: color,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppImages.placeHolderImage,
          width: width,
          height: height,
          fit: fit,
        );
      },
    );
  }

  Widget imageFromNetwork(
      {double? width, double? height, Color? color, BoxFit? fit}) {
    return CachedNetworkImage(
      imageUrl: this,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
