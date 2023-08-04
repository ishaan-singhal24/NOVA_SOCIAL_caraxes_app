import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedPageIndex;
  const BottomNavBar({
    Key? key,
    required this.selectedPageIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> bottomIcons = [
      Iconsax.home,
      Iconsax.people,
      Icons.circle,
      Iconsax.message,
      Iconsax.notification,
    ];

    return Container(
      margin: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 24.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.novaWhite,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.novaLightMutedPlus,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...bottomIcons.mapIndexed(
            (index, item) => InkWell(
              onTap: () => onTap(index),
              child: index == 2
                  ? CircleAvatar(
                      backgroundColor: selectedPageIndex == index
                          ? AppColors.novaIndigo
                          : AppColors.novaLightMuted,
                      child: Container(
                        margin: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.novaLightMutedPlus,
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.novaLightMutedPlus,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Icon(
                      item as IconData,
                      color: selectedPageIndex == index
                          ? AppColors.novaBlack
                          : AppColors.novaLightMutedPlus,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
