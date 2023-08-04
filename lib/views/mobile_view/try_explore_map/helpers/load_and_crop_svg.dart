import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/try_explore_map/data/sample_map_tags_data.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class LoadAndCropSVG extends StatefulWidget {
  const LoadAndCropSVG({super.key});

  @override
  State<LoadAndCropSVG> createState() => _LoadAndCropSVGState();
}

class _LoadAndCropSVGState extends State<LoadAndCropSVG> {
  final opportunitiesList = SampleMapTagsData.novaOpportunitiesList;
  final interestList = SampleMapTagsData.novaInterestsList;
  List<String>? outerXmlsInterest = [];
  List<String>? outerXmlsOpportunities = [];
  List<String>? pathsInterest = [];
  List<String>? pathsOpportunities = [];

  @override
  void initState() {
    super.initState();
    populateXmlDoc();
  }

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
    final path = element.getElement('path');
    final data = path?.getAttribute('d');
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
      child: InkWell(
        onTap: onClick,
        child: SvgPicture.string(svgImageOuterXml),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewTransformationController = TransformationController();

    _getClippedImage(
      clipper: _Clipper(
        svgPath: pathsInterest![0],
      ),
      svgImageOuterXml: outerXmlsInterest![0],
      onClick: () {},
    );

    // Figma Flutter Generator Group4529Widget - GROUP
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: InteractiveViewer(
        transformationController: viewTransformationController,
        minScale: 0.1,
        maxScale: 4.0,
        boundaryMargin: const EdgeInsets.all(double.infinity),
        constrained: false,
        child: Container(
          color: Colors.orange,
          width: 3434.61,
          height: 2266,
          child: Stack(
            children: <Widget>[
              ...opportunitiesList.mapIndexed(
                (index, item) {
                  double angleString = 0;
                  if (opportunitiesList[index].angle != null ||
                      opportunitiesList[index].angle != '0') {
                    var dummyStringList =
                        opportunitiesList[index].angle!.split(' ');
                    print(dummyStringList[0]);
                    angleString =
                        double.parse(dummyStringList[0]) * (math.pi / 180);
                  }
                  return Positioned(
                    top: double.parse(
                        (opportunitiesList[index].topDisplayPosition ?? '')),
                    left: double.parse(
                        (opportunitiesList[index].leftDisplayPosition ?? '')),
                    child: Stack(
                      children: [
                        Container(
                          color: opportunitiesList[index].name ==
                                  'Co-founding a non-profit organisation'
                              ? Colors.red
                              : null,
                          child: Transform.rotate(
                            angle: angleString,
                            child: SvgPicture.string(
                              opportunitiesList[index].mapSvgUrl ?? '',
                              semanticsLabel:
                                  opportunitiesList[index].semanticsLabel ?? '',
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Text(
                            opportunitiesList[index].name ?? '',
                            style: AppTextStyles.text14w500,
                          ),
                        ),
                      ],
                    ),
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
                    child: Stack(
                      children: [
                        Container(
                          child: SvgPicture.network(
                            interestList[index].mapSvgUrl ?? '',
                            semanticsLabel:
                                interestList[index].semanticsLabel ?? '',
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Text(
                            interestList[index].name ?? '',
                            style: AppTextStyles.text14w500,
                          ),
                        ),
                      ],
                    ),
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
