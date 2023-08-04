import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.novaBlack,
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
