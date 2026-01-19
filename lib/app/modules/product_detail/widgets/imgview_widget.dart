import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/error_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/loading_widget.dart';

class ImgviewWidget extends StatelessWidget {
  final List<String> images;
  final int selectedIndex;
  final Function(int) onImageTap;

  const ImgviewWidget({
    super.key,
    required this.images,
    required this.selectedIndex,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- รูปใหญ่ ---
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstant.cardRadius),
          ),
          child: images.isNotEmpty
              ? Image.network(
                  images[selectedIndex],
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return LoadingMoreWidget();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return NoImg();
                  },
                )
              : NoImg(),
        ),

        SizedBox(height: 10.h),

        // --- รูปเล็ก ---
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onImageTap(index),
                child: Container(
                  width: 80.w,
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppConstant.cardRadius),
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.primaryRedColor
                          : AppColors.grayColor,
                      width: 2,
                    ),
                  ),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error_outline),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
