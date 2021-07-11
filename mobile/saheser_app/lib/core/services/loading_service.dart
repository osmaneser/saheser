import 'package:flutter/material.dart';
import 'package:saheser_app/core/constants/global_constants.dart';
import 'package:saheser_app/core/widgets/oe_custom_circular_spinner.dart';
import 'package:saheser_app/core/widgets/oe_custom_content_text.dart';

class LoadingService {
  static loadingScreen({BuildContext context, @required bool isOpen, String message = "Yükleniyor..."}) async {
    if (isOpen) {
      return showDialog(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: GlobalConstant.mainBack.withOpacity(0.8),
            content: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: OeCustomSpinner(),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomContentText(
                    text: message,
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      Navigator.pop(context);
    }
  }
}
