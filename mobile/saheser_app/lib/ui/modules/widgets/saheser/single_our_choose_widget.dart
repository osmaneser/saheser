import 'package:flutter/material.dart';
import 'package:saheser_app/core/constants/size_constant.dart';
import 'package:saheser_app/core/widgets/image/oe_custom_thumbnail_image.dart';

class SingleOurChooseWidget extends StatelessWidget {
  final String imgUrl;
  const SingleOurChooseWidget({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(SizeConstants.size8),
        child: OeThumbnailImage(path: imgUrl),
      ),
    );
  }
}
