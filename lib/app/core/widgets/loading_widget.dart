import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';


class LoadingWidget extends StatelessWidget {
  final Color? color;
  const LoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.progressiveDots(
      color: color ?? AppColors.whiteColor,
      size: AppConstant.iconLoadingsize,
    );
  }
}

class LoadingCircleWidget extends StatelessWidget {
  final Color? color;
  const LoadingCircleWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: color ?? AppColors.whiteColor,
        size: AppConstant.iconLoadingsize,
      ),
    );
  }
}


class LoadingMoreWidget extends StatelessWidget {
  final Color? color;
  const LoadingMoreWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: color ?? AppColors.primaryRedColor,
        size: AppConstant.iconsize,
      ),
    );
  }
}