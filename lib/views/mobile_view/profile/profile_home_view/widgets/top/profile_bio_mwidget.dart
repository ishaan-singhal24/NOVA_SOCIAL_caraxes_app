import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileBioMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileBioMWidget({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxWithHeight(20),
          Text(
            args.profile?.name ?? '',
            style: AppTextStyles.text24w500,
            overflow: TextOverflow.ellipsis,
          ),
          sizedBoxWithHeight(8),
          Row(
            children: [
              // Text(
              //   '@${args.profile?.username ?? ''}',
              //   style: AppTextStyles.text14w300.muted,
              // ),
              if (args.profile?.location != null) ...{
                Text(
                  ' • ${args.profile?.location?.concatinated}',
                  style: AppTextStyles.text14w300.muted,
                  overflow: TextOverflow.ellipsis,
                ),
              } else ...{
                if (args.isCurrentUser ?? false) ...{
                  Row(
                    children: [
                      Text(
                        ' • ',
                        style: AppTextStyles.text14w300.muted,
                      ),
                      Icon(
                        Icons.location_on,
                        size: 16.r,
                        color: AppColors.novaLightMuted.withOpacity(0.8),
                      ),
                      Text(
                        ' Location ',
                        style: AppTextStyles.text14w300.muted,
                      ),
                    ],
                  ),
                },
              },
            ],
          ),
          if (args.profile?.tagline?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(12),
            Text(
              args.profile?.tagline ?? '',
              style: AppTextStyles.text14w400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          },
          sizedBoxWithHeight(12),
        ],
      ),
    );
  }
}
