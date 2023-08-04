import 'package:flutter/material.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/cards.dart';

class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          ProfileBioWidget(),
          ProfileBodyWidget(),
        ],
      ),
    );
  }
}
