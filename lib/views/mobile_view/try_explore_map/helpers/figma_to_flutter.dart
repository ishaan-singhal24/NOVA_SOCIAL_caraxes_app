import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class Group4540Widget extends StatefulWidget {
  @override
  State<Group4540Widget> createState() => _Group4540WidgetState();
}

class _Group4540WidgetState extends State<Group4540Widget> {
  List<Widget> positionedWidgets = [
    Positioned(
      top: 587.55078125,
      left: 2284.296142578125,
      child: SvgPicture.asset('assets/images/environmentalist.svg',
          semanticsLabel: 'environmentalist'),
    ),
    Positioned(
      top: 371.1923828125,
      left: 2470.792236328125,
      child:
          SvgPicture.asset('assets/images/chess.svg', semanticsLabel: 'chess'),
    ),
    Positioned(
      top: 865.2998046875,
      left: 2423.871337890625,
      child: SvgPicture.asset('assets/images/influencer.svg',
          semanticsLabel: 'influencer'),
    ),
    Positioned(
      top: 777,
      left: 2640,
      child: SvgPicture.asset('assets/images/politics.svg',
          semanticsLabel: 'politics'),
    ),
    Positioned(
      top: 745.818359375,
      left: 2322.847900390625,
      child: SvgPicture.asset('assets/images/mentalhealth.svg',
          semanticsLabel: 'mentalhealth'),
    ),
    Positioned(
      top: 746.669921875,
      left: 2578.355712890625,
      child: SvgPicture.asset('assets/images/journalism.svg',
          semanticsLabel: 'journalism'),
    ),
    Positioned(
      top: 976.8876953125,
      left: 2636.317626953125,
      child: SvgPicture.asset('assets/images/traveler.svg',
          semanticsLabel: 'traveler'),
    ),
    Positioned(
      top: 671.7998046875,
      left: 2648.567626953125,
      child: SvgPicture.asset('assets/images/socialservice.svg',
          semanticsLabel: 'socialservice'),
    ),
    Positioned(
      top: 462.169921875,
      left: 2521.617431640625,
      child: SvgPicture.asset('assets/images/sports.svg',
          semanticsLabel: 'sports'),
    ),
    Positioned(
      top: 405.998046875,
      left: 2301.961181640625,
      child: SvgPicture.asset('assets/images/climatechange.svg',
          semanticsLabel: 'climatechange'),
    ),
    Positioned(
        top: 531,
        left: 2410.367431640625,
        child: Text(
          'Climate change',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 678,
        left: 2465.367431640625,
        child: Text(
          'Environmentalist',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 827,
        left: 2445.367431640625,
        child: Text(
          'Mental health',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 563,
        left: 2593.367431640625,
        child: Text(
          'Sports',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 462,
        left: 2533.367431640625,
        child: Text(
          'Chess',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 753,
        left: 2702.367431640625,
        child: Text(
          'Social service',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 877,
        left: 2766,
        child: Text(
          'Politics',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 897,
        left: 2640.367431640625,
        child: Text(
          'Journalism',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1022,
        left: 2702.367431640625,
        child: Text(
          'Traveler',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 923,
        left: 2444.367431640625,
        child: Text(
          'Influencer',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 257,
        left: 2802,
        child: Transform.rotate(
          angle: 6.3611093629270335e-15 * (math.pi / 180),
          child: SvgPicture.asset('assets/images/cybersecurity.svg',
              semanticsLabel: 'cybersecurity'),
        )),
    Positioned(
      top: 127.369140625,
      left: 2627.441650390625,
      child: SvgPicture.asset('assets/images/uiuxdesign.svg',
          semanticsLabel: 'uiuxdesign'),
    ),
    Positioned(
      top: 286.4287109375,
      left: 2955.472900390625,
      child: SvgPicture.asset('assets/images/speaker.svg',
          semanticsLabel: 'speaker'),
    ),
    Positioned(
      top: 516.5595703125,
      left: 3020.133056640625,
      child: SvgPicture.asset('assets/images/computerscience.svg',
          semanticsLabel: 'computerscience'),
    ),
    Positioned(
      top: 366.9677734375,
      left: 3110.980712890625,
      child: SvgPicture.asset('assets/images/inventor.svg',
          semanticsLabel: 'inventor'),
    ),
    Positioned(
      top: 211.5869140625,
      left: 3033.797119140625,
      child: SvgPicture.asset('assets/images/opensource.svg',
          semanticsLabel: 'opensource'),
    ),
    Positioned(
      top: 2.0361328125,
      left: 2892.179931640625,
      child: SvgPicture.asset('assets/images/bllockchain.svg',
          semanticsLabel: 'bllockchain'),
    ),
    Positioned(
        top: 452,
        left: 2873,
        child: Text(
          'Cybersecurity',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 217.78515625,
        left: 2829.431884765625,
        child: Text(
          'UI/UX Design',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 97.830078125,
        left: 2952.140869140625,
        child: Text(
          'Blockchain',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 292.7568359375,
        left: 3093.812744140625,
        child: Text(
          'Open Source',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 437.701171875,
        left: 3040.265869140625,
        child: Text(
          'Speaker',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 561.654296875,
        left: 3053.652587890625,
        child: Text(
          'Computer science',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 457.6943359375,
        left: 3171.898681640625,
        child: Text(
          'Inventor',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 1481,
      left: 2701,
      child: SvgPicture.asset('assets/images/petowner.svg',
          semanticsLabel: 'petowner'),
    ),
    Positioned(
      top: 1241,
      left: 2556,
      child: SvgPicture.asset('assets/images/figmawizard.svg',
          semanticsLabel: 'figmawizard'),
    ),
    Positioned(
      top: 904,
      left: 2845,
      child: SvgPicture.asset('assets/images/researching.svg',
          semanticsLabel: 'researching'),
    ),
    Positioned(
      top: 1229,
      left: 2889,
      child: SvgPicture.asset('assets/images/mentor.svg',
          semanticsLabel: 'mentor'),
    ),
    Positioned(
      top: 1253,
      left: 3087,
      child: SvgPicture.asset('assets/images/reader.svg',
          semanticsLabel: 'reader'),
    ),
    Positioned(
      top: 1171,
      left: 2991,
      child: SvgPicture.asset('assets/images/teacher.svg',
          semanticsLabel: 'teacher'),
    ),
    Positioned(
      top: 1794,
      left: 2600,
      child: SvgPicture.asset('assets/images/culinaryarts.svg',
          semanticsLabel: 'culinaryarts'),
    ),
    Positioned(
      top: 1643,
      left: 2796,
      child: SvgPicture.asset('assets/images/mathematics.svg',
          semanticsLabel: 'mathematics'),
    ),
    Positioned(
      top: 1935,
      left: 2870,
      child: SvgPicture.asset('assets/images/youtube.svg',
          semanticsLabel: 'youtube'),
    ),
    Positioned(
      top: 1547.7783203125,
      left: 2885.345703125,
      child: SvgPicture.asset('assets/images/psychology.svg',
          semanticsLabel: 'psychology'),
    ),
    Positioned(
      top: 1733.3818359375,
      left: 2973.234375,
      child: SvgPicture.asset('assets/images/stem.svg', semanticsLabel: 'stem'),
    ),
    Positioned(
      top: 1775,
      left: 3122,
      child: SvgPicture.asset('assets/images/volunteer.svg',
          semanticsLabel: 'volunteer'),
    ),
    Positioned(
      top: 1618,
      left: 3170,
      child: SvgPicture.asset('assets/images/podcaster.svg',
          semanticsLabel: 'podcaster'),
    ),
    Positioned(
      top: 1363,
      left: 2899,
      child: SvgPicture.asset('assets/images/writer.svg',
          semanticsLabel: 'writer'),
    ),
    Positioned(
      top: 1927,
      left: 2410,
      child: SvgPicture.asset('assets/images/astronomy.svg',
          semanticsLabel: 'astronomy'),
    ),
    Positioned(
      top: 1468.4794921875,
      left: 3089.7421875,
      child: SvgPicture.asset('assets/images/foriegnlanguage.svg',
          semanticsLabel: 'foriegnlanguage'),
    ),
    Positioned(
      top: 1413,
      left: 2912,
      child: SvgPicture.asset('assets/images/intern.svg',
          semanticsLabel: 'intern'),
    ),
    Positioned(
      top: 1374,
      left: 3045,
      child: SvgPicture.asset('assets/images/science.svg',
          semanticsLabel: 'science'),
    ),
    Positioned(
        top: 1087,
        left: 3030,
        child: Text(
          'Researching',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1400,
        left: 2804,
        child: Text(
          'Figma Wizard',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1253,
        left: 3076,
        child: Text(
          'Teacher',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1461,
        left: 3153,
        child: Text(
          'Science',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1353,
        left: 3026,
        child: Text(
          'Mentor',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1433,
        left: 2934,
        child: Text(
          'Writer',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1500,
        left: 3005,
        child: Text(
          'Intern',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1374,
        left: 3242,
        child: Text(
          'Reader',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1585,
        left: 3136,
        child: Text(
          'Foreign Language',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1688,
        left: 3211,
        child: Text(
          'Podcaster',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1655,
        left: 2959,
        child: Text(
          'Psychology',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1853,
        left: 2872,
        child: Text(
          'Mathematics',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1836,
        left: 3067,
        child: Text(
          'STEM',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1878,
        left: 3176,
        child: Text(
          'Volunteer',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1863,
        left: 2653,
        child: Text(
          'Culinary arts and bakery',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 2056,
        left: 2709,
        child: Text(
          'Astronomy',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 2001,
        left: 2943,
        child: Text(
          'YouTube',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1578,
        left: 2747,
        child: Text(
          'Pet Owner',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 288.6953125,
      left: 1765.1671142578125,
      child: SvgPicture.asset('assets/images/humanresources.svg',
          semanticsLabel: 'humanresources'),
    ),
    Positioned(
      top: 528,
      left: 1213.3673095703125,
      child: SvgPicture.asset('assets/images/businessandeconomics.svg',
          semanticsLabel: 'businessandeconomics'),
    ),
    Positioned(
      top: 538.4580078125,
      left: 1427.7550048828125,
      child: SvgPicture.asset('assets/images/finance.svg',
          semanticsLabel: 'finance'),
    ),
    Positioned(
      top: 257.4599609375,
      left: 1625.3819580078125,
      child: SvgPicture.asset('assets/images/investor.svg',
          semanticsLabel: 'investor'),
    ),
    Positioned(
      top: 712.3037109375,
      left: 1385.3878173828125,
      child: SvgPicture.asset('assets/images/nonprofitfounder.svg',
          semanticsLabel: 'nonprofitfounder'),
    ),
    Positioned(
      top: 299.3828125,
      left: 1356.361572265625,
      child: SvgPicture.asset('assets/images/marketer.svg',
          semanticsLabel: 'marketer'),
    ),
    Positioned(
      top: 782,
      left: 1581.3673095703125,
      child: SvgPicture.asset('assets/images/blogger.svg',
          semanticsLabel: 'blogger'),
    ),
    Positioned(
      top: 571.125,
      left: 1723.715087890625,
      child: SvgPicture.asset('assets/images/youngachiever.svg',
          semanticsLabel: 'youngachiever'),
    ),
    Positioned(
      top: 25,
      left: 1686.3673095703125,
      child: SvgPicture.asset('assets/images/entrepreneur.svg',
          semanticsLabel: 'entrepreneur'),
    ),
    Positioned(
        top: 174,
        left: 1809.3673095703125,
        child: Text(
          'Entrepreneur',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 0,
      left: 1401.3673095703125,
      child: SvgPicture.asset('assets/images/vector.svg',
          semanticsLabel: 'vector'),
    ),
    Positioned(
        top: 102,
        left: 1557.3673095703125,
        child: Text(
          'Finance',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 159,
      left: 1416.3673095703125,
      child: SvgPicture.asset('assets/images/vector.svg',
          semanticsLabel: 'vector'),
    ),
    Positioned(
        top: 237,
        left: 1583.7608642578125,
        child: Text(
          'Founder',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 425,
        left: 1682.9083251953125,
        child: Text(
          'Investor',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 441,
        left: 1486.4737548828125,
        child: Text(
          'Marketer',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 640,
        left: 1565.0069580078125,
        child: Text(
          'Biology',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 623,
        left: 1315.3428955078125,
        child: Text(
          'Business and Economics',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 819,
        left: 1456.3673095703125,
        child: Text(
          'Non-Profit Founder',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 884,
        left: 1746.3673095703125,
        child: Text(
          'Blogger',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 723,
        left: 1840.3673095703125,
        child: Text(
          'Young Achiever',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 477,
        left: 1917.3673095703125,
        child: Text(
          'Human Resources',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1486.8941650390625,
        left: 277.868896484375,
        child: Transform.rotate(
          angle: -1.0699126733236732e-8 * (math.pi / 180),
          child: SvgPicture.asset('assets/images/givingportfoliofeedback.svg',
              semanticsLabel: 'givingportfoliofeedback'),
        )),
    Positioned(
        top: 1717.912841796875,
        left: 427.35540771484375,
        child: Transform.rotate(
          angle: -1.0699126733236732e-8 * (math.pi / 180),
          child: SvgPicture.asset('assets/images/cofoundingacompany.svg',
              semanticsLabel: 'cofoundingacompany'),
        )),
    Positioned(
        top: 1598.1175537109375,
        left: 326.80462646484375,
        child: Transform.rotate(
          angle: -1.0699126733236732e-8 * (math.pi / 180),
          child: SvgPicture.asset('assets/images/brainstorming.svg',
              semanticsLabel: 'brainstorming'),
        )),
    Positioned(
        top: 1599.9659423828125,
        left: 582.0626831054688,
        child: Transform.rotate(
          angle: -1.0699126733236732e-8 * (math.pi / 180),
          child: SvgPicture.asset('assets/images/workingonprojects.svg',
              semanticsLabel: 'workingonprojects'),
        )),
    Positioned(
        top: 1271,
        left: 39.36720657348633,
        child: Transform.rotate(
          angle: -1.0699126733236732e-8 * (math.pi / 180),
          child: SvgPicture.asset('assets/images/betatestingnewproducts.svg',
              semanticsLabel: 'betatestingnewproducts'),
        )),
    Positioned(
        top: 1679.2138671875,
        left: 449.3475646972656,
        child: Transform.rotate(
          angle: -0.2681178021640231 * (math.pi / 180),
          child: Text(
            'Brainstorming',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.4285714285714286),
          ),
        )),
    Positioned(
        top: 1565.000244140625,
        left: 433.4601135253906,
        child: Transform.rotate(
          angle: -0.2681178021640231 * (math.pi / 180),
          child: Text(
            'Giving portfolio feedback',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.4285714285714286),
          ),
        )),
    Positioned(
        top: 1770.7913818359375,
        left: 454.8478088378906,
        child: Transform.rotate(
          angle: -0.2681178021640231 * (math.pi / 180),
          child: Text(
            'Co-founding a company',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.4285714285714286),
          ),
        )),
    Positioned(
        top: 1751.6011962890625,
        left: 627.941650390625,
        child: Transform.rotate(
          angle: -0.2681178021640231 * (math.pi / 180),
          child: Text(
            'Working on projects',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Inter',
                fontSize: 14,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.4285714285714286),
          ),
        )),
    Positioned(
      top: 529,
      left: 441.3671875,
      child: SvgPicture.asset('assets/images/cofoundinganonprofit.svg',
          semanticsLabel: 'cofoundinganonprofit'),
    ),
    Positioned(
      top: 450.9999694824219,
      left: 660.3671875,
      child: SvgPicture.asset('assets/images/mentoring.svg',
          semanticsLabel: 'mentoring'),
    ),
    Positioned(
      top: 906,
      left: 495.3671875,
      child: SvgPicture.asset('assets/images/collaboratingonsideprojects.svg',
          semanticsLabel: 'collaboratingonsideprojects'),
    ),
    Positioned(
      top: 620,
      left: 687.3671875,
      child: SvgPicture.asset('assets/images/opensourcecontributions.svg',
          semanticsLabel: 'opensourcecontributions'),
    ),
    Positioned(
      top: 1175,
      left: 534.3671875,
      child: SvgPicture.asset('assets/images/startingapodcast.svg',
          semanticsLabel: 'startingapodcast'),
    ),
    Positioned(
      top: 874,
      left: 781.3671875,
      child: SvgPicture.asset('assets/images/volunteering.svg',
          semanticsLabel: 'volunteering'),
    ),
    Positioned(
      top: 704,
      left: 574.3671875,
      child: SvgPicture.asset('assets/images/parttimeroles.svg',
          semanticsLabel: 'parttimeroles'),
    ),
    Positioned(
      top: 1194,
      left: 794.3671875,
      child: SvgPicture.asset('assets/images/raisingfunding.svg',
          semanticsLabel: 'raisingfunding'),
    ),
    Positioned(
      top: 1149,
      left: 929.3671875,
      child: SvgPicture.asset('assets/images/writing.svg',
          semanticsLabel: 'writing'),
    ),
    Positioned(
      top: 1075.4580078125,
      left: 769.7786865234375,
      child: SvgPicture.asset('assets/images/speakingatevents.svg',
          semanticsLabel: 'speakingatevents'),
    ),
    Positioned(
      top: 1319,
      left: 616.1656494140625,
      child: SvgPicture.asset('assets/images/speakingonpodcasts.svg',
          semanticsLabel: 'speakingonpodcasts'),
    ),
    Positioned(
      top: 1264,
      left: 89.36735534667969,
      child: SvgPicture.asset('assets/images/reasearchroles.svg',
          semanticsLabel: 'reasearchroles'),
    ),
    Positioned(
      top: 1146.3466796875,
      left: -1.1968950275331736e-9,
      child: SvgPicture.asset('assets/images/participatingincompetetions.svg',
          semanticsLabel: 'participatingincompetetions'),
    ),
    Positioned(
      top: 1088,
      left: 76.3671875,
      child: SvgPicture.asset('assets/images/cofoundingaclub.svg',
          semanticsLabel: 'cofoundingaclub'),
    ),
    Positioned(
        top: 695,
        left: 819.3671875,
        child: Text(
          'Open Source contributions',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 546,
        left: 819.3671875,
        child: Text(
          'Mentoring',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 667,
        left: 564.3671875,
        child: Text(
          'Co-founding a non profit organisation',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1268,
        left: 1131.3671875,
        child: Text(
          'Writing',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 958,
        left: 685.3671875,
        child: Text(
          'Part time roles',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1120,
        left: 559.3671875,
        child: Text(
          'Collaborating on side projects',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1279,
        left: 593.3671875,
        child: Text(
          'Starting a podcast',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1150,
        left: 145.3671875,
        child: Text(
          'Co-founding a club',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1341,
        left: 186.3671875,
        child: Text(
          'Research roles',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1251,
        left: 54.3671875,
        child: Text(
          'Participating in competitions ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1443,
        left: 77.36735534667969,
        child: Text(
          'Beta testing new products',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1414,
        left: 756.3671875,
        child: Text(
          'Speaking on Podcasts',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1387,
        left: 991.3671875,
        child: Text(
          'Raising funding',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1041,
        left: 911.3671875,
        child: Text(
          'Volunteering',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1183,
        left: 871.376708984375,
        child: Text(
          'Speaking at events',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 385,
      left: 180.36740112304688,
      child: SvgPicture.asset('assets/images/hiring.svg',
          semanticsLabel: 'hiring'),
    ),
    Positioned(
      top: 297,
      left: 169.37619018554688,
      child: SvgPicture.asset('assets/images/livestreaming.svg',
          semanticsLabel: 'livestreaming'),
    ),
    Positioned(
      top: 367,
      left: 104.36740112304688,
      child: SvgPicture.asset('assets/images/internships.svg',
          semanticsLabel: 'internships'),
    ),
    Positioned(
        top: 440,
        left: 316.36700439453125,
        child: Text(
          'Live streaming',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 430,
        left: 191.3669891357422,
        child: Text(
          'Internships',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 516,
        left: 275.3671875,
        child: Text(
          'Hiring',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 841.1741943359375,
      left: 89.12344360351562,
      child: SvgPicture.asset('assets/images/guestlecturing.svg',
          semanticsLabel: 'guestlecturing'),
    ),
    Positioned(
      top: 660,
      left: 27.376327514648438,
      child: SvgPicture.asset('assets/images/creatingcontent.svg',
          semanticsLabel: 'creatingcontent'),
    ),
    Positioned(
      top: 677.6497802734375,
      left: 101.19535827636719,
      child: SvgPicture.asset('assets/images/meetingnewpeople.svg',
          semanticsLabel: 'meetingnewpeople'),
    ),
    Positioned(
        top: 803,
        left: 168.3760223388672,
        child: Text(
          'Meeting new people',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 934,
        left: 152.3760528564453,
        child: Text(
          'Guest lecturing',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 813,
        left: 59.37609100341797,
        child: Text(
          'Creating content',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
      top: 1828,
      left: 1389,
      child:
          SvgPicture.asset('assets/images/dance.svg', semanticsLabel: 'dance'),
    ),
    Positioned(
      top: 1119,
      left: 1897.3731689453125,
      child: SvgPicture.asset('assets/images/popculture.svg',
          semanticsLabel: 'popculture'),
    ),
    Positioned(
      top: 1435.6953125,
      left: 1705.1729736328125,
      child: SvgPicture.asset('assets/images/fashionstylist.svg',
          semanticsLabel: 'fashionstylist'),
    ),
    Positioned(
      top: 1685.4580078125,
      left: 1367.7608642578125,
      child: SvgPicture.asset('assets/images/photography.svg',
          semanticsLabel: 'photography'),
    ),
    Positioned(
      top: 1350,
      left: 1899.3731689453125,
      child: SvgPicture.asset('assets/images/filmmaking.svg',
          semanticsLabel: 'filmmaking'),
    ),
    Positioned(
      top: 1193,
      left: 1768.3731689453125,
      child: SvgPicture.asset('assets/images/contentcreator.svg',
          semanticsLabel: 'contentcreator'),
    ),
    Positioned(
      top: 1890,
      left: 1517.3731689453125,
      child: SvgPicture.asset('assets/images/artist.svg',
          semanticsLabel: 'artist'),
    ),
    Positioned(
      top: 1404.4599609375,
      left: 1565.3878173828125,
      child: SvgPicture.asset('assets/images/singer.svg',
          semanticsLabel: 'singer'),
    ),
    Positioned(
      top: 1716,
      left: 1964.3731689453125,
      child:
          SvgPicture.asset('assets/images/gamer.svg', semanticsLabel: 'gamer'),
    ),
    Positioned(
      top: 1849,
      left: 1831.3731689453125,
      child:
          SvgPicture.asset('assets/images/drama.svg', semanticsLabel: 'drama'),
    ),
    Positioned(
      top: 1511,
      left: 2071.373046875,
      child:
          SvgPicture.asset('assets/images/actor.svg', semanticsLabel: 'actor'),
    ),
    Positioned(
      top: 1446.3828125,
      left: 1296.3673095703125,
      child: SvgPicture.asset('assets/images/guitarist.svg',
          semanticsLabel: 'guitarist'),
    ),
    Positioned(
      top: 1718.125,
      left: 1663.720947265625,
      child: SvgPicture.asset('assets/images/graphicdesign.svg',
          semanticsLabel: 'graphicdesign'),
    ),
    Positioned(
      top: 1149,
      left: 1505.3731689453125,
      child:
          SvgPicture.asset('assets/images/music.svg', semanticsLabel: 'music'),
    ),
    Positioned(
        top: 1330,
        left: 1756.3731689453125,
        child: Text(
          'Music',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1530,
        left: 1626.9141845703125,
        child: Text(
          'Singer',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1956,
        left: 1472.0001220703125,
        child: Text(
          'Dance',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1588,
        left: 1426.4796142578125,
        child: Text(
          'Guitarist',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1787,
        left: 1505.3673095703125,
        child: Text(
          'Photography',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1886,
        left: 1782.8077392578125,
        child: Text(
          'Graphic Design',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1780,
        left: 2051.373046875,
        child: Text(
          'Gamer',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1641,
        left: 1816.3731689453125,
        child: Text(
          'Fashion stylist',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1475,
        left: 2037.3673095703125,
        child: Text(
          'Film Making',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1288,
        left: 1926.3731689453125,
        child: Text(
          'Content creator',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1327,
        left: 2171.373046875,
        child: Text(
          'Pop culture',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1992,
        left: 1907.3731689453125,
        child: Text(
          'Drama',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 2009,
        left: 1643.3731689453125,
        child: Text(
          'Artist',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
    Positioned(
        top: 1644,
        left: 2194.373046875,
        child: Text(
          'Actor',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Inter',
              fontSize: 14,
              letterSpacing:
                  0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.4285714285714286),
        )),
  ];

  void getTopAndLeftPositions() {
    int index = 0;
    print(math.pi / 180);
    for (var widget in positionedWidgets) {
      if (widget is Positioned) {
        if (widget.child is SvgPicture || widget.child is Transform) {
          var newWidget, dummyWidget, angle;
          if (widget.child is Transform) {
            dummyWidget = widget.child as Transform;
            if (dummyWidget.child is SvgPicture) {
              newWidget = dummyWidget.child as SvgPicture;
            }
          } else {
            newWidget = widget.child as SvgPicture;
          }
          if (newWidget != null) {
            double top = widget.top ?? 0.0;
            double left = widget.left ?? 0.0;
            print(
                '{"top": $top, "left": $left, "semanticsLabel": "${newWidget.semanticsLabel}"},');
            index++;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group4540Widget - GROUP
    return SizedBox(
      width: 3427,
      height: 2265,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 587.55078125,
            left: 2284.296142578125,
            child: SvgPicture.asset('assets/images/environmentalist.svg',
                semanticsLabel: 'environmentalist'),
          ),
          Positioned(
            top: 371.1923828125,
            left: 2470.792236328125,
            child: SvgPicture.asset('assets/images/chess.svg',
                semanticsLabel: 'chess'),
          ),
          Positioned(
            top: 865.2998046875,
            left: 2423.871337890625,
            child: SvgPicture.asset('assets/images/influencer.svg',
                semanticsLabel: 'influencer'),
          ),
          Positioned(
            top: 777,
            left: 2640,
            child: SvgPicture.asset('assets/images/politics.svg',
                semanticsLabel: 'politics'),
          ),
          Positioned(
            top: 745.818359375,
            left: 2322.847900390625,
            child: SvgPicture.asset('assets/images/mentalhealth.svg',
                semanticsLabel: 'mentalhealth'),
          ),
          Positioned(
            top: 746.669921875,
            left: 2578.355712890625,
            child: SvgPicture.asset('assets/images/journalism.svg',
                semanticsLabel: 'journalism'),
          ),
          Positioned(
            top: 976.8876953125,
            left: 2636.317626953125,
            child: SvgPicture.asset('assets/images/traveler.svg',
                semanticsLabel: 'traveler'),
          ),
          Positioned(
            top: 671.7998046875,
            left: 2648.567626953125,
            child: SvgPicture.asset('assets/images/socialservice.svg',
                semanticsLabel: 'socialservice'),
          ),
          Positioned(
            top: 462.169921875,
            left: 2521.617431640625,
            child: SvgPicture.asset('assets/images/sports.svg',
                semanticsLabel: 'sports'),
          ),
          Positioned(
            top: 405.998046875,
            left: 2301.961181640625,
            child: SvgPicture.asset('assets/images/climatechange.svg',
                semanticsLabel: 'climatechange'),
          ),
          Positioned(
              top: 531,
              left: 2410.367431640625,
              child: Text(
                'Climate change',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 678,
              left: 2465.367431640625,
              child: Text(
                'Environmentalist',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 827,
              left: 2445.367431640625,
              child: Text(
                'Mental health',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 563,
              left: 2593.367431640625,
              child: Text(
                'Sports',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 462,
              left: 2533.367431640625,
              child: Text(
                'Chess',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 753,
              left: 2702.367431640625,
              child: Text(
                'Social service',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 877,
              left: 2766,
              child: Text(
                'Politics',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 897,
              left: 2640.367431640625,
              child: Text(
                'Journalism',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1022,
              left: 2702.367431640625,
              child: Text(
                'Traveler',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 923,
              left: 2444.367431640625,
              child: Text(
                'Influencer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 257,
              left: 2802,
              child: Transform.rotate(
                angle: 6.3611093629270335e-15 * (math.pi / 180),
                child: SvgPicture.asset('assets/images/cybersecurity.svg',
                    semanticsLabel: 'cybersecurity'),
              )),
          Positioned(
            top: 127.369140625,
            left: 2627.441650390625,
            child: SvgPicture.asset('assets/images/uiuxdesign.svg',
                semanticsLabel: 'uiuxdesign'),
          ),
          Positioned(
            top: 286.4287109375,
            left: 2955.472900390625,
            child: SvgPicture.asset('assets/images/speaker.svg',
                semanticsLabel: 'speaker'),
          ),
          Positioned(
            top: 516.5595703125,
            left: 3020.133056640625,
            child: SvgPicture.asset('assets/images/computerscience.svg',
                semanticsLabel: 'computerscience'),
          ),
          Positioned(
            top: 366.9677734375,
            left: 3110.980712890625,
            child: SvgPicture.asset('assets/images/inventor.svg',
                semanticsLabel: 'inventor'),
          ),
          Positioned(
            top: 211.5869140625,
            left: 3033.797119140625,
            child: SvgPicture.asset('assets/images/opensource.svg',
                semanticsLabel: 'opensource'),
          ),
          Positioned(
            top: 2.0361328125,
            left: 2892.179931640625,
            child: SvgPicture.asset('assets/images/bllockchain.svg',
                semanticsLabel: 'bllockchain'),
          ),
          Positioned(
              top: 452,
              left: 2873,
              child: Text(
                'Cybersecurity',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 217.78515625,
              left: 2829.431884765625,
              child: Text(
                'UI/UX Design',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 97.830078125,
              left: 2952.140869140625,
              child: Text(
                'Blockchain',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 292.7568359375,
              left: 3093.812744140625,
              child: Text(
                'Open Source',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 437.701171875,
              left: 3040.265869140625,
              child: Text(
                'Speaker',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 561.654296875,
              left: 3053.652587890625,
              child: Text(
                'Computer science',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 457.6943359375,
              left: 3171.898681640625,
              child: Text(
                'Inventor',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 1481,
            left: 2701,
            child: SvgPicture.asset('assets/images/petowner.svg',
                semanticsLabel: 'petowner'),
          ),
          Positioned(
            top: 1241,
            left: 2556,
            child: SvgPicture.asset('assets/images/figmawizard.svg',
                semanticsLabel: 'figmawizard'),
          ),
          Positioned(
            top: 904,
            left: 2845,
            child: SvgPicture.asset('assets/images/researching.svg',
                semanticsLabel: 'researching'),
          ),
          Positioned(
            top: 1229,
            left: 2889,
            child: SvgPicture.asset('assets/images/mentor.svg',
                semanticsLabel: 'mentor'),
          ),
          Positioned(
            top: 1253,
            left: 3087,
            child: SvgPicture.asset('assets/images/reader.svg',
                semanticsLabel: 'reader'),
          ),
          Positioned(
            top: 1171,
            left: 2991,
            child: SvgPicture.asset('assets/images/teacher.svg',
                semanticsLabel: 'teacher'),
          ),
          Positioned(
            top: 1794,
            left: 2600,
            child: SvgPicture.asset('assets/images/culinaryarts.svg',
                semanticsLabel: 'culinaryarts'),
          ),
          Positioned(
            top: 1643,
            left: 2796,
            child: SvgPicture.asset('assets/images/mathematics.svg',
                semanticsLabel: 'mathematics'),
          ),
          Positioned(
            top: 1935,
            left: 2870,
            child: SvgPicture.asset('assets/images/youtube.svg',
                semanticsLabel: 'youtube'),
          ),
          Positioned(
            top: 1547.7783203125,
            left: 2885.345703125,
            child: SvgPicture.asset('assets/images/psychology.svg',
                semanticsLabel: 'psychology'),
          ),
          Positioned(
            top: 1733.3818359375,
            left: 2973.234375,
            child: SvgPicture.asset('assets/images/stem.svg',
                semanticsLabel: 'stem'),
          ),
          Positioned(
            top: 1775,
            left: 3122,
            child: SvgPicture.asset('assets/images/volunteer.svg',
                semanticsLabel: 'volunteer'),
          ),
          Positioned(
            top: 1618,
            left: 3170,
            child: SvgPicture.asset('assets/images/podcaster.svg',
                semanticsLabel: 'podcaster'),
          ),
          Positioned(
            top: 1363,
            left: 2899,
            child: SvgPicture.asset('assets/images/writer.svg',
                semanticsLabel: 'writer'),
          ),
          Positioned(
            top: 1927,
            left: 2410,
            child: SvgPicture.asset('assets/images/astronomy.svg',
                semanticsLabel: 'astronomy'),
          ),
          Positioned(
            top: 1468.4794921875,
            left: 3089.7421875,
            child: SvgPicture.asset('assets/images/foriegnlanguage.svg',
                semanticsLabel: 'foriegnlanguage'),
          ),
          Positioned(
            top: 1413,
            left: 2912,
            child: SvgPicture.asset('assets/images/intern.svg',
                semanticsLabel: 'intern'),
          ),
          Positioned(
            top: 1374,
            left: 3045,
            child: SvgPicture.asset('assets/images/science.svg',
                semanticsLabel: 'science'),
          ),
          Positioned(
              top: 1087,
              left: 3030,
              child: Text(
                'Researching',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1400,
              left: 2804,
              child: Text(
                'Figma Wizard',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1253,
              left: 3076,
              child: Text(
                'Teacher',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1461,
              left: 3153,
              child: Text(
                'Science',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1353,
              left: 3026,
              child: Text(
                'Mentor',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1433,
              left: 2934,
              child: Text(
                'Writer',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1500,
              left: 3005,
              child: Text(
                'Intern',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1374,
              left: 3242,
              child: Text(
                'Reader',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1585,
              left: 3136,
              child: Text(
                'Foreign Language',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1688,
              left: 3211,
              child: Text(
                'Podcaster',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1655,
              left: 2959,
              child: Text(
                'Psychology',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1853,
              left: 2872,
              child: Text(
                'Mathematics',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1836,
              left: 3067,
              child: Text(
                'STEM',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1878,
              left: 3176,
              child: Text(
                'Volunteer',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1863,
              left: 2653,
              child: Text(
                'Culinary arts and bakery',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 2056,
              left: 2709,
              child: Text(
                'Astronomy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 2001,
              left: 2943,
              child: Text(
                'YouTube',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1578,
              left: 2747,
              child: Text(
                'Pet Owner',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 288.6953125,
            left: 1765.1671142578125,
            child: SvgPicture.asset('assets/images/humanresources.svg',
                semanticsLabel: 'humanresources'),
          ),
          Positioned(
            top: 528,
            left: 1213.3673095703125,
            child: SvgPicture.asset('assets/images/businessandeconomics.svg',
                semanticsLabel: 'businessandeconomics'),
          ),
          Positioned(
            top: 538.4580078125,
            left: 1427.7550048828125,
            child: SvgPicture.asset('assets/images/finance.svg',
                semanticsLabel: 'finance'),
          ),
          Positioned(
            top: 257.4599609375,
            left: 1625.3819580078125,
            child: SvgPicture.asset('assets/images/investor.svg',
                semanticsLabel: 'investor'),
          ),
          Positioned(
            top: 712.3037109375,
            left: 1385.3878173828125,
            child: SvgPicture.asset('assets/images/nonprofitfounder.svg',
                semanticsLabel: 'nonprofitfounder'),
          ),
          Positioned(
            top: 299.3828125,
            left: 1356.361572265625,
            child: SvgPicture.asset('assets/images/marketer.svg',
                semanticsLabel: 'marketer'),
          ),
          Positioned(
            top: 782,
            left: 1581.3673095703125,
            child: SvgPicture.asset('assets/images/blogger.svg',
                semanticsLabel: 'blogger'),
          ),
          Positioned(
            top: 571.125,
            left: 1723.715087890625,
            child: SvgPicture.asset('assets/images/youngachiever.svg',
                semanticsLabel: 'youngachiever'),
          ),
          Positioned(
            top: 25,
            left: 1686.3673095703125,
            child: SvgPicture.asset('assets/images/entrepreneur.svg',
                semanticsLabel: 'entrepreneur'),
          ),
          Positioned(
              top: 174,
              left: 1809.3673095703125,
              child: Text(
                'Entrepreneur',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 0,
            left: 1401.3673095703125,
            child: SvgPicture.asset('assets/images/vector.svg',
                semanticsLabel: 'vector'),
          ),
          Positioned(
              top: 102,
              left: 1557.3673095703125,
              child: Text(
                'Finance',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 159,
            left: 1416.3673095703125,
            child: SvgPicture.asset('assets/images/vector.svg',
                semanticsLabel: 'vector'),
          ),
          Positioned(
              top: 237,
              left: 1583.7608642578125,
              child: Text(
                'Founder',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 425,
              left: 1682.9083251953125,
              child: Text(
                'Investor',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 441,
              left: 1486.4737548828125,
              child: Text(
                'Marketer',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 640,
              left: 1565.0069580078125,
              child: Text(
                'Biology',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 623,
              left: 1315.3428955078125,
              child: Text(
                'Business and Economics',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 819,
              left: 1456.3673095703125,
              child: Text(
                'Non-Profit Founder',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 884,
              left: 1746.3673095703125,
              child: Text(
                'Blogger',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 723,
              left: 1840.3673095703125,
              child: Text(
                'Young Achiever',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 477,
              left: 1917.3673095703125,
              child: Text(
                'Human Resources',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1486.8941650390625,
              left: 277.868896484375,
              child: Transform.rotate(
                angle: -1.0699126733236732e-8 * (math.pi / 180),
                child: SvgPicture.asset(
                    'assets/images/givingportfoliofeedback.svg',
                    semanticsLabel: 'givingportfoliofeedback'),
              )),
          Positioned(
              top: 1717.912841796875,
              left: 427.35540771484375,
              child: Transform.rotate(
                angle: -1.0699126733236732e-8 * (math.pi / 180),
                child: SvgPicture.asset('assets/images/cofoundingacompany.svg',
                    semanticsLabel: 'cofoundingacompany'),
              )),
          Positioned(
              top: 1598.1175537109375,
              left: 326.80462646484375,
              child: Transform.rotate(
                angle: -1.0699126733236732e-8 * (math.pi / 180),
                child: SvgPicture.asset('assets/images/brainstorming.svg',
                    semanticsLabel: 'brainstorming'),
              )),
          Positioned(
              top: 1599.9659423828125,
              left: 582.0626831054688,
              child: Transform.rotate(
                angle: -1.0699126733236732e-8 * (math.pi / 180),
                child: SvgPicture.asset('assets/images/workingonprojects.svg',
                    semanticsLabel: 'workingonprojects'),
              )),
          Positioned(
              top: 1271,
              left: 39.36720657348633,
              child: Transform.rotate(
                angle: -1.0699126733236732e-8 * (math.pi / 180),
                child: SvgPicture.asset(
                    'assets/images/betatestingnewproducts.svg',
                    semanticsLabel: 'betatestingnewproducts'),
              )),
          Positioned(
              top: 1679.2138671875,
              left: 449.3475646972656,
              child: Transform.rotate(
                angle: -0.2681178021640231 * (math.pi / 180),
                child: Text(
                  'Brainstorming',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.4285714285714286),
                ),
              )),
          Positioned(
              top: 1565.000244140625,
              left: 433.4601135253906,
              child: Transform.rotate(
                angle: -0.2681178021640231 * (math.pi / 180),
                child: Text(
                  'Giving portfolio feedback',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.4285714285714286),
                ),
              )),
          Positioned(
              top: 1770.7913818359375,
              left: 454.8478088378906,
              child: Transform.rotate(
                angle: -0.2681178021640231 * (math.pi / 180),
                child: Text(
                  'Co-founding a company',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.4285714285714286),
                ),
              )),
          Positioned(
              top: 1751.6011962890625,
              left: 627.941650390625,
              child: Transform.rotate(
                angle: -0.2681178021640231 * (math.pi / 180),
                child: Text(
                  'Working on projects',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 14,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.4285714285714286),
                ),
              )),
          Positioned(
            top: 529,
            left: 441.3671875,
            child: SvgPicture.asset('assets/images/cofoundinganonprofit.svg',
                semanticsLabel: 'cofoundinganonprofit'),
          ),
          Positioned(
            top: 450.9999694824219,
            left: 660.3671875,
            child: SvgPicture.asset('assets/images/mentoring.svg',
                semanticsLabel: 'mentoring'),
          ),
          Positioned(
            top: 906,
            left: 495.3671875,
            child: SvgPicture.asset(
                'assets/images/collaboratingonsideprojects.svg',
                semanticsLabel: 'collaboratingonsideprojects'),
          ),
          Positioned(
            top: 620,
            left: 687.3671875,
            child: SvgPicture.asset('assets/images/opensourcecontributions.svg',
                semanticsLabel: 'opensourcecontributions'),
          ),
          Positioned(
            top: 1175,
            left: 534.3671875,
            child: SvgPicture.asset('assets/images/startingapodcast.svg',
                semanticsLabel: 'startingapodcast'),
          ),
          Positioned(
            top: 874,
            left: 781.3671875,
            child: SvgPicture.asset('assets/images/volunteering.svg',
                semanticsLabel: 'volunteering'),
          ),
          Positioned(
            top: 704,
            left: 574.3671875,
            child: SvgPicture.asset('assets/images/parttimeroles.svg',
                semanticsLabel: 'parttimeroles'),
          ),
          Positioned(
            top: 1194,
            left: 794.3671875,
            child: SvgPicture.asset('assets/images/raisingfunding.svg',
                semanticsLabel: 'raisingfunding'),
          ),
          Positioned(
            top: 1149,
            left: 929.3671875,
            child: SvgPicture.asset('assets/images/writing.svg',
                semanticsLabel: 'writing'),
          ),
          Positioned(
            top: 1075.4580078125,
            left: 769.7786865234375,
            child: SvgPicture.asset('assets/images/speakingatevents.svg',
                semanticsLabel: 'speakingatevents'),
          ),
          Positioned(
            top: 1319,
            left: 616.1656494140625,
            child: SvgPicture.asset('assets/images/speakingonpodcasts.svg',
                semanticsLabel: 'speakingonpodcasts'),
          ),
          Positioned(
            top: 1264,
            left: 89.36735534667969,
            child: SvgPicture.asset('assets/images/reasearchroles.svg',
                semanticsLabel: 'reasearchroles'),
          ),
          Positioned(
            top: 1146.3466796875,
            left: -1.1968950275331736e-9,
            child: SvgPicture.asset(
                'assets/images/participatingincompetetions.svg',
                semanticsLabel: 'participatingincompetetions'),
          ),
          Positioned(
            top: 1088,
            left: 76.3671875,
            child: SvgPicture.asset('assets/images/cofoundingaclub.svg',
                semanticsLabel: 'cofoundingaclub'),
          ),
          Positioned(
              top: 695,
              left: 819.3671875,
              child: Text(
                'Open Source contributions',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 546,
              left: 819.3671875,
              child: Text(
                'Mentoring',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 667,
              left: 564.3671875,
              child: Text(
                'Co-founding a non profit organisation',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1268,
              left: 1131.3671875,
              child: Text(
                'Writing',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 958,
              left: 685.3671875,
              child: Text(
                'Part time roles',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1120,
              left: 559.3671875,
              child: Text(
                'Collaborating on side projects',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1279,
              left: 593.3671875,
              child: Text(
                'Starting a podcast',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1150,
              left: 145.3671875,
              child: Text(
                'Co-founding a club',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1341,
              left: 186.3671875,
              child: Text(
                'Research roles',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1251,
              left: 54.3671875,
              child: Text(
                'Participating in competitions ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1443,
              left: 77.36735534667969,
              child: Text(
                'Beta testing new products',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1414,
              left: 756.3671875,
              child: Text(
                'Speaking on Podcasts',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1387,
              left: 991.3671875,
              child: Text(
                'Raising funding',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1041,
              left: 911.3671875,
              child: Text(
                'Volunteering',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1183,
              left: 871.376708984375,
              child: Text(
                'Speaking at events',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 385,
            left: 180.36740112304688,
            child: SvgPicture.asset('assets/images/hiring.svg',
                semanticsLabel: 'hiring'),
          ),
          Positioned(
            top: 297,
            left: 169.37619018554688,
            child: SvgPicture.asset('assets/images/livestreaming.svg',
                semanticsLabel: 'livestreaming'),
          ),
          Positioned(
            top: 367,
            left: 104.36740112304688,
            child: SvgPicture.asset('assets/images/internships.svg',
                semanticsLabel: 'internships'),
          ),
          Positioned(
              top: 440,
              left: 316.36700439453125,
              child: Text(
                'Live streaming',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 430,
              left: 191.3669891357422,
              child: Text(
                'Internships',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 516,
              left: 275.3671875,
              child: Text(
                'Hiring',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 841.1741943359375,
            left: 89.12344360351562,
            child: SvgPicture.asset('assets/images/guestlecturing.svg',
                semanticsLabel: 'guestlecturing'),
          ),
          Positioned(
            top: 660,
            left: 27.376327514648438,
            child: SvgPicture.asset('assets/images/creatingcontent.svg',
                semanticsLabel: 'creatingcontent'),
          ),
          Positioned(
            top: 677.6497802734375,
            left: 101.19535827636719,
            child: SvgPicture.asset('assets/images/meetingnewpeople.svg',
                semanticsLabel: 'meetingnewpeople'),
          ),
          Positioned(
              top: 803,
              left: 168.3760223388672,
              child: Text(
                'Meeting new people',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 934,
              left: 152.3760528564453,
              child: Text(
                'Guest lecturing',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 813,
              left: 59.37609100341797,
              child: Text(
                'Creating content',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
            top: 1828,
            left: 1389,
            child: SvgPicture.asset('assets/images/dance.svg',
                semanticsLabel: 'dance'),
          ),
          Positioned(
            top: 1119,
            left: 1897.3731689453125,
            child: SvgPicture.asset('assets/images/popculture.svg',
                semanticsLabel: 'popculture'),
          ),
          Positioned(
            top: 1435.6953125,
            left: 1705.1729736328125,
            child: SvgPicture.asset('assets/images/fashionstylist.svg',
                semanticsLabel: 'fashionstylist'),
          ),
          Positioned(
            top: 1685.4580078125,
            left: 1367.7608642578125,
            child: SvgPicture.asset('assets/images/photography.svg',
                semanticsLabel: 'photography'),
          ),
          Positioned(
            top: 1350,
            left: 1899.3731689453125,
            child: SvgPicture.asset('assets/images/filmmaking.svg',
                semanticsLabel: 'filmmaking'),
          ),
          Positioned(
            top: 1193,
            left: 1768.3731689453125,
            child: SvgPicture.asset('assets/images/contentcreator.svg',
                semanticsLabel: 'contentcreator'),
          ),
          Positioned(
            top: 1890,
            left: 1517.3731689453125,
            child: SvgPicture.asset('assets/images/artist.svg',
                semanticsLabel: 'artist'),
          ),
          Positioned(
            top: 1404.4599609375,
            left: 1565.3878173828125,
            child: SvgPicture.asset('assets/images/singer.svg',
                semanticsLabel: 'singer'),
          ),
          Positioned(
            top: 1716,
            left: 1964.3731689453125,
            child: SvgPicture.asset('assets/images/gamer.svg',
                semanticsLabel: 'gamer'),
          ),
          Positioned(
            top: 1849,
            left: 1831.3731689453125,
            child: SvgPicture.asset('assets/images/drama.svg',
                semanticsLabel: 'drama'),
          ),
          Positioned(
            top: 1511,
            left: 2071.373046875,
            child: SvgPicture.asset('assets/images/actor.svg',
                semanticsLabel: 'actor'),
          ),
          Positioned(
            top: 1446.3828125,
            left: 1296.3673095703125,
            child: SvgPicture.asset('assets/images/guitarist.svg',
                semanticsLabel: 'guitarist'),
          ),
          Positioned(
            top: 1718.125,
            left: 1663.720947265625,
            child: SvgPicture.asset('assets/images/graphicdesign.svg',
                semanticsLabel: 'graphicdesign'),
          ),
          Positioned(
            top: 1149,
            left: 1505.3731689453125,
            child: SvgPicture.asset('assets/images/music.svg',
                semanticsLabel: 'music'),
          ),
          Positioned(
              top: 1330,
              left: 1756.3731689453125,
              child: Text(
                'Music',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1530,
              left: 1626.9141845703125,
              child: Text(
                'Singer',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1956,
              left: 1472.0001220703125,
              child: Text(
                'Dance',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1588,
              left: 1426.4796142578125,
              child: Text(
                'Guitarist',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1787,
              left: 1505.3673095703125,
              child: Text(
                'Photography',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1886,
              left: 1782.8077392578125,
              child: Text(
                'Graphic Design',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1780,
              left: 2051.373046875,
              child: Text(
                'Gamer',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1641,
              left: 1816.3731689453125,
              child: Text(
                'Fashion stylist',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1475,
              left: 2037.3673095703125,
              child: Text(
                'Film Making',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1288,
              left: 1926.3731689453125,
              child: Text(
                'Content creator',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1327,
              left: 2171.373046875,
              child: Text(
                'Pop culture',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1992,
              left: 1907.3731689453125,
              child: Text(
                'Drama',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 2009,
              left: 1643.3731689453125,
              child: Text(
                'Artist',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
          Positioned(
              top: 1644,
              left: 2194.373046875,
              child: Text(
                'Actor',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.4285714285714286),
              )),
        ],
      ),
    );
  }
}
