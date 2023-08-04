import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/show_all_routes.dart/show_all_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileAwardsMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileAwardsMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final awards = args.profile?.awards;
    if (awards?.isEmpty ?? true) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: SizedBox(
        child: Column(
          children: [
            ProfileSubHeadMTile(
              title: AppStrings.profileAwards,
              isCurrentUser: args.isCurrentUser,
              onAdd: () {
                context.push(
                  AddEditMRouter.addEditAwardRoute,
                  extra: const ProfileAddEditAwardMViewArgs(isAdd: true),
                );
              },
              onEdit: () {
                context.push(
                  ShowAllMRouter.showAllAwardsRoute,
                  extra: args,
                );
              },
            ),
            sizedBoxWithHeight(40),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ProfileDataItemMTile(
                index: index,
                isCurrentUser: args.isCurrentUser,
                title: awards![index].name,
                subSubTitleLeft: 'Issued By ',
                subSubTitleRight: '${awards[index].issuedBy}',
                subSubTitleRightWebsite: awards[index].website,
                description: awards[index].description,
                fromDate: 'Issue date',
                toDate: awards[index].issueDate?.abrMMMyyyy,
                iconAssetLink: AppAssets.awardsLogo,
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(48),
              itemCount: (awards?.length ?? 0) > 2 ? 2 : (awards?.length ?? 0),
            ),
            if ((awards?.length ?? 0) > 2) ...{
              sizedBoxWithHeight(40),
              ProfileShowAllItemMTile(
                itemCount: awards!.length,
                itemName: 'awards and achievements',
                open: () {
                  context.push(
                    ShowAllMRouter.showAllAwardsRoute,
                    extra: args,
                  );
                },
              ),
            },
            sizedBoxWithHeight(24),
            const AppDividerMwidget(),
            sizedBoxWithHeight(24),
          ],
        ),
      ),
    );
  }
}
