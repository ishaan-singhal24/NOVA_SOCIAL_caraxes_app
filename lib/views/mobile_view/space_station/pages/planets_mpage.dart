import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/mobile/space_station_routes.dart/space_station_routes.dart';

class PlanetsMPage extends StatefulWidget {
  const PlanetsMPage({super.key});

  @override
  State<PlanetsMPage> createState() => _PlanetsMPageState();
}

class _PlanetsMPageState extends State<PlanetsMPage> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false,
      boundaryMargin: EdgeInsets.zero,
      minScale: 1,
      maxScale: 2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double imageWidth = constraints.maxWidth;
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppAssets.spaceStationBackground,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 40,
                top: 100,
                child: GestureDetector(
                  onTap: () {
                    context.go(SpaceStationRouter.floatingIslandRoute);
                  },
                  child: Image.asset(
                    AppAssets.spaceStationPlanetX,
                    width: imageWidth * 0.4,
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 300,
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    AppAssets.spaceStationPlanetXi,
                    width: imageWidth * 0.4,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 120,
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    AppAssets.spaceStationPlanetXii,
                    width: imageWidth * 0.5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
