// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:nova_social/data/constants/constants.dart';
// import 'package:nova_social/data/enums/enums.dart';
// import 'package:nova_social/data/models/models.dart';
// import 'package:nova_social/notifiers/notifiers.dart';
// import 'package:nova_social/utils/utils.dart';
// import 'package:nova_social/views/mobile_view/common/common.dart';
// import 'package:provider/provider.dart';

// class ProfileDreamMWidget extends StatefulWidget {
//   final Function()? onTap;
//   final ProfileAddEditDreamType? type;

//   const ProfileDreamMWidget({
//     Key? key,
//     this.type,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   State<ProfileDreamMWidget> createState() => _ProfileDreamMWidgetState();
// }

// class _ProfileDreamMWidgetState extends State<ProfileDreamMWidget> {
//   late List<DreamInterface>? dreamList;

//   final List<Color> dummyColor = [
//     AppColors.novaBlue,
//     AppColors.novaDarkGreen,
//     AppColors.novaDarkYellow,
//     AppColors.novaLightGreen,
//     AppColors.novaOrange,
//     AppColors.novaPeach,
//     AppColors.novaPink,
//     AppColors.novaPurple,
//   ];

//   Future<void> initialiaztions() async {
//     final profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
//     switch (widget.type) {
//       case ProfileAddEditDreamType.colleges:
//         dreamList = profileNoti.userProfile?.dreamColleges;
//         break;
//       case ProfileAddEditDreamType.countries:
//         dreamList = profileNoti.userProfile?.dreamCountries;
//         break;
//       case ProfileAddEditDreamType.careers:
//         dreamList = profileNoti.userProfile?.dreamCareers;
//         break;
//       default:
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     initialiaztions();

//     return dreamItems(dreamList ?? []);
//   }
// }
