//When in future adding new platform,
//add in the end only as it would break the flow
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialPlatforms {
  github,
  linkedin,
  twitter,
  instagram,
  website,
}

IconData socialIcon(SocialPlatforms? p) {
  IconData iconData = FontAwesomeIcons.link;
  switch (p) {
    case SocialPlatforms.github:
      iconData = FontAwesomeIcons.github;
      break;
    case SocialPlatforms.linkedin:
      iconData = FontAwesomeIcons.linkedin;
      break;
    case SocialPlatforms.twitter:
      iconData = FontAwesomeIcons.twitter;
      break;
    case SocialPlatforms.instagram:
      iconData = FontAwesomeIcons.instagram;
      break;
    default:
      iconData = FontAwesomeIcons.link;
  }
  return iconData;
}
