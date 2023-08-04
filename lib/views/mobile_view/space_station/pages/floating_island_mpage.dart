import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/views/mobile_view/no_internet/no_internet_mview.dart';

class FloatingIslandPage extends StatefulWidget {
  const FloatingIslandPage({super.key});

  @override
  State<FloatingIslandPage> createState() => _FloatingIslandPageState();
}

class _FloatingIslandPageState extends State<FloatingIslandPage> {
  final viewTransformationController = TransformationController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: viewTransformationController,
      boundaryMargin: EdgeInsets.zero,
      minScale: 1,
      maxScale: 2,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.floatingIsland,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 100,
            top: 350,
            width: 200,
            height: 200,
            child: GestureDetector(
              onTap: () {
                context.push(MobileRouter.playgroundRoute);
              },
              // child: Container(
              //   width: 200,
              //   height: 200,
              // color: AppColors.novaBlue.withOpacity(0.5),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
