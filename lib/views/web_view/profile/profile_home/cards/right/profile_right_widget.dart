import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/right/widgets/profile_dream_widget.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/right/widgets/profile_nominated_by_widget.dart';
import 'package:provider/provider.dart';

class ProfileRightWidget extends StatefulWidget {
  const ProfileRightWidget({Key? key}) : super(key: key);

  @override
  State<ProfileRightWidget> createState() => _ProfileRightWidgetState();
}

class _ProfileRightWidgetState extends State<ProfileRightWidget> {
  Widget dreamItem(DreamInterface item) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppNetworkImage(
            url: item.iconUrl ?? 'NA',
            width: 32.r,
            height: 32.r,
          ),
          sizedBoxWithHeight(4),
          Text(
            item.name ?? 'NA',
            style: AppTextStyles.text12w700.darkModeSupport,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }

  Widget dreamItems(List<DreamInterface> data) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...data.mapIndexed(
            (i, e) => dreamItem(data[i]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<ProfileNotifier>().profileAsPerRoute();
    final isCurrentUser = context.read<ProfileNotifier>().isCurrentUser;
    return Column(
      children: [
        if (userModel?.invitedBy != null) ...{
          sizedBoxWithHeight(24),
          const ProfileNominatedByWidget(),
          sizedBoxWithHeight(16),
          Divider(
            color: ThemeHandler.novaMutedColor(),
            thickness: 0.5,
          ),
        },
        ProfileDreamWidget(
          isCurrentUser: isCurrentUser ?? false,
          type: ProfileAddEditDreamType.colleges,
          dream: userModel?.dreamColleges,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditDream(
                type: ProfileAddEditDreamType.colleges,
              ),
            );
          },
        ),
        ProfileDreamWidget(
          isCurrentUser: isCurrentUser ?? false,
          type: ProfileAddEditDreamType.countries,
          dream: userModel?.dreamCountries,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditDream(
                type: ProfileAddEditDreamType.countries,
              ),
            );
          },
        ),
        ProfileDreamWidget(
          isCurrentUser: isCurrentUser ?? false,
          type: ProfileAddEditDreamType.careers,
          dream: userModel?.dreamCareers,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditDream(
                type: ProfileAddEditDreamType.careers,
              ),
            );
          },
        ),
      ],
    );
  }
}
