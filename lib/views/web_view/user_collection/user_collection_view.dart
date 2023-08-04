import 'package:flutter/material.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/loading/loading_screen.dart';
import 'package:nova_social/views/web_view/mobile/mobile_web_screen.dart';
import 'package:nova_social/views/web_view/user_collection/screens/user_collection_web_screen.dart';
import 'package:provider/provider.dart';

class UserCollectionView extends StatefulWidget {
  final UserCollectionViewArgs? args;
  const UserCollectionView({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<UserCollectionView> createState() => _UserCollectionViewState();
}

class _UserCollectionViewState extends State<UserCollectionView> {
  ProfileNotifier? _profileNoti;
  UserCollection? collection;

  @override
  void initState() {
    super.initState();
    populateCollection();
  }

  Future<void> populateCollection() async {
    if (widget.args?.collection == null) {
      _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
      if (widget.args?.username != _profileNoti?.userProfile?.username) {
        _profileNoti?.isCurrentUser = false;
        await _profileNoti?.populateOtherUser(widget.args?.username);
        collection = _profileNoti?.profileAsPerRoute()?.collections?.firstWhere(
                  (col) => col.id == widget.args?.collectionId,
                  orElse: () => const UserCollection(),
                ) ??
            const UserCollection();
        return;
      }
      collection = _profileNoti?.userProfile?.collections?.firstWhere(
            (col) => col.id == widget.args?.collectionId,
            orElse: () => const UserCollection(),
          ) ??
          const UserCollection();
      return;
    }
    collection = widget.args!.collection!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (collection == null) {
      return const LoadingScreen();
    }
    return ResponsiveWidget(
      largeScreen: UserCollectionWebScreen(
        collection: collection,
      ),
      mediumScreen: UserCollectionWebScreen(
        collection: collection,
      ),
      smallScreen: const MobileWebScreen(),
    );
  }
}
