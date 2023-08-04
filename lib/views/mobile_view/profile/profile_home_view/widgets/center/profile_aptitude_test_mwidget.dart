import 'package:flutter/material.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:provider/provider.dart';

class ProfileAptitudeMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileAptitudeMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aptitudeTests = args.profile?.aptitudeTests;
    if (aptitudeTests?.isEmpty ?? true) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: SizedBox(
        child: Column(
          children: [
            ProfileSubHeadMTile(
              title: AppStrings.aptitudeAndPsychometricTest,
              isCurrentUser: args.isCurrentUser,
            ),
            sizedBoxWithHeight(40),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ProfileDataItemMTile(
                index: index,
                isCurrentUser: args.isCurrentUser,
                title: aptitudeTests?[index].name,
                subSubTitleLeft: 'Issued By ',
                subSubTitleRight: '${aptitudeTests?[index].issuedBy}',
                website: aptitudeTests?[index].website,
                description: aptitudeTests?[index].description,
                fromDate: 'Issue date',
                toDate: aptitudeTests?[index].issueDate?.abrMMMyyyy,
                iconAssetLink: AppAssets.awardsLogo,
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(48),
              itemCount: (aptitudeTests?.length ?? 0) > 2
                  ? 2
                  : (aptitudeTests?.length ?? 0),
            ),
            if ((aptitudeTests?.length ?? 0) > 2) ...{
              sizedBoxWithHeight(40),
              ProfileShowAllItemMTile(
                itemCount: aptitudeTests!.length,
                itemName: 'aptitude and psychometric tests',
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
