import 'package:flutter/material.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/widgets.dart';

class ProfileBodyWidget extends StatefulWidget {
  const ProfileBodyWidget({Key? key}) : super(key: key);

  @override
  State<ProfileBodyWidget> createState() => _ProfileBodyWidgetState();
}

class _ProfileBodyWidgetState extends State<ProfileBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizedBoxWithHeight(16),

        //Collections
        const ProfileCollectionsWidget(),

        //Education
        const ProfileEducationWidget(),

        //Experience
        const ProfileExperienceWidget(),

        //Volunteer
        const ProfileVolunteeredWidget(),

        //Test Scores
        // const ProfileTestScoresWidget(),

        //Awards
        const ProfileAwardsWidget(),

        //Aptitude
        const ProfileAptitudeWidget(),

        //.... ADD TILES
        const ProfileAddMoreToCardsWidget(),

        // //Add Education
        // if (user?.educations == null && isCurrentUser)
        //   Column(
        //     children: [
        //       ProfileAddTileWidget(
        //         title: AppStrings.addEducation,
        //         subTitle: AppStrings.addEducationSubTitle,
        //         icon: Iconsax.home,
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => const ProfileAddEditEducation(
        //               isAdd: true,
        //             ),
        //           );
        //         },
        //       ),
        //       sizedBoxWithHeight(24),
        //     ],
        //   ),

        // //Add Experience
        // if (user?.experiences == null && isCurrentUser)
        //   Column(
        //     children: [
        //       ProfileAddTileWidget(
        //         title: AppStrings.addExperience,
        //         subTitle: AppStrings.addExperienceSubTitle,
        //         icon: Iconsax.home,
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => const ProfileAddEditExperience(
        //               isAdd: true,
        //             ),
        //           );
        //         },
        //       ),
        //       sizedBoxWithHeight(24),
        //     ],
        //   ),

        // //Add Volunteer
        // if (user?.volunteered == null && isCurrentUser)
        //   Column(
        //     children: [
        //       ProfileAddTileWidget(
        //         title: AppStrings.addVolunteeringJobs,
        //         subTitle: AppStrings.addVolunteeringSubTitle,
        //         icon: Iconsax.home,
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => const ProfileAddEditVolunteer(
        //               isAdd: true,
        //             ),
        //           );
        //         },
        //       ),
        //       sizedBoxWithHeight(24),
        //     ],
        //   ),

        // //Add Test Scores
        // if (user?.testScores == null && isCurrentUser)
        //   Column(
        //     children: [
        //       ProfileAddTileWidget(
        //         title: AppStrings.addTestScores,
        //         subTitle: AppStrings.addTestScoresSubTitle,
        //         icon: Iconsax.home,
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => const ProfileAddEditTestScores(
        //               isAdd: true,
        //             ),
        //           );
        //         },
        //       ),
        //       sizedBoxWithHeight(24),
        //     ],
        //   ),

        // //Add Awards
        // if (user?.awards == null && isCurrentUser)
        //   Column(
        //     children: [
        //       ProfileAddTileWidget(
        //         title: AppStrings.addAwards,
        //         subTitle: AppStrings.addAwardsSubTitle,
        //         icon: Iconsax.home,
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => const ProfileAddEditAwards(
        //               isAdd: true,
        //             ),
        //           );
        //         },
        //       ),
        //       sizedBoxWithHeight(24),
        //     ],
        //   ),

        // //Add Aptitude
        // if (user?.aptitudeTests == null && isCurrentUser)
        //   Column(
        //     children: [
        //       ProfileAddTileWidget(
        //         title: AppStrings.addAptitudeOrPsychometricTest,
        //         subTitle: AppStrings.addAptitudeTestSubTitle,
        //         icon: Iconsax.home,
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => const ProfileAddEditAptitude(
        //               isAdd: true,
        //             ),
        //           );
        //         },
        //       ),
        //       sizedBoxWithHeight(24),
        //     ],
        //   ),
      ],
    );
  }
}
