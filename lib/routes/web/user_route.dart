part of 'nova_router.dart';

String _uid = 'uid';
String _inviteCode = 'inviteCode';
String collection = 'collection';
String _collectionId = 'collectionId';

final userRoutes = <RouteBase>[
  GoRoute(
    path: 'loading',
    builder: (context, state) => ProfileView(
      args: ProfileViewArgs(showLoading: true),
    ),
  ),
  GoRoute(
    path: ':$_id',
    builder: (context, state) => ProfileView(
      args: ProfileViewArgs(
        username: state.params[_id],
      ),
    ),
  ),
  GoRoute(
    path: '$_uid/:$_id',
    builder: (context, state) => ProfileView(
      args: ProfileViewArgs(
        username: state.params[_id],
      ),
    ),
  ),
  GoRoute(
    path: ':$_id/$collection/:$_collectionId',
    builder: (context, state) => UserCollectionView(
      args: UserCollectionViewArgs(
        username: state.params[_id],
        collectionId: state.params[_collectionId],
        collection: state.extra as UserCollection?,
      ),
    ),
  ),
  GoRoute(
    path: '$_uid/$_inviteCode/:$_id',
    builder: (context, state) => const HomeView(),
  ),
];
