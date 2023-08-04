import 'package:flutter/material.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/explore/screen/web/explore_web_screen.dart';
import 'package:nova_social/views/web_view/mobile/mobile_web_screen.dart';
import 'package:provider/provider.dart';

class ExploreView extends StatefulWidget {
  final ExploreViewArgs? args;
  const ExploreView({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  ProfileNotifier? _profileNoti;

  @override
  void initState() {
    super.initState();
    populateFilterUser();
  }

  Future<void> populateFilterUser() async {
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    await _profileNoti?.fetchUserByFilter(
        widget.args?.id ?? '', widget.args?.filterBy ?? '');
  }

  @override
  void dispose() {
    super.dispose();
    _profileNoti?.clearFilterUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: ExploreWebScreen(
        args: widget.args,
      ),
      mediumScreen: ExploreWebScreen(
        args: widget.args,
      ),
      smallScreen: const MobileWebScreen(),
    );
  }
}
