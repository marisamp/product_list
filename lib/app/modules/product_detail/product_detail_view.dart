import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_colors.dart';
import 'package:mimi_select_product_list_project/app/core/app_style/app_text.dart';
import 'package:mimi_select_product_list_project/app/core/constant.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/appbar_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/bottomnav_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/error_widget.dart';
import 'package:mimi_select_product_list_project/app/core/widgets/loading_widget.dart';
import 'package:mimi_select_product_list_project/app/modules/product_detail/product_detail_controller.dart';
import 'package:mimi_select_product_list_project/app/modules/product_detail/widgets/btn_widget.dart';
import 'package:mimi_select_product_list_project/app/modules/product_detail/widgets/imgview_widget.dart';
import 'package:mimi_select_product_list_project/app/modules/product_detail/widgets/txt_card_widget.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  var controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppbarWidget(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingCircleWidget(color: AppColors.primaryRedColor);
        }

        if (controller.product.value.id == null) {
          return NoData(
            onPressed: () =>
                controller.fetchProductDetail(controller.currentId!),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstant.defaulthoriPadding,
            vertical: AppConstant.defaultveriPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // back btn
              GobackBtn(),
              SizedBox(height: 30.h),
              // content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => ImgviewWidget(
                          images: controller.product.value.images ?? [],
                          selectedIndex: controller.selectedImageIndex.value,
                          onImageTap: (index) {
                            controller.changeSelectedImage(index);
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      RowtxtWidget(
                        txt1: controller.product.value.brand ??
                            AppConstant.nodata,
                        txt2:
                            controller.product.value.sku ?? AppConstant.nodata,
                      ),
                      AppText(
                        controller.product.value.title ?? AppConstant.nodata,
                        maxLines: 2,
                        fontSize: 26.sp,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                      RowCardtxtWidget(
                        icon1: Icons.star,
                        txt1: controller.product.value.rating.toString(),
                        icon2: Icons.inbox_rounded,
                        txt2:
                            "${controller.product.value.stock} ${controller.product.value.availabilityStatus ?? AppConstant.nodata}",
                      ),
                      AppText(
                        "\$ ${controller.product.value.price}",
                        maxLines: 2,
                        fontSize: 30.sp,
                        color: AppColors.primaryRedColor,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        controller.product.value.tags != null
                            ? controller.product.value.tags!.join(', ')
                            : 'No tags',
                        maxLines: 1,
                        fontSize: 12.sp,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5.h),
                      AppText(
                        controller.product.value.description ??
                            AppConstant.nodata,
                        maxLines: null,
                        fontSize: 12.sp,
                        textAlign: TextAlign.start,
                        color: AppColors.grayColor,
                      ),
                      Divider(height: 30.h, color: AppColors.grayColor),
                      Row(
                        children: [
                          Expanded(
                            child: CardContent(
                              txt1: 'Weight',
                              txt2: controller.product.value.weight.toString(),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: CardContent(
                              txt1: 'Min Order',
                              txt2: controller
                                  .product.value.minimumOrderQuantity
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: CardContent(
                              txt1: 'Warranty',
                              txt2: controller
                                      .product.value.warrantyInformation ??
                                  AppConstant.nodata,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: CardContent(
                              txt1: 'Return Policy',
                              txt2: controller.product.value.returnPolicy ??
                                  AppConstant.nodata,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      CardContent(
                        txt1: 'Shipping',
                        txt2: controller.product.value.shippingInformation ??
                            AppConstant.nodata,
                      ),
                      SizedBox(height: 10.h),
                      // review
                      Divider(height: 30.h, color: AppColors.grayColor),
                      AppText(
                        "Reviews",
                        maxLines: 2,
                        fontSize: 26.sp,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10.h),
                      CardReviewMore(
                        txt1: controller
                                .product.value.reviews?.first.reviewerName ??
                            AppConstant.nodata,
                        txt2:
                            "Rating : ${controller.product.value.reviews?.first.rating ?? AppConstant.nodata}",
                        txt3:
                            "Comment : ${controller.product.value.reviews?.first.comment ?? AppConstant.nodata}",
                        txt4:
                            'Date : ${controller.product.value.reviews?.first.date ?? AppConstant.nodata}',
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: AppText.des('Reviews More >>'),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}
