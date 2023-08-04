// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nova_social/data/constants/app_colors.dart';
// import 'package:nova_social/data/constants/app_strings.dart';
// import 'package:nova_social/data/constants/app_text_styles.dart';
// import 'package:nova_social/routes/mobile/mobile_router.dart';
// import 'package:nova_social/utils/theme_handler.dart';
// import 'package:nova_social/utils/utils.dart';
// import 'package:nova_social/views/mobile_view/common/common.dart';

// class EducationStep extends StatefulWidget {
//   final Function(int) onTap;
//   const EducationStep({
//     super.key,
//     required this.onTap,
//   });

//   @override
//   State<EducationStep> createState() => _EducationStepState();
// }

// class _EducationStepState extends State<EducationStep> {
//   final TextEditingController _schoolNameController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final TextEditingController _gradeController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _startDateController = TextEditingController();
//   final TextEditingController _endDateController = TextEditingController();

//   bool iCurrStudyHere = false;
//   DateTime? startDate;
//   DateTime? endDate;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           AppStrings.educationTitle,
//           style: AppTextStyles.text24w600,
//         ),
//         sizedBoxWithHeight(4),
//         Text(
//           AppStrings.educationSubtitle,
//           style: AppTextStyles.text14w300,
//           textAlign: TextAlign.center,
//         ),
//         sizedBoxWithHeight(32),
//         AppMaterialInputField(
//           label: AppStrings.schoolCollegeName,
//           hint: 'MIT, Boston',
//           controller: _schoolNameController,
//           maxLines: 1,
//           isRequired: true,
//         ),
//         sizedBoxWithHeight(24),
//         AppMaterialInputField(
//           label: AppStrings.degreeClass,
//           hint: '12th',
//           controller: _gradeController,
//           maxLines: 1,
//           isRequired: true,
//         ),
//         sizedBoxWithHeight(24),
//         AppMaterialInputField(
//           label: AppStrings.location,
//           hint: 'Boston, US',
//           controller: _locationController,
//           maxLines: 1,
//           isRequired: false,
//         ),
//         sizedBoxWithHeight(24),
//         Row(
//           children: [
//             Expanded(
//               child: AppMaterialInputField(
//                 label: AppStrings.startDate,
//                 hint: AppStrings.select,
//                 controller: _startDateController,
//                 maxLines: 1,
//                 isRequired: true,
//                 suffixIcon: Icon(
//                   Icons.calendar_month,
//                   color: ThemeHandler.novaMutedColor(),
//                 ),
//               ),
//             ),
//             sizedBoxWithWidth(24),
//             Expanded(
//               child: AppMaterialInputField(
//                 label: AppStrings.endDate,
//                 hint: AppStrings.select,
//                 controller: _endDateController,
//                 maxLines: 1,
//                 isRequired: false,
//                 suffixIcon: Icon(
//                   Icons.calendar_month,
//                   color: ThemeHandler.novaMutedColor(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         sizedBoxWithHeight(8),
//         Row(
//           children: [
//             Checkbox(
//               activeColor: AppColors.novaIndigo,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               side: BorderSide(
//                 color: AppColors.novaDarkMuted,
//                 width: 1,
//               ),
//               value: iCurrStudyHere,
//               onChanged: (value) {
//                 endDate = null;
//                 _endDateController.clear();
//                 iCurrStudyHere = endDate == null ? true : !iCurrStudyHere;
//                 setState(() {});
//               },
//             ),
//             sizedBoxWithWidth(8),
//             Text(
//               'I currently study here',
//               style: AppTextStyles.text12w400,
//             ),
//           ],
//         ),
//         sizedBoxWithHeight(24),
//         AppMaterialInputField(
//           label: AppStrings.activitiesAndExperiences,
//           hint: 'You can share your experience here..',
//           controller: _descriptionController,
//           maxLength: 2400,
//           maxLines: null,
//           isRequired: false,
//           inputStyle: AppTextStyles.text14w400,
//         ),
//         sizedBoxWithHeight(24),
//         CustomButton(
//           text: AppStrings.continueWord,
//           height: 48.h,
//           onPressed: () {
//             context.go(MobileRouter.userWaitlistRoute);
//           },
//         ),
//         sizedBoxWithHeight(24),
//       ],
//     );
//   }
// }
