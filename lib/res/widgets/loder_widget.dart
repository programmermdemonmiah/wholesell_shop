import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

enum LoaderType { cartProductLoad, messageLoad, productLoad }

//** type select  */

class LoaderWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final LoaderType loaderType;

//if use the LoaderWidget ensure your state management
  const LoaderWidget.cartProductLoad({
    super.key,
    required this.isLoading,
    required this.child,
  }) : loaderType = LoaderType.cartProductLoad;

//if use the LoaderWidget ensure your state management

  const LoaderWidget.messageLoad({
    super.key,
    required this.isLoading,
    required this.child,
  }) : loaderType = LoaderType.messageLoad;

  //ensure your statemange ment =
  const LoaderWidget.productLoad({
    super.key,
    required this.isLoading,
    required this.child,
  }) : loaderType = LoaderType.productLoad;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      switch (loaderType) {
        case LoaderType.cartProductLoad:
          return _buildCartProductLoader();
        case LoaderType.messageLoad:
          return _buildMessageLoadLoader();

        case LoaderType.productLoad:
          return _productLoad();
        default:
          return _buildCartProductLoader();
      }
    } else {
      return child;
    }
  }

  Widget _buildCartProductLoader() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 12,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: index == 0 ? 16 : 8),
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  ShimmerWidget.rectangular(
                    height: 120,
                    width: 100,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerWidget.rectangular(
                          height: 20,
                          width: 200,
                        ),
                        SizedBox(height: 8),
                        ShimmerWidget.rectangular(
                          height: 12,
                          width: 100,
                        ),
                        SizedBox(height: 8),
                        ShimmerWidget.rectangular(
                          height: 12,
                          width: 100,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerWidget.rectangular(
                              height: 12,
                              width: 100,
                            ),
                            ShimmerWidget.rectangular(
                              height: 15,
                              width: 100,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessageLoadLoader() {
    return SafeArea(
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerWidget.circular(width: 40.sp, height: 40.sp),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Expanded(
                      child: ShimmerWidget.rectangular(
                        height: 100.sp,
                        width: 200.sp,
                      ),
                    ),
                    SizedBox(width: 55.sp),
                  ],
                ),
                SizedBox(
                  height: 6.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 55.sp),
                    Expanded(
                      child: ShimmerWidget.rectangular(
                        height: 50.sp,
                        width: 200.sp,
                      ),
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    ShimmerWidget.circular(width: 40.sp, height: 40.sp),
                  ],
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 55.sp),
                    Expanded(
                      child: ShimmerWidget.rectangular(
                        height: 30.sp,
                        width: 200.sp,
                      ),
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    SizedBox(width: 40.sp, height: 40.sp),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _productLoad() {
    return GridView.custom(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1.5.sp,
        crossAxisSpacing: 1.5.sp,
        pattern: const [
          WovenGridTile(0.75),
          WovenGridTile(
            5 / 8,
            crossAxisRatio: 0.95,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          return const ShimmerWidget.rectangular(height: 200);
        },
        childCount: 6,
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
  }) : shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      period: const Duration(seconds: 3),
      child: Container(
        height: height,
        width: width,
        decoration:
            ShapeDecoration(color: Colors.grey[400]!, shape: shapeBorder),
      ),
    );
  }
}
