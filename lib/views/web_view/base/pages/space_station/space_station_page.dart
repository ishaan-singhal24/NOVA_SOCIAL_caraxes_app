import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/base/pages/space_station/widgets/collaborator_tile.dart';
import 'package:nova_social/views/web_view/base/pages/space_station/widgets/search_button.dart';
import 'package:nova_social/views/web_view/base/pages/space_station/widgets/search_field.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class SpaceStationPage extends StatefulWidget {
  const SpaceStationPage({Key? key}) : super(key: key);

  @override
  State<SpaceStationPage> createState() => _SpaceStationPageState();
}

class _SpaceStationPageState extends State<SpaceStationPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxWithHeight(16),
          Text(
            AppStrings.spaceStationHead,
            style: AppTextStyles.text22w700,
          ),
          sizedBoxWithHeight(8),
          Text(
            AppStrings.spaceStationSubHead,
            style: AppTextStyles.text12w300,
          ),
          sizedBoxWithHeight(32),
          const SearchField(
            title: "Looking for",
            subTitle: "Mentors, Speakers, Brainstorm",
          ),
          sizedBoxWithHeight(16),
          const SearchField(
            title: "Open to",
            subTitle: "Mentoring, Speaking, Brainstorming",
          ),
          sizedBoxWithHeight(16),
          SearchButton(
            onPressed: () {},
          ),
          sizedBoxWithHeight(24),
          Text(
            AppStrings.relatedCollaborators,
            style: AppTextStyles.text18w800,
          ),
          sizedBoxWithHeight(16),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return const CollaboratorTile();
              },
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
