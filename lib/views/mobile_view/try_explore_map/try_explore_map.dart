import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/try_explore_map/data/sample_map_tags_data.dart';
import 'package:http/http.dart' as http;
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart' as xml;

class TryExploreMap extends StatefulWidget {
  const TryExploreMap({super.key});

  @override
  State<TryExploreMap> createState() => _TryExploreMapState();
}

class _TryExploreMapState extends State<TryExploreMap> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await populateXmlDoc();
      setState(() {});
    });
  }

  final opportunitiesList = SampleMapTagsData.novaOpportunitiesList;
  final interestList = SampleMapTagsData.novaInterestsList;
  List<String>? outerXmlsInterest = [];
  List<String>? outerXmlsOpportunities = [];
  List<String>? pathsInterest = [];
  List<String>? pathsOpportunities = [];

  populateXmlDoc() async {
    for (var i = 0; i < interestList.length; i++) {
      final data = await _loadSvgFromUrl(interestList[i].mapSvgUrl!);
      _initPathsAndOuterXML(data.rootElement, isInterest: true);
    }
    for (var i = 0; i < opportunitiesList.length; i++) {
      final data = await _loadSvgFromUrl(opportunitiesList[i].mapSvgUrl!);
      _initPathsAndOuterXML(data.rootElement, isInterest: false);
    }
  }

  Future<xml.XmlDocument> _loadSvgFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    return xml.XmlDocument.parse(response.body);
  }

  void _initPathsAndOuterXML(
    xml.XmlElement element, {
    required bool isInterest,
  }) {
    var path, data;
    if (element.findAllElements('g').isNotEmpty) {
      xml.XmlElement? gElemenet = element.getElement('g');
      path = gElemenet?.getElement('path');
      if (gElemenet?.findAllElements('g').isNotEmpty ?? false) {
        print('second g taken');
        gElemenet = gElemenet?.getElement('g');
        path = gElemenet?.getElement('path');
      }
      data = path?.getAttribute('d');
    } else {
      path = element.getElement('path');
      data = path?.getAttribute('d');
    }

    if (isInterest) {
      outerXmlsInterest?.add(element.outerXml);
      pathsInterest?.add(data ?? '');
    } else {
      outerXmlsOpportunities?.add(element.outerXml);
      pathsOpportunities?.add(data ?? '');
    }
  }

  Widget _getClippedImage({
    required _Clipper clipper,
    required String svgImageOuterXml,
    required void Function() onClick,
  }) {
    return ClipPath(
      clipper: clipper,
      child: GestureDetector(
        onTap: onClick,
        child: SvgPicture.string(svgImageOuterXml),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewTransformationController = TransformationController();

    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: (pathsInterest?.isEmpty ?? true) ||
              (outerXmlsInterest?.isEmpty ?? true)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : InteractiveViewer(
              transformationController: viewTransformationController,
              minScale: 0.1,
              maxScale: 4.0,
              boundaryMargin: EdgeInsets.all(64.r),
              constrained: false,
              child: SizedBox(
                width: 3434.61,
                height: 2266,
                child: Stack(
                  children: <Widget>[
                    ...opportunitiesList.mapIndexed(
                      (index, item) {
                        return Positioned(
                          top: double.parse(
                              opportunitiesList[index].topDisplayPosition ??
                                  ''),
                          left: double.parse(
                              opportunitiesList[index].leftDisplayPosition ??
                                  ''),
                          child: _getClippedImage(
                            clipper: _Clipper(
                              svgPath: pathsOpportunities![index],
                            ),
                            svgImageOuterXml: outerXmlsOpportunities![index],
                            onClick: () {
                              context.push(
                                ExploreMRouter.exploreByTagsRoute,
                                extra: ExploreByTagsMViewArgs(
                                  selectedOpportunity: opportunitiesList[index],
                                ),
                              );
                            },
                          ),
                          // child: InkWell(
                          //   onTap: () {
                          //     context.push(
                          //       ExploreMRouter.exploreByTagsRoute,
                          //       extra: ExploreByTagsMViewArgs(
                          //         selectedOpportunity: opportunitiesList[index],
                          //       ),
                          //     );
                          //   },
                          //   child: SvgPicture.network(
                          //     opportunitiesList[index].mapSvgUrl ?? '',
                          //     semanticsLabel:
                          //         opportunitiesList[index].semanticsLabel ?? '',
                          //   ),
                          // ),
                        );
                      },
                    ).toList(),
                    ...interestList.mapIndexed(
                      (index, item) {
                        return Positioned(
                          top: double.parse(
                              (interestList[index].topDisplayPosition ?? '')),
                          left: double.parse(
                              (interestList[index].leftDisplayPosition ?? '')),
                          child: _getClippedImage(
                            clipper: _Clipper(
                              svgPath: pathsInterest![index],
                            ),
                            svgImageOuterXml: outerXmlsInterest![index],
                            onClick: () {
                              context.push(
                                ExploreMRouter.exploreByTagsRoute,
                                extra: ExploreByTagsMViewArgs(
                                  selectedInterest: interestList[index],
                                ),
                              );
                            },
                          ),
                          // child: InkWell(
                          //   onTap: () {
                          //     context.push(
                          //       ExploreMRouter.exploreByTagsRoute,
                          //       extra: ExploreByTagsMViewArgs(
                          //         selectedInterest: interestList[index],
                          //       ),
                          //     );
                          //   },
                          //   child: SvgPicture.network(
                          //     interestList[index].mapSvgUrl ?? '',
                          //     semanticsLabel:
                          //         interestList[index].semanticsLabel ?? '',
                          //   ),
                          // ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
            ),
    );
  }
}

class _Clipper extends CustomClipper<Path> {
  final String svgPath;
  final Offset offset;

  _Clipper({
    required this.svgPath,
    this.offset = Offset.zero,
  });

  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath);

    return path.shift(offset);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
