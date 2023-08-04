import 'package:flutter/material.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/cards.dart';

class ProfileTabletScreen extends StatelessWidget {
  final bool? isCurrentUser;
  const ProfileTabletScreen({
    Key? key,
    this.isCurrentUser = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 96.w,
          vertical: 32.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ScreenUtil.instance.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'NOVA',
                  //   style: AppTextStyles.text32w900.indigo,
                  // ),
                  sizedBoxWithHeight(48),

                  //Bio
                  const ProfileBioWidget(),
                  const ProfileBodyWidget(),

                  // ListView.separated(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) => ProfileAddTileWidget(
                  //     title: 'Add Education',
                  //     subTitle: 'Add your school, college or course',
                  //     icon: Iconsax.home,
                  //     onTap: () {
                  //       print('button pressed');
                  //     },
                  //   ),
                  //   separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                  //   itemCount: 5,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ProfileWebScreen extends StatelessWidget {
//   const ProfileWebScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.instance.init(context);
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: ThemeHandler.backgroundColor(),
//       body: SingleChildScrollView(
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             sizedBoxWithHeight(1500),
//             SizedBox(
//               height: deviceSize.height,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 200.h,
//                     color: AppColors.novaMellon,
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 100.h,
//               width: deviceSize.width * 0.5,
//               child: Card(
//                 color: ThemeHandler.backgroundColor(),
//                 child: const ProfileScreenBody(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
