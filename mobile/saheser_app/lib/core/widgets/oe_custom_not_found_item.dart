import 'package:flutter/material.dart';
import '../constants/global_constants.dart';
import '../widgets/oe_button.dart';
import '../widgets/oe_custom_label_text.dart';

class OeCustomNotFoundItem extends StatelessWidget {
  final bool isReloadData;
  final String reloadDataText;
  final Function onReload;

  const OeCustomNotFoundItem({Key key, this.isReloadData = false, this.onReload, this.reloadDataText = "Load Data"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomLabelText(text: "Veri Bulunamadı"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.info,
              size: 72,
              color: GlobalConstant.fontColorLive,
            ),
          ),
          isReloadData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OeButton(onTap: () => onReload(), text: reloadDataText),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
