import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wholesell_shop/res/app_text_style/app_text_style.dart';
import 'package:wholesell_shop/res/color_manager/app_colors.dart';
import 'package:wholesell_shop/res/getx_localization/string_text.dart';
import 'package:wholesell_shop/res/widgets/custom_textformfild.dart';
import 'package:wholesell_shop/utils/ui_const.dart';
import 'package:wholesell_shop/view_model/controller/home/home_controller.dart';

class HomeSliverAppbar extends StatelessWidget {
  final Widget child;
  final HomeController controller;
  final Future<void> Function() onRefresh;
  final TextEditingController? inputController;
  final Function(String)? onFieldSubmitted;

  const HomeSliverAppbar({
    super.key,
    required this.child,
    required this.controller,
    required this.onRefresh,
    this.inputController,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: AppColors.whiteBg,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.homeName.value != '')
                  InkWell(
                    onTap: () {
                      controller.homeName.value = '';
                    },
                    child: Padding(
                      padding: edgeInsetsRight(1),
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: 30.sp,
                        color: AppColors.black.withOpacity(0.2),
                      ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.yourLocation,
                      style: AppTextStyle.tittleBig2(context: context),
                    ),
                    // gapH(1),
                    Row(
                      children: [
                        Text(
                          "Rail Gate, Sector 8, Uttara, Dhaka, Bangladesh",
                          maxLines: 1,
                          style: AppTextStyle.paragraph4(context: context),
                        ),
                        gapW(1),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.sp,
                          color: AppColors.black.withOpacity(0.1),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            leadingWidth: controller.homeName.value == '' ? 2.sp : 0,
            // leading: controller.homeName.value == ''
            //     ? null
            //     : ,
            automaticallyImplyLeading: false,
            pinned: false,
            floating: false,
            actions: [
              Icon(
                Icons.notifications_none,
                size: 30.sp,
                color: AppColors.black,
              ),
              gapW(4),
            ],
          ),
          if (controller.homeName.value != '')
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 50.h,
                maxHeight: 50.h,
                child: Container(
                  padding: screenPaddingH(),
                  color: Colors.transparent,
                  child: customTextFormFild(
                    controller: inputController ?? TextEditingController(),
                    inputType: TextInputType.text,
                    radiusSet: 6,
                    hintText: '${S.searchForWhatYouWant}....',
                    isFilled: true,
                    isPrefixIcon: true,
                    prefixIcon: Icons.search,
                  ),
                ),
              ),
            ),
        ];
      },
      body: RefreshIndicator(
          onRefresh: onRefresh,
          color: AppColors.orrageColor,
          child:
              child), // Ensure the body is a scrollable widget, like ListView
    );
  }
}

// Custom SliverPersistentHeaderDelegate to manage the pinned widget
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent ||
        child != (oldDelegate as _SliverAppBarDelegate).child;
  }
}
