import 'package:flutter/material.dart';
import 'package:saheser_app/core/constants/global_constants.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/extensions/size_extension.dart';

class OeThumbnailImage extends StatelessWidget {
  final String path;
  const OeThumbnailImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(SizeConstants.size8)),
        image: DecorationImage(
          image: NetworkImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
