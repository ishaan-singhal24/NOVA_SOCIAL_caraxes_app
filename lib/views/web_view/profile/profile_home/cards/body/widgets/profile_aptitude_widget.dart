import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/auth/auth_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/profile_add_edit_aptitude.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_sub_head_tile.dart';
import 'package:provider/provider.dart';

class ProfileAptitudeWidget extends StatelessWidget {
  const ProfileAptitudeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profileNoti, child) {
        final aptitudeTests = profileNoti.profileAsPerRoute()?.aptitudeTests;
        if (aptitudeTests?.isEmpty ?? true) return const SizedBox();
        return SizedBox(
          child: Column(
            children: [
              ProfileSubHeadTile(
                iconUrl: AppAssets.brain,
                headText: AppStrings.aptitudeAndPsychometricTest,
                buttonText: AppStrings.addAptitudeOrPsychometricTest,
                onButtonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileAddEditAptitude(
                      isAdd: true,
                    ),
                  );
                },
              ),
              sizedBoxWithHeight(16),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.w),
                decoration: BoxDecoration(
                  color: ThemeHandler.backgroundColor(),
                  // border: Border.all(
                  //   width: 0.3,
                  //   color: ThemeHandler.widgetColor(),
                  // ),
                  // borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProfileDataItemTileWidget(
                    index: index,
                    title: aptitudeTests?[index].name,
                    subTitlePrefix: 'Issued By ',
                    subTitle: aptitudeTests?[index].issuedBy,
                    subTitleWebsite: aptitudeTests?[index].website,
                    description: aptitudeTests?[index].description,
                    fromDate: 'Issue date',
                    toDate: aptitudeTests?[index].issueDate?.abrMMMyyyy,
                    icon: Iconsax.document4,
                    imageAssetPath: AppAssets.awardsLogo,
                    onIconPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ProfileAddEditAptitude(
                            isAdd: false,
                            editingIndex: index,
                          );
                        },
                      );
                    },
                    // networkImage:
                    //     'https://www.cheggindia.com/wp-content/uploads/2022/09/NBR07-02-1.png',
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                  itemCount: aptitudeTests?.length ?? 0,
                ),
              ),
              sizedBoxWithHeight(16),
              Divider(
                color: ThemeHandler.novaMutedColor(),
                thickness: 0.2,
              ),
              sizedBoxWithHeight(16),
            ],
          ),
        );
      },
    );
  }
}
