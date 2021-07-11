import 'package:flutter/cupertino.dart';
import 'package:saheser_app/core/constants/size_constant.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  EdgeInsets get p_8 => EdgeInsets.all(SizeConstants.size8);
  EdgeInsets get p_16 => EdgeInsets.all(SizeConstants.size16);
  EdgeInsets get p_32 => EdgeInsets.all(SizeConstants.size32);

  EdgeInsets get ph_8 => EdgeInsets.symmetric(horizontal: SizeConstants.size8);
  EdgeInsets get ph_16 => EdgeInsets.symmetric(horizontal: SizeConstants.size16);
  EdgeInsets get ph_32 => EdgeInsets.symmetric(horizontal: SizeConstants.size32);

  EdgeInsets get pv_8 => EdgeInsets.symmetric(vertical: SizeConstants.size8);
  EdgeInsets get pv_16 => EdgeInsets.symmetric(vertical: SizeConstants.size16);
  EdgeInsets get pv_32 => EdgeInsets.symmetric(vertical: SizeConstants.size32);

  EdgeInsets get pt_8 => EdgeInsets.only(top: SizeConstants.size8);
  EdgeInsets get pt_16 => EdgeInsets.only(top: SizeConstants.size16);
  EdgeInsets get pt_32 => EdgeInsets.only(top: SizeConstants.size32);

  EdgeInsets get pb_8 => EdgeInsets.only(bottom: SizeConstants.size8);
  EdgeInsets get pb_16 => EdgeInsets.only(bottom: SizeConstants.size16);
  EdgeInsets get pb_32 => EdgeInsets.only(bottom: SizeConstants.size32);

  EdgeInsets get pr_8 => EdgeInsets.only(right: SizeConstants.size8);
  EdgeInsets get pr_16 => EdgeInsets.only(right: SizeConstants.size16);
  EdgeInsets get pr_32 => EdgeInsets.only(right: SizeConstants.size32);

  EdgeInsets get pl_8 => EdgeInsets.only(left: SizeConstants.size8);
  EdgeInsets get pl_16 => EdgeInsets.only(left: SizeConstants.size16);
  EdgeInsets get pl_32 => EdgeInsets.only(left: SizeConstants.size32);
}
