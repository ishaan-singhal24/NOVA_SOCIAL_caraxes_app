import 'package:flutter/material.dart';

class SpaceStationMView extends StatefulWidget {
  final Widget child;
  const SpaceStationMView({
    super.key,
    required this.child,
  });

  @override
  State<SpaceStationMView> createState() => _SpaceStationMViewState();
}

class _SpaceStationMViewState extends State<SpaceStationMView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
