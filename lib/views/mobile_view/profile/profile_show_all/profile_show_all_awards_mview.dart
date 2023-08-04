import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/center.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/widgets/profile_show_all_app_bar_mwidget.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileShowAllAwardsMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileShowAllAwardsMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileShowAllAwardsMView> createState() =>
      _ProfileShowAllAwardsMViewState();
}

class _ProfileShowAllAwardsMViewState extends State<ProfileShowAllAwardsMView> {
  @override
  Widget build(BuildContext context) {
    final awards = widget.args.profile?.awards;
    if (awards?.isEmpty ?? true) return const SizedBox();
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: ProfileShowAllAppBarMWidget(
                  title: AppStrings.profileAwards,
                  isCurrentUser: widget.args.isCurrentUser,
                  add: () {
                    context.push(
                      AddEditMRouter.addEditAwardRoute,
                      extra: const ProfileAddEditAwardMViewArgs(isAdd: true),
                    );
                  },
                ),
              ),
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProfileDataItemMTile(
                    index: index,
                    isCurrentUser: widget.args.isCurrentUser,
                    title: awards![index].name,
                    subSubTitleLeft: 'Issued By ',
                    subSubTitleRight: '${awards[index].issuedBy}',
                    subSubTitleRightWebsite: awards[index].website,
                    description: awards[index].description,
                    fromDate: 'Issue date',
                    toDate: awards[index].issueDate?.abrMMMyyyy,
                    iconAssetLink: AppAssets.awardsLogo,
                    onEdit: () {
                      context.push(
                        AddEditMRouter.addEditAwardRoute,
                        extra: ProfileAddEditAwardMViewArgs(
                          isAdd: false,
                          editAward: awards[index],
                          editIndex: index,
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(48),
                  itemCount: awards?.length ?? 0,
                ),
              ),
              sizedBoxWithHeight(36),
            ],
          ),
        ),
      ),
    );
  }
}
