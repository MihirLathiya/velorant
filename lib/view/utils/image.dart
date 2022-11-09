import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget ImageLoading({String? url, double? height, double? width, boxFit}) {
  return CachedNetworkImage(
    imageUrl: url!,
    height: height!,
    width: width,
    fit: boxFit,
    placeholder: (context, url) => Image.asset('assets/image/loading.png'),
    errorWidget: (context, url, error) =>
        Image.asset('assets/image/loading.png'),
  );
}
