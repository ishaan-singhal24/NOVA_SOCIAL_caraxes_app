import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/misc/interfaces/interfaces.dart';
part 'user_dream_college.freezed.dart';
part 'user_dream_college.g.dart';

@freezed
class UserDreamCollege
    with _$UserDreamCollege
    implements GlobalDocHelperInterface, DreamInterface {
  @Implements<GlobalDocHelperInterface>()
  @Implements<DreamInterface>()
  const factory UserDreamCollege({
    String? id,
    String? name,
    String? iconUrl,
    String? country,
    @Default(AppKeyNames.countries) @JsonKey(ignore: true) String? docName,
  }) = _UserDreamCollege;

  factory UserDreamCollege.fromJson(Map<String, dynamic> json) =>
      _$UserDreamCollegeFromJson(json);
}

var dreamCollegesJsonList = [
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/massachusetts-institute-of-technology-mit_410_small.jpg",
    "name": "Massachusetts Institute of Technology (MIT)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/massachusetts-institute-technology-mit",
    "country": "Cambridge, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/massachusetts-institute-of-technology-mit_410_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-oxford_478_small.jpg",
    "name": "University of Oxford",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-oxford",
    "country": "Oxford, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-oxford_478_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/stanford-university_573_small.jpg",
    "name": "Stanford University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/stanford-university",
    "country": "Stanford, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/stanford-university_573_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-cambridge_95_small.jpg",
    "name": "University of Cambridge",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-cambridge",
    "country": "Cambridge, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-cambridge_95_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/harvard-university_253_small.jpg",
    "name": "Harvard University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/harvard-university",
    "country": "Cambridge, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/harvard-university_253_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/california-institute-of-technology-caltech_94_small.jpg",
    "name": "California Institute of Technology (Caltech)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/california-institute-technology-caltech",
    "country": "Pasadena, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/california-institute-of-technology-caltech_94_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/imperial-college-london_592560cf2aeae70239af4be8_small.jpg",
    "name": "Imperial College London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/imperial-college-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/imperial-college-london_592560cf2aeae70239af4be8_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/eth-zurich-swiss-federal-institute-of-technology_201_small.jpg",
    "name": "ETH Zurich",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/eth-zurich",
    "country": "Zürich, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/eth-zurich-swiss-federal-institute-of-technology_201_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ucl_592560cf2aeae70239af4bf1_small.jpg",
    "name": "UCL",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ucl",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ucl_592560cf2aeae70239af4bf1_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-chicago_120_small.jpg",
    "name": "University of Chicago",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-chicago",
    "country": "Chicago, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-chicago_120_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-university-of-singapore-nus_443_small.jpg",
    "name": "National University of Singapore (NUS)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-university-singapore-nus",
    "country": "Singapore, Singapore",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-university-of-singapore-nus_443_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/nanyang-technological-university-singapore-ntu_592560cf2aeae70239af4c32_small.jpg",
    "name": "Nanyang Technological University, Singapore (NTU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/nanyang-technological-university-singapore-ntu",
    "country": "Singapore, Singapore",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/nanyang-technological-university-singapore-ntu_592560cf2aeae70239af4c32_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-pennsylvania_495_small.jpg",
    "name": "University of Pennsylvania",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-pennsylvania",
    "country": "Philadelphia, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-pennsylvania_495_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/epfl-ecole-polytechnique-federale-de-lausanne_592560cf2aeae70239af4b34_small.jpg",
    "name": "EPFL",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/epfl",
    "country": "Lausanne, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/epfl-ecole-polytechnique-federale-de-lausanne_592560cf2aeae70239af4b34_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/yale-university_684_small.jpg",
    "name": "Yale University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/yale-university",
    "country": "New Haven, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/yale-university_684_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-edinburgh_180_small.jpg",
    "name": "The University of Edinburgh",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-edinburgh",
    "country": "Edinburgh, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-edinburgh_180_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tsinghua-university_626_small.jpg",
    "name": "Tsinghua University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tsinghua-university",
    "country": "Beijing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tsinghua-university_626_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/peking-university_50_small.jpg",
    "name": "Peking University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/peking-university",
    "country": "Beijing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/peking-university_50_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/211207010540pm571294Webp.net-resizeimage-2021-12-07T150514.382-48x48.jpg",
    "name": "Columbia University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/columbia-university",
    "country": "New York City, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/211207010540pm571294Webp.net-resizeimage-2021-12-07T150514.382-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/princeton-university_508_small.jpg",
    "name": "Princeton University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/princeton-university",
    "country": "Princeton, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/princeton-university_508_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/cornell-university_143_small.jpg",
    "name": "Cornell University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/cornell-university",
    "country": "Ithaca, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/cornell-university_143_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-hong-kong_268_small.jpg",
    "name": "The University of Hong Kong",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-hong-kong",
    "country": "Hong Kong SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-hong-kong_268_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-tokyo_615_small.jpg",
    "name": "The University of Tokyo",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-tokyo",
    "country": "Tokyo, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-tokyo_615_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-michigan_403_small.jpg",
    "name": "University of Michigan-Ann Arbor",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-michigan-ann-arbor",
    "country": "Ann Arbor, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-michigan_403_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/johns-hopkins-university_305_small.jpg",
    "name": "Johns Hopkins University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/johns-hopkins-university",
    "country": "Baltimore, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/johns-hopkins-university_305_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-toronto_619_small.jpg",
    "name": "University of Toronto",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-toronto",
    "country": "Toronto, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-toronto_619_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/mcgill-university_592560cf2aeae70239af4c10_small.jpg",
    "name": "McGill University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/mcgill-university",
    "country": "Montreal, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/mcgill-university_592560cf2aeae70239af4c10_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ANU-crest-48x48.jpg",
    "name": "Australian National University (ANU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/australian-national-university-anu",
    "country": "Canberra, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ANU-crest-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-manchester_389_small.jpg",
    "name": "The University of Manchester",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-manchester",
    "country": "Manchester, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-manchester_389_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/northwestern-university_592560cf2aeae70239af4c50_small.jpg",
    "name": "Northwestern University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/northwestern-university",
    "country": "Evanston, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/northwestern-university_592560cf2aeae70239af4c50_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/fudan-university_218_small.jpg",
    "name": "Fudan University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/fudan-university",
    "country": "Shanghai, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/fudan-university_218_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-berkeley-ucb_84_small.jpg",
    "name": "University of California, Berkeley (UCB)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-berkeley-ucb",
    "country": "Berkeley, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-berkeley-ucb_84_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kyoto-university_328_small.jpg",
    "name": "Kyoto University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kyoto-university",
    "country": "Kyoto, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kyoto-university_328_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-hong-kong-university-of-science-and-technology_269_small.jpg",
    "name": "The Hong Kong University of Science and Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hong-kong-university-science-technology",
    "country": "Hong Kong SAR, Hong Kong SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-hong-kong-university-of-science-and-technology_269_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kings-college-london_357_small.jpg",
    "name": "King's College London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kings-college-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kings-college-london_357_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/graduate-school-of-business-seoul-national-university_553_small.jpg",
    "name": "Seoul National University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/seoul-national-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/graduate-school-of-business-seoul-national-university_553_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/211118103607am165180PRIMARY-A-A4-Vertical-Housed-RGB-200px-48x48.jpg",
    "name": "The University of Melbourne",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-melbourne",
    "country": "Parkville, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/211118103607am165180PRIMARY-A-A4-Vertical-Housed-RGB-200px-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-sydney_592560cf2aeae70239af4cd0_small.jpg",
    "name": "The University of Sydney",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-sydney",
    "country": "Sydney, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-sydney_592560cf2aeae70239af4cd0_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-chinese-university-of-hong-kong-cuhk_123_small.jpg",
    "name": "The Chinese University of Hong Kong (CUHK)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/chinese-university-hong-kong-cuhk",
    "country": "Hong Kong SAR, Hong Kong SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-chinese-university-of-hong-kong-cuhk_123_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-los-angeles-ucla_87_small.jpg",
    "name": "University of California, Los Angeles (UCLA)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-los-angeles-ucla",
    "country": "Los Angeles, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-los-angeles-ucla_87_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kaist-korea-advanced-institute-of-science-technology_324_small.jpg",
    "name": "KAIST - Korea Advanced Institute of Science & Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kaist-korea-advanced-institute-science-technology",
    "country": "Daejeon, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kaist-korea-advanced-institute-of-science-technology_324_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/new-york-university-nyu_448_small.jpg",
    "name": "New York University (NYU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/new-york-university-nyu",
    "country": "New York City, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/new-york-university-nyu_448_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220816044703am476750UNSW-Master-Brand-Portrait-48x48.jpg",
    "name": "The University of New South Wales (UNSW Sydney)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-new-south-wales-unsw-sydney",
    "country": "Sydney, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220816044703am476750UNSW-Master-Brand-Portrait-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-psl_592560e69988f300e2321dfe_small.jpg",
    "name": "Université PSL",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-psl",
    "country": "Paris, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-psl_592560e69988f300e2321dfe_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/zhejiang-university_592560cf2aeae70239af4d37_small.jpg",
    "name": "Zhejiang University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/zhejiang-university",
    "country": "Hangzhou, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/zhejiang-university_592560cf2aeae70239af4d37_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-british-columbia_70_small.jpg",
    "name": "University of British Columbia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-british-columbia",
    "country": "Vancouver, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-british-columbia_70_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/210824044126am970441uq-logo-48x48.jpg",
    "name": "The University of Queensland",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-queensland",
    "country": "Brisbane City, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/210824044126am970441uq-logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-san-diego-ucsd_89_small.jpg",
    "name": "University of California, San Diego (UCSD)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-san-diego-ucsd",
    "country": "San Diego, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-san-diego-ucsd_89_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/institut-polytechnique-de-paris_5f3a6d4210ca6076bc71cae4_small.jpg",
    "name": "Institut Polytechnique de Paris",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/institut-polytechnique-de-paris",
    "country": "Palaiseau Cedex, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/institut-polytechnique-de-paris_5f3a6d4210ca6076bc71cae4_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/london-school-of-economics-and-political-science-lse_362_small.jpg",
    "name": "The London School of Economics and Political Science (LSE)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/london-school-economics-political-science-lse",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/london-school-of-economics-and-political-science-lse_362_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/shanghai-jiao-tong-university_556_small.jpg",
    "name": "Shanghai Jiao Tong University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/shanghai-jiao-tong-university",
    "country": "Shanghai, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/shanghai-jiao-tong-university_556_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/technical-university-of-munich_599_small.jpg",
    "name": "Technical University of Munich",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/technical-university-munich",
    "country": "Munich, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/technical-university-of-munich_599_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/duke-university_168_small.jpg",
    "name": "Duke University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/duke-university",
    "country": "Durham, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/duke-university_168_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/carnegie-mellon-university_101_small.jpg",
    "name": "Carnegie Mellon University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/carnegie-mellon-university",
    "country": "Pittsburgh, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/carnegie-mellon-university_101_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/city-university-of-hong-kong_592560cf2aeae70239af4b05_small.jpg",
    "name": "City University of Hong Kong",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/city-university-hong-kong",
    "country": "Hong Kong SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/city-university-of-hong-kong_592560cf2aeae70239af4b05_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-amsterdam_18_small.jpg",
    "name": "University of Amsterdam",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-amsterdam",
    "country": "Amsterdam, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-amsterdam_18_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tokyo-institute-of-technology_592560cf2aeae70239af4ceb_small.jpg",
    "name": "Tokyo Institute of Technology (Tokyo Tech)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tokyo-institute-technology-tokyo-tech",
    "country": "Tokyo, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tokyo-institute-of-technology_592560cf2aeae70239af4ceb_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/delft-university-of-technology_155_small.jpg",
    "name": "Delft University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/delft-university-technology",
    "country": "Delft, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/delft-university-of-technology_155_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/monash-university_412_small.jpg",
    "name": "Monash University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/monash-university",
    "country": "Melbourne, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/monash-university_412_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/brown-university_72_small.jpg",
    "name": "Brown University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/brown-university",
    "country": "Providence, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/brown-university_72_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-warwick_664_small.jpg",
    "name": "The University of Warwick",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-warwick",
    "country": "Coventry, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-warwick_664_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-bristol_69_small.jpg",
    "name": "University of Bristol",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-bristol",
    "country": "Bristol, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-bristol_69_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ruprecht-karls-universitaet-heidelberg_259_small.jpg",
    "name": "Ruprecht-Karls-Universität Heidelberg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ruprecht-karls-universitat-heidelberg",
    "country": "Heidelberg, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ruprecht-karls-universitaet-heidelberg_259_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ludwig-maximilians-universitt-mnchen_420_small.jpg",
    "name": "Ludwig-Maximilians-Universität München",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ludwig-maximilians-universitat-munchen",
    "country": "Munich, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ludwig-maximilians-universitt-mnchen_420_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-malaya-um_383_small.jpg",
    "name": "Universiti Malaya (UM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-malaya-um",
    "country": "Kuala Lumpur, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-malaya-um_383_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-hong-kong-polytechnic-university_267_small.jpg",
    "name": "The Hong Kong Polytechnic University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hong-kong-polytechnic-university",
    "country": "Hong Kong SAR, Hong Kong SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-hong-kong-polytechnic-university_267_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-texas-at-austin_604_small.jpg",
    "name": "University of Texas at Austin",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-texas-austin",
    "country": "Austin, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-texas-at-austin_604_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-taiwan-university-ntu_592560cf2aeae70239af4c3c_small.jpg",
    "name": "National Taiwan University (NTU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-taiwan-university-ntu",
    "country": "Taipei City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-taiwan-university-ntu_592560cf2aeae70239af4c3c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-buenos-aires-uba_78_small.jpg",
    "name": "Universidad de Buenos Aires (UBA)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-buenos-aires-uba",
    "country": "Buenos Aires, Argentina",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-buenos-aires-uba_78_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ku-leuven_592560cf2aeae70239af4aec_small.jpg",
    "name": "KU Leuven",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ku-leuven",
    "country": "Leuven, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ku-leuven_592560cf2aeae70239af4aec_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-zurich_693_small.jpg",
    "name": "University of Zurich",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-zurich",
    "country": "Zürich, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-zurich_693_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sorbonne-university_5a6afcfecb4de709397114fe_small.jpg",
    "name": "Sorbonne University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sorbonne-university",
    "country": "Paris, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sorbonne-university_5a6afcfecb4de709397114fe_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-glasgow_592560cf2aeae70239af4b6c_small.jpg",
    "name": "University of Glasgow",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-glasgow",
    "country": "Glasgow, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-glasgow_592560cf2aeae70239af4b6c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/korea-university_325_small.jpg",
    "name": "Korea University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/korea-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/korea-university_325_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/osaka-university_472_small.jpg",
    "name": "Osaka University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/osaka-university",
    "country": "Osaka City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/osaka-university_472_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-wisconsin-madison_678_small.jpg",
    "name": "University of Wisconsin-Madison",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-wisconsin-madison",
    "country": "Madison, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-wisconsin-madison_678_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-southampton_567_small.jpg",
    "name": "University of Southampton",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-southampton",
    "country": "Southampton, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-southampton_567_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/lomonosov-moscow-state-university-_592560cf2aeae70239af4c27_small.jpg",
    "name": "Lomonosov Moscow State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/lomonosov-moscow-state-university",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/lomonosov-moscow-state-university-_592560cf2aeae70239af4c27_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-copenhagen_141_small.jpg",
    "name": "University of Copenhagen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-copenhagen",
    "country": "Copenhagen, Denmark",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-copenhagen_141_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/yonsei-university_688_small.jpg",
    "name": "Yonsei University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/yonsei-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/yonsei-university_688_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/pohang-university-of-science-and-technology-postech_592560cf2aeae70239af4c7b_small.jpg",
    "name": "Pohang University of Science And Technology (POSTECH)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pohang-university-science-technology-postech",
    "country": "Pohang , South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/pohang-university-of-science-and-technology-postech_592560cf2aeae70239af4c7b_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/durham-university_170_small.jpg",
    "name": "Durham University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/durham-university",
    "country": "Durham, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/durham-university_170_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tohoku-university_611_small.jpg",
    "name": "Tohoku University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tohoku-university",
    "country": "Sendai City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tohoku-university_611_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-illinois-at-urbana-champaign_2090_small.jpg",
    "name": "University of Illinois at Urbana-Champaign",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-illinois-urbana-champaign",
    "country": "Champaign, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-illinois-at-urbana-champaign_2090_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-auckland_592560cf2aeae70239af4aa8_small.jpg",
    "name": "The University of Auckland",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-auckland",
    "country": "Auckland, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-auckland_592560cf2aeae70239af4aa8_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-washington_592560cf2aeae70239af4d1e_small.jpg",
    "name": "University of Washington",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-washington",
    "country": "Seattle, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-washington_592560cf2aeae70239af4d1e_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-paris-saclay_592560cf2aeae70239af4c6e_small.jpg",
    "name": "Universit Paris-Saclay",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universit-paris-saclay",
    "country": "Gif-sur-Yvette,, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-paris-saclay_592560cf2aeae70239af4c6e_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/lund-university_371_small.jpg",
    "name": "Lund University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/lund-university",
    "country": "Lund, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/lund-university_371_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/georgia-institute-of-technology_225_small.jpg",
    "name": "Georgia Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/georgia-institute-technology",
    "country": "Atlanta, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/georgia-institute-of-technology_225_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kth-royal-institute-of-technology-_592560cf2aeae70239af4c9b_small.jpg",
    "name": "KTH Royal Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kth-royal-institute-technology",
    "country": "Stockholm, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kth-royal-institute-of-technology-_592560cf2aeae70239af4c9b_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-birmingham_59_small.jpg",
    "name": "University of Birmingham",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-birmingham",
    "country": "Birmingham, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-birmingham_59_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-st-andrews_570_small.jpg",
    "name": "University of St Andrews",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-st-andrews",
    "country": "St. Andrews, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-st-andrews_570_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/University-of-Leeds-2-1-48x48.jpg",
    "name": "University of Leeds",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-leeds",
    "country": "Leeds, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/University-of-Leeds-2-1-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-western-australia_673_small.jpg",
    "name": "The University of Western Australia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-western-australia",
    "country": "Perth, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-western-australia_673_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rice-university_524_small.jpg",
    "name": "Rice University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rice-university",
    "country": "Houston, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rice-university_524_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-sheffield_592560cf2aeae70239af4cb1_small.jpg",
    "name": "The University of Sheffield",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-sheffield",
    "country": "Sheffield, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-sheffield_592560cf2aeae70239af4cb1_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/pennsylvania-state-university_494_small.jpg",
    "name": "Pennsylvania State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pennsylvania-state-university",
    "country": "University Park, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/pennsylvania-state-university_494_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sungkyunkwan-universityskku_592560cf2aeae70239af4cc9_small.jpg",
    "name": "Sungkyunkwan University (SKKU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sungkyunkwan-universityskku",
    "country": "Suwon, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sungkyunkwan-universityskku_592560cf2aeae70239af4cc9_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-science-and-technology-of-china_122_small.jpg",
    "name": "University of Science and Technology of China",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-science-technology-china",
    "country": "Hefei, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-science-and-technology-of-china_122_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/technical-university-of-denmark_592560cf2aeae70239af4cd8_small.jpg",
    "name": "Technical University of Denmark",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/technical-university-denmark",
    "country": "Kongens Lyngby, Denmark",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/technical-university-of-denmark_592560cf2aeae70239af4cd8_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-north-carolina-chapel-hill_424_small.jpg",
    "name": "University of North Carolina at Chapel Hill",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-north-carolina-chapel-hill",
    "country": "Chapel Hill, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-north-carolina-chapel-hill_424_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/trinity-college-dublin-the-university-of-dublin_167_small.jpg",
    "name": "Trinity College Dublin, The University of Dublin",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/trinity-college-dublin-university-dublin",
    "country": "Dublin, Ireland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/trinity-college-dublin-the-university-of-dublin_167_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-oslo_473_small.jpg",
    "name": "University of Oslo",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-oslo",
    "country": "Oslo, Norway",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-oslo_473_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-nottingham_592560cf2aeae70239af4c4e_small.jpg",
    "name": "University of Nottingham",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-nottingham",
    "country": "Nottingham, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-nottingham_592560cf2aeae70239af4c4e_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-helsinki_260_small.jpg",
    "name": "University of Helsinki",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-helsinki",
    "country": "Helsinki, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-helsinki_260_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-nacional-autnoma-de-mxico-unam_425_small.jpg",
    "name": "Universidad Nacional Autónoma de México (UNAM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-nacional-autonoma-de-mexico-unam",
    "country": "Mexico City, Mexico",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-nacional-autnoma-de-mxico-unam_425_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-geneva_221_small.jpg",
    "name": "University of Geneva",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-geneva",
    "country": "Geneva, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-geneva_221_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/washington-university-in-st.-louis_668_small.jpg",
    "name": "Washington University in St. Louis",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/washington-university-st-louis",
    "country": "St. Louis, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/washington-university-in-st.-louis_668_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-adelaide_10_small.jpg",
    "name": "The University of Adelaide",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-adelaide",
    "country": "Adelaide, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-adelaide_10_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-davis_592560cf2aeae70239af4ad8_small.jpg",
    "name": "University of California, Davis",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-davis",
    "country": "Davis, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-davis_592560cf2aeae70239af4ad8_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/king-abdulaziz-university-kau_1172_small.jpg",
    "name": "King Abdulaziz University (KAU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/king-abdulaziz-university-kau",
    "country": "Jeddah, Saudi Arabia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/king-abdulaziz-university-kau_1172_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/utrecht-university_646_small.jpg",
    "name": "Utrecht University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/utrecht-university",
    "country": "Utrecht, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/utrecht-university_646_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-de-montral_417_small.jpg",
    "name": "Université de Montréal",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-de-montreal",
    "country": "Montreal, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-de-montral_417_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/aalto-university_261_small.jpg",
    "name": "Aalto University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/aalto-university",
    "country": "Espoo, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/aalto-university_261_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/boston-university_592560cf2aeae70239af4ac2_small.jpg",
    "name": "Boston University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/boston-university",
    "country": "Boston, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/boston-university_592560cf2aeae70239af4ac2_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/leiden-university_340_small.jpg",
    "name": "Leiden University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/leiden-university",
    "country": "Leiden, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/leiden-university_340_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-southern-california_569_small.jpg",
    "name": "University of Southern California",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-southern-california",
    "country": "Los Angeles, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-southern-california_569_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/purdue-university_510_small.jpg",
    "name": "Purdue University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/purdue-university",
    "country": "West Lafayette, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/purdue-university_510_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/queen-mary-university-of-london_592560cf2aeae70239af4bea_small.jpg",
    "name": "Queen Mary University of London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/queen-mary-university-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/queen-mary-university-of-london_592560cf2aeae70239af4bea_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/nagoya-university_427_small.jpg",
    "name": "Nagoya University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/nagoya-university",
    "country": "Nagoya, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/nagoya-university_427_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-bern_55_small.jpg",
    "name": "University of Bern",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-bern",
    "country": "Bern, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-bern_55_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-ohio-state-university_465_small.jpg",
    "name": "The Ohio State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ohio-state-university",
    "country": "Columbus, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-ohio-state-university_465_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/chalmers-university-of-technology_592560cf2aeae70239af4af7_small.jpg",
    "name": "Chalmers University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/chalmers-university-technology",
    "country": "Gothenburg, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/chalmers-university-of-technology_592560cf2aeae70239af4af7_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidade-de-so-paulo_550_small.jpg",
    "name": "Universidade de São Paulo",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidade-de-sao-paulo",
    "country": "São Paulo, Brazil",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidade-de-so-paulo_550_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/wageningen-university_659_small.jpg",
    "name": "Wageningen University & Research",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/wageningen-university-research",
    "country": "Wageningen, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/wageningen-university_659_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/uppsala-university_643_small.jpg",
    "name": "Uppsala University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/uppsala-university",
    "country": "Uppsala, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/uppsala-university_643_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/eindhoven-university-of-technology_592560cf2aeae70239af4b3c_small.jpg",
    "name": "Eindhoven University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/eindhoven-university-technology",
    "country": "Eindhoven, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/eindhoven-university-of-technology_592560cf2aeae70239af4b3c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-alberta_15_small.jpg",
    "name": "University of Alberta",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-alberta",
    "country": "Edmonton, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-alberta_15_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/freie-universitaet-berlin_215_small.jpg",
    "name": "Freie Universitaet Berlin",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/freie-universitaet-berlin",
    "country": "Berlin, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/freie-universitaet-berlin_215_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/humboldt-universitt-zu-berlin_272_small.jpg",
    "name": "Humboldt-Universität zu Berlin",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/humboldt-universitat-zu-berlin",
    "country": "Berlin, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/humboldt-universitt-zu-berlin_272_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-groningen_243_small.jpg",
    "name": "University of Groningen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-groningen",
    "country": "Groningen, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-groningen_243_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/cole-normale-suprieure-de-lyon_175_small.jpg",
    "name": "École Normale Supérieure de Lyon",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ecole-normale-superieure-de-lyon",
    "country": "Lyon, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/cole-normale-suprieure-de-lyon_175_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/nanjing-university_430_small.jpg",
    "name": "Nanjing University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/nanjing-university",
    "country": "Nanjing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/nanjing-university_430_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/lancaster-university_335_small.jpg",
    "name": "Lancaster University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/lancaster-university",
    "country": "Lancaster,, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/lancaster-university_335_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-technology-sydney_592560cf2aeae70239af4ccf_small.jpg",
    "name": "University of Technology Sydney",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-technology-sydney",
    "country": "Haymarket, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-technology-sydney_592560cf2aeae70239af4ccf_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/newcastle-university_592560cf2aeae70239af4c45_small.jpg",
    "name": "Newcastle University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/newcastle-university",
    "country": "Newcastle upon Tyne, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/newcastle-university_592560cf2aeae70239af4c45_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/pontificia-universidad-catlica-de-chile-uc_107_small.jpg",
    "name": "Pontificia Universidad Católica de Chile (UC)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pontificia-universidad-cat%C3%B3lica-de-chile-uc",
    "country": "Santiago, Chile",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/pontificia-universidad-catlica-de-chile-uc_107_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kit-karlsruhe-institute-of-technology_310_small.jpg",
    "name": "KIT, Karlsruhe Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kit-karlsruhe-institute-technology",
    "country": "Karlsruhe, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kit-karlsruhe-institute-of-technology_310_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kyushu-university_331_small.jpg",
    "name": "Kyushu University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kyushu-university",
    "country": "Fukuoka City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kyushu-university_331_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-basel_46_small.jpg",
    "name": "University of Basel",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-basel",
    "country": "Basel, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-basel_46_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/mcmaster-university_397_small.jpg",
    "name": "McMaster University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/mcmaster-university",
    "country": "Hamilton, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/mcmaster-university_397_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ghent-university_228_small.jpg",
    "name": "Ghent University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ghent-university",
    "country": "Ghent, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ghent-university_228_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/politecnico-di-milano_592560cf2aeae70239af4c1c_small.jpg",
    "name": "Politecnico di Milano",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/politecnico-di-milano",
    "country": "Milan, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/politecnico-di-milano_592560cf2aeae70239af4c1c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-putra-malaysia-upm_385_small.jpg",
    "name": "Universiti Putra Malaysia (UPM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-putra-malaysia-upm",
    "country": "Seri Kembangan, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-putra-malaysia-upm_385_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-kebangsaan-malaysia-ukm_384_small.jpg",
    "name": "Universiti Kebangsaan Malaysia (UKM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-kebangsaan-malaysia-ukm",
    "country": "Bangi, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-kebangsaan-malaysia-ukm_384_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/hokkaido-university_266_small.jpg",
    "name": "Hokkaido University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hokkaido-university",
    "country": "Sapporo, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/hokkaido-university_266_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-santa-barbara-ucsb_91_small.jpg",
    "name": "University of California, Santa Barbara (UCSB)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-santa-barbara-ucsb",
    "country": "Santa Barbara, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-santa-barbara-ucsb_91_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-sains-malaysia-usm_386_small.jpg",
    "name": "Universiti Sains Malaysia (USM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-sains-malaysia-usm",
    "country": "Gelugor, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-sains-malaysia-usm_386_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/stockholm-university_577_small.jpg",
    "name": "Stockholm University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/stockholm-university",
    "country": "Stockholm, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/stockholm-university_577_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-exeter_204_small.jpg",
    "name": "University of Exeter",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-exeter",
    "country": "Exeter, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-exeter_204_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-waterloo_670_small.jpg",
    "name": "University of Waterloo",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-waterloo",
    "country": "Waterloo, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-waterloo_670_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/cardiff-university_592560cf2aeae70239af4ae6_small.jpg",
    "name": "Cardiff University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/cardiff-university",
    "country": "Cardiff, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/cardiff-university_592560cf2aeae70239af4ae6_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-vienna_652_small.jpg",
    "name": "University of Vienna",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-vienna",
    "country": "Vienna, Austria",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-vienna_652_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-york_689_small.jpg",
    "name": "University of York",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-york",
    "country": "York, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-york_689_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-rochester_592560cf2aeae70239af4c96_small.jpg",
    "name": "University of Rochester",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-rochester",
    "country": "Rochester, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-rochester_592560cf2aeae70239af4c96_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/aarhus-university_592560cf2aeae70239af4a8a_small.jpg",
    "name": "Aarhus University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/aarhus-university",
    "country": "Aarhus, Denmark",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/aarhus-university_592560cf2aeae70239af4a8a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/hanyang-university_250_small.jpg",
    "name": "Hanyang University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hanyang-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/hanyang-university_250_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/michigan-state-university_402_small.jpg",
    "name": "Michigan State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/michigan-state-university",
    "country": "East Lansing, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/michigan-state-university_402_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-maryland-college-park_393_small.jpg",
    "name": "University of Maryland, College Park",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-maryland-college-park",
    "country": "College Park, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-maryland-college-park_393_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/technische-universitt-berlin-tu-berlin_595_small.jpg",
    "name": "Technische Universität Berlin (TU Berlin)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/technische-universitat-berlin-tu-berlin",
    "country": "Berlin, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/technische-universitt-berlin-tu-berlin_595_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/emory-university_185_small.jpg",
    "name": "Emory University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/emory-university",
    "country": "Atlanta, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/emory-university_185_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/case-western-reserve-university_102_small.jpg",
    "name": "Case Western Reserve University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/case-western-reserve-university",
    "country": "Cleveland, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/case-western-reserve-university_102_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/instituto-tecnolgico-y-de-estudios-superiores-de-monterrey_592560cf2aeae70239af4cd6_small.jpg",
    "name": "Tecnológico de Monterrey",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tecnologico-de-monterrey",
    "country": "Monterrey, Mexico",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/instituto-tecnolgico-y-de-estudios-superiores-de-monterrey_592560cf2aeae70239af4cd6_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/king-fahd-university-of-petroleum-minerals_779_small.jpg",
    "name": "King Fahd University of Petroleum & Minerals",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/king-fahd-university-petroleum-minerals",
    "country": "Dhahran, Saudi Arabia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/king-fahd-university-of-petroleum-minerals_779_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-pittsburgh_500_small.jpg",
    "name": "University of Pittsburgh",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-pittsburgh",
    "country": "Pittsburgh, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-pittsburgh_500_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rwth-aachen-university_4_small.jpg",
    "name": "RWTH Aachen University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rwth-aachen-university",
    "country": "Aachen, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rwth-aachen-university_4_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/alma-mater-studiorum-university-of-bologna_592560cf2aeae70239af4ac0_small.jpg",
    "name": "Alma Mater Studiorum - University of Bologna",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/alma-mater-studiorum-university-bologna",
    "country": "Bologna, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/alma-mater-studiorum-university-of-bologna_592560cf2aeae70239af4ac0_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-bath_47_small.jpg",
    "name": "University of Bath",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-bath",
    "country": "Bath, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-bath_47_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/texas-am-university_592560cf2aeae70239af4ce2_small.jpg",
    "name": "Texas A&M University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/texas-am-university",
    "country": "College Station, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/texas-am-university_592560cf2aeae70239af4ce2_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-barcelona_592560cf2aeae70239af4aaf_small.jpg",
    "name": "Universitat de Barcelona",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-de-barcelona",
    "country": "Barcelona, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-barcelona_592560cf2aeae70239af4aaf_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-western-ontario_674_small.jpg",
    "name": "Western University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/western-university",
    "country": "London, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-western-ontario_674_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sapienza-university-of-rome_592560cf2aeae70239af4c97_small.jpg",
    "name": "Sapienza University of Rome",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sapienza-university-rome",
    "country": "Rome, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sapienza-university-of-rome_592560cf2aeae70239af4c97_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/albert-ludwigs-universitaet-freiburg_216_small.jpg",
    "name": "Albert-Ludwigs-Universitaet Freiburg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/albert-ludwigs-universitaet-freiburg",
    "country": "Freiburg im Breisgau, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/albert-ludwigs-universitaet-freiburg_216_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-college-dublin_166_small.jpg",
    "name": "University College Dublin",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-college-dublin",
    "country": "Dublin, Ireland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-college-dublin_166_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-florida_212_small.jpg",
    "name": "University of Florida",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-florida",
    "country": "Gainesville, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-florida_212_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/al-farabi-kazakh-national-university_2146_small.jpg",
    "name": "Al-Farabi Kazakh National University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/al-farabi-kazakh-national-university",
    "country": "Almaty, Kazakhstan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/al-farabi-kazakh-national-university_2146_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-lausanne_592560cf2aeae70239af4bd3_small.jpg",
    "name": "University of Lausanne",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-lausanne",
    "country": "Lausanne, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-lausanne_592560cf2aeae70239af4bd3_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/eberhard-karls-universitt-tbingen_629_small.jpg",
    "name": "Eberhard Karls Universität Tübingen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/eberhard-karls-universitat-tubingen",
    "country": "Tübingen, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/eberhard-karls-universitt-tbingen_629_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-bombay-iitb_281_small.jpg",
    "name": "Indian Institute of Technology Bombay (IITB)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-bombay-iitb",
    "country": "Mumbai, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-bombay-iitb_281_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/erasmus-university-rotterdam_190_small.jpg",
    "name": "Erasmus University Rotterdam",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/erasmus-university-rotterdam",
    "country": "Rotterdam, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/erasmus-university-rotterdam_190_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-tsing-hua-university_442_small.jpg",
    "name": "National Tsing Hua University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-tsing-hua-university",
    "country": "Hsinchu City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-tsing-hua-university_442_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/vienna-university-of-technology_653_small.jpg",
    "name": "Technische Universität Wien",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/vienna-university-technology",
    "country": "Vienna, Austria",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/vienna-university-of-technology_653_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-gothenburg_233_small.jpg",
    "name": "University of Gothenburg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-gothenburg",
    "country": "Gothenburg, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-gothenburg_233_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/khalifa-university-of-science-and-technology_592560e19988f300e2320ee2_small.jpg",
    "name": "Khalifa University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/khalifa-university",
    "country": "Abu Dhabi, United Arab Emirates",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/khalifa-university-of-science-and-technology_592560e19988f300e2320ee2_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-chile_121_small.jpg",
    "name": "Universidad de Chile",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-chile",
    "country": "Santiago, Chile",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-chile_121_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-delhi-iitd_282_small.jpg",
    "name": "Indian Institute of Technology Delhi (IITD)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-delhi-iitd",
    "country": "New Delhi, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-delhi-iitd_282_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-science-iisc-bangalore_22878_small.jpg",
    "name": "Indian Institute of Science",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-science",
    "country": "Bangalore, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-science-iisc-bangalore_22878_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-minnesota_408_small.jpg",
    "name": "University of Minnesota Twin Cities",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-minnesota-twin-cities",
    "country": "Minneapolis, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-minnesota_408_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-catholique-de-louvain-uclouvain_592560cf2aeae70239af4aed_small.jpg",
    "name": "Université catholique de Louvain (UCLouvain)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-catholique-de-louvain-uclouvain",
    "country": "Louvain-la-Neuve, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-catholique-de-louvain-uclouvain_592560cf2aeae70239af4aed_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-liverpool_350_small.jpg",
    "name": "University of Liverpool",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-liverpool",
    "country": "Liverpool, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-liverpool_350_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-twente_635_small.jpg",
    "name": "University of Twente",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-twente",
    "country": "Enschede, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-twente_635_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/dartmouth-college_592560cf2aeae70239af4b1c_small.jpg",
    "name": "Dartmouth College",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/dartmouth-college",
    "country": "Hanover, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/dartmouth-college_592560cf2aeae70239af4b1c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-teknologi-malaysia_387_small.jpg",
    "name": "Universiti Teknologi Malaysia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-teknologi-malaysia",
    "country": "Skudai, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-teknologi-malaysia_387_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-wollongong_680_small.jpg",
    "name": "University of Wollongong",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-wollongong",
    "country": "Wollongong, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-wollongong_680_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/curtin-university_150_small.jpg",
    "name": "Curtin University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/curtin-university",
    "country": "Perth, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/curtin-university_150_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/technische-universitt-dresden_598_small.jpg",
    "name": "Technische Universität Dresden",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/technische-universitat-dresden",
    "country": "Dresden, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/technische-universitt-dresden_598_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220609020250am605958OtagoLogoQS-48x48.jpg",
    "name": "University of Otago",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-otago",
    "country": "Dunedin, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220609020250am605958OtagoLogoQS-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-newcastle-australia-uon_449_small.jpg",
    "name": "The University of Newcastle, Australia (UON)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-newcastle-australia-uon",
    "country": "Callaghan, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-newcastle-australia-uon_449_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-hebrew-university-of-jerusalem_256_small.jpg",
    "name": "The Hebrew University of Jerusalem",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hebrew-university-jerusalem",
    "country": "Jerusalem, Israel",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-hebrew-university-of-jerusalem_256_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-bergen_53_small.jpg",
    "name": "University of Bergen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-bergen",
    "country": "Bergen, Norway",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-bergen_53_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/macquarie-university_378_small.jpg",
    "name": "Macquarie University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/macquarie-university",
    "country": "Sydney, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/macquarie-university_378_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/keio-university_592560cf2aeae70239af4bbe_small.jpg",
    "name": "Keio University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/keio-university",
    "country": "Tokyo, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/keio-university_592560cf2aeae70239af4bbe_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-reading_517_small.jpg",
    "name": "University of Reading",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-reading",
    "country": "Reading, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-reading_517_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/waseda-university_592560cf2aeae70239af4d1c_small.jpg",
    "name": "Waseda University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/waseda-university",
    "country": "Tokyo, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/waseda-university_592560cf2aeae70239af4d1c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-gttingen_234_small.jpg",
    "name": "University of Göttingen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-gottingen",
    "country": "Göttingen, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-gttingen_234_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-aberdeen_592560cf2aeae70239af4a8b_small.jpg",
    "name": "University of Aberdeen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-aberdeen",
    "country": "Aberdeen, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-aberdeen_592560cf2aeae70239af4a8b_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rmit-university_592560cf2aeae70239af4c95_small.jpg",
    "name": "RMIT University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rmit-university",
    "country": "Melbourne, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rmit-university_592560cf2aeae70239af4c95_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-autnoma-de-madrid_379_small.jpg",
    "name": "Universidad Autónoma de Madrid",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-autonoma-de-madrid",
    "country": "Madrid, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-autnoma-de-madrid_379_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universite-libre-de-bruxelles_75_small.jpg",
    "name": "Universite libre de Bruxelles",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-libre-de-bruxelles",
    "country": "Brussels, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universite-libre-de-bruxelles_75_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitat-autnoma-de-barcelona_592560cf2aeae70239af4ab0_small.jpg",
    "name": "Universitat Autònoma de Barcelona",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-autonoma-de-barcelona",
    "country": "Barcelona, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitat-autnoma-de-barcelona_592560cf2aeae70239af4ab0_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/vrije-universiteit-amsterdam_658_small.jpg",
    "name": "Vrije Universiteit Amsterdam",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/vrije-universiteit-amsterdam",
    "country": "Amsterdam, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/vrije-universiteit-amsterdam_658_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tongji-university_617_small.jpg",
    "name": "Tongji University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tongji-university",
    "country": "Shanghai, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tongji-university_617_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ulsan-national-institute-of-science-and-technology-unist_5ba37add9ed419611e043517_small.jpg",
    "name": "Ulsan National Institute of Science and Technology (UNIST)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ulsan-national-institute-science-technology-unist",
    "country": "South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ulsan-national-institute-of-science-and-technology-unist_5ba37add9ed419611e043517_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/queensland-university-of-technology-qut_592560cf2aeae70239af4c88_small.jpg",
    "name": "Queensland University of Technology (QUT)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/queensland-university-technology-qut",
    "country": "Brisbane, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/queensland-university-of-technology-qut_592560cf2aeae70239af4c88_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-hamburg_592560cf2aeae70239af4b79_small.jpg",
    "name": "Universität Hamburg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-hamburg",
    "country": "Hamburg, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-hamburg_592560cf2aeae70239af4b79_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/chulalongkorn-university_592560cf2aeae70239af4b01_small.jpg",
    "name": "Chulalongkorn University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/chulalongkorn-university",
    "country": "Bangkok, Thailand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/chulalongkorn-university_592560cf2aeae70239af4b01_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/arizona-state-university_592560cf2aeae70239af4a9c_small.jpg",
    "name": "Arizona State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/arizona-state-university",
    "country": "Phoenix, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/arizona-state-university_592560cf2aeae70239af4a9c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/queens-university-belfast_592560cf2aeae70239af4c86_small.jpg",
    "name": "Queen's University Belfast",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/queens-university-belfast",
    "country": "Belfast, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/queens-university-belfast_592560cf2aeae70239af4c86_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/vanderbilt-university_649_small.jpg",
    "name": "Vanderbilt University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/vanderbilt-university",
    "country": "Nashville, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/vanderbilt-university_649_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidade-estadual-de-campinas-unicamp_96_small.jpg",
    "name": "Universidade Estadual de Campinas (Unicamp)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidade-estadual-de-campinas-unicamp",
    "country": "Campinas, Brazil",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidade-estadual-de-campinas-unicamp_96_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/radboud-university_452_small.jpg",
    "name": "Radboud University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/radboud-university",
    "country": "Nijmegen, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/radboud-university_452_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/vrije-universiteit-brussel-vub_74_small.jpg",
    "name": "Vrije Universiteit Brussel (VUB)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/vrije-universiteit-brussel-vub",
    "country": "Brussels, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/vrije-universiteit-brussel-vub_74_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-notre-dame_458_small.jpg",
    "name": "University of Notre Dame",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-notre-dame",
    "country": "Notre Dame, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-notre-dame_458_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/complutense-university-of-madrid_592560cf2aeae70239af4bff_small.jpg",
    "name": "Complutense University of Madrid",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/complutense-university-madrid",
    "country": "Madrid, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/complutense-university-of-madrid_592560cf2aeae70239af4bff_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/qatar-university_2537_small.jpg",
    "name": "Qatar University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/qatar-university",
    "country": "Doha, Qatar",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/qatar-university_2537_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/wuhan-university_889_small.jpg",
    "name": "Wuhan University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/wuhan-university",
    "country": "Wuhan, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/wuhan-university_889_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rheinische-friedrich-wilhelms-universitt-bonn_592560cf2aeae70239af4ac1_small.jpg",
    "name": "Rheinische Friedrich-Wilhelms-Universität Bonn",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rheinische-friedrich-wilhelms-universitat-bonn",
    "country": "Bonn, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rheinische-friedrich-wilhelms-universitt-bonn_592560cf2aeae70239af4ac1_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/210830024732pm396697UCTcircular-logo1-CMYK-48x48.jpg",
    "name": "University of Cape Town",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-cape-town",
    "country": "Cape Town, South Africa",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/210830024732pm396697UCTcircular-logo1-CMYK-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-sussex_592560cf2aeae70239af4ccd_small.jpg",
    "name": "University of Sussex",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-sussex",
    "country": "Brighton, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-sussex_592560cf2aeae70239af4ccd_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-virginia_656_small.jpg",
    "name": "University of Virginia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-virginia",
    "country": "Charlottesville, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-virginia_656_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-ottawa_475_small.jpg",
    "name": "University of Ottawa",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-ottawa",
    "country": "Ottawa, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-ottawa_475_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/loughborough-university_592560cf2aeae70239af4bf3_small.jpg",
    "name": "Loughborough University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/loughborough-university",
    "country": "Loughborough, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/loughborough-university_592560cf2aeae70239af4bf3_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-irvine_86_small.jpg",
    "name": "University of California, Irvine",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-irvine",
    "country": "Irvine, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-irvine_86_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/maastricht-university_377_small.jpg",
    "name": "Maastricht University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/maastricht-university",
    "country": "Maastricht, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/maastricht-university_377_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220301072725am708442Logo-UAntwerpen-48x48.jpg",
    "name": "University of Antwerp",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-antwerp",
    "country": "Antwerp, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220301072725am708442Logo-UAntwerpen-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-calgary_592560cf2aeae70239af4ad5_small.jpg",
    "name": "University of Calgary",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-calgary",
    "country": "Calgary, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-calgary_592560cf2aeae70239af4ad5_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/harbin-institute-of-technology_877_small.jpg",
    "name": "Harbin Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/harbin-institute-technology",
    "country": "Harbin, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/harbin-institute-of-technology_877_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-los-andes_592560cf2aeae70239af4bf6_small.jpg",
    "name": "Universidad de los Andes",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-los-andes",
    "country": "Bogotá, Colombia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-los-andes_592560cf2aeae70239af4bf6_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-leicester_339_small.jpg",
    "name": "University of Leicester",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-leicester",
    "country": "Leicester, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-leicester_339_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/victoria-university-of-wellington_592560cf2aeae70239af4d0f_small.jpg",
    "name": "Victoria University of Wellington",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/victoria-university-wellington",
    "country": "Kelburn, Wellington, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/victoria-university-of-wellington_592560cf2aeae70239af4d0f_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/queens-university-at-kingston_513_small.jpg",
    "name": "Queen's University at Kingston",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/queens-university-kingston",
    "country": "Kingston, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/queens-university-at-kingston_513_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/usi-universit-della-svizzera-italiana_592560cf2aeae70239af50ca_small.jpg",
    "name": "USI - Università della Svizzera italiana",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/usi-universita-della-svizzera-italiana",
    "country": "Lugano, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/usi-universit-della-svizzera-italiana_592560cf2aeae70239af50ca_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/american-university-of-beirut-aub_780_small.jpg",
    "name": "American University of Beirut (AUB)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/american-university-beirut-aub",
    "country": "Beirut , Lebanon",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/american-university-of-beirut-aub_780_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/saint-petersburg-state-university_592560cf2aeae70239af4cc0_small.jpg",
    "name": "Saint Petersburg State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/saint-petersburg-state-university",
    "country": "Saint Petersburg, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/saint-petersburg-state-university_592560cf2aeae70239af4cc0_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitdi-padova_480_small.jpg",
    "name": "Università di Padova",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universita-di-padova",
    "country": "Padova, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitdi-padova_480_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ecole-des-ponts-paristech_187_small.jpg",
    "name": "Ecole des Ponts ParisTech",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ecole-des-ponts-paristech",
    "country": "Paris, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ecole-des-ponts-paristech_187_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/novosibirsk-state-university_462_small.jpg",
    "name": "Novosibirsk State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/novosibirsk-state-university",
    "country": "Novosibirsk , Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/novosibirsk-state-university_462_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-massachusetts-amherst_592560cf2aeae70239af4c0e_small.jpg",
    "name": "University of Massachusetts Amherst",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-massachusetts-amherst",
    "country": "Amherst, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-massachusetts-amherst_592560cf2aeae70239af4c0e_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220714055746am997087Georgetown-48x48.jpg",
    "name": "Georgetown University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/georgetown-university",
    "country": "Washington D.C., United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220714055746am997087Georgetown-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitat-pompeu-fabra_504_small.jpg",
    "name": "Universitat Pompeu Fabra (Barcelona)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-pompeu-fabra",
    "country": "Barcelona, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitat-pompeu-fabra_504_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-brunei-darussalam-ubd_22212_small.jpg",
    "name": "Universiti Brunei Darussalam (UBD)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-brunei-darussalam-ubd",
    "country": "Bandar Seri Begawan, Brunei",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-brunei-darussalam-ubd_22212_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-colorado-boulder_137_small.jpg",
    "name": "University of Colorado Boulder",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-colorado-boulder",
    "country": "Boulder, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-colorado-boulder_137_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220824065535am750975NCKU-GraphicSignature-04-RGB-AW-re-48x48.jpg",
    "name": "National Cheng Kung University (NCKU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-cheng-kung-university-ncku",
    "country": "Tainan City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220824065535am750975NCKU-GraphicSignature-04-RGB-AW-re-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-katz-school-at-yeshiva-university_685_small.jpg",
    "name": "Yeshiva University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/yeshiva-university",
    "country": "New York City, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-katz-school-at-yeshiva-university_685_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/gadjah-mada-university_219_small.jpg",
    "name": "Gadjah Mada University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/gadjah-mada-university",
    "country": "Yogyakarta, Indonesia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/gadjah-mada-university_219_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-madras-iitm_286_small.jpg",
    "name": "Indian Institute of Technology Madras (IITM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-madras-iitm",
    "country": "Chennai, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-madras-iitm_286_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/mahidol-university_381_small.jpg",
    "name": "Mahidol University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/mahidol-university",
    "country": "Nakhon Pathom, Thailand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/mahidol-university_381_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tel-aviv-university_592560cf2aeae70239af4cde_small.jpg",
    "name": "Tel Aviv University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tel-aviv-university",
    "country": "Tel Aviv, Israel",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tel-aviv-university_592560cf2aeae70239af4cde_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-university-of-ireland-galway_220_small.jpg",
    "name": "National University of Ireland Galway",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-university-ireland-galway",
    "country": "Galway, Ireland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-university-of-ireland-galway_220_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-nacional-de-colombia_592560cf2aeae70239af4b0b_small.jpg",
    "name": "Universidad Nacional de Colombia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-nacional-de-colombia",
    "country": "Bogotá, Colombia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-nacional-de-colombia_592560cf2aeae70239af4b0b_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-canterbury_97_small.jpg",
    "name": "University of Canterbury | Te Whare Wānanga o Waitaha",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-canterbury-te-whare-wananga-o-waitaha",
    "country": "Christchurch, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-canterbury_97_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sun-yat-sen-university_888_small.jpg",
    "name": "Sun Yat-sen University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sun-yat-sen-university",
    "country": "Guangzhou, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sun-yat-sen-university_888_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sciences-po-_592560cf2aeae70239af4c64_small.jpg",
    "name": "Sciences Po",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sciences-po",
    "country": "Paris, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sciences-po-_592560cf2aeae70239af4c64_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220413032656pm709434UniversiteParisCite-Logo-48x48.jpg",
    "name": "Université Paris Cité",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-paris-cite",
    "country": "Paris, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220413032656pm709434UniversiteParisCite-Logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kyung-hee-university_592560cf2aeae70239af4bcd_small.jpg",
    "name": "Kyung Hee University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kyung-hee-university",
    "country": "South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kyung-hee-university_592560cf2aeae70239af4bcd_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rutgers-university-new-brunswick_538_small.jpg",
    "name": "Rutgers University–New Brunswick",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rutgers-university-new-brunswick",
    "country": "New Brunswick, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rutgers-university-new-brunswick_538_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/charles-university_117_small.jpg",
    "name": "Charles University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/charles-university",
    "country": "Prague, Czechia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/charles-university_117_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-navarra_592560cf2aeae70239af4c40_small.jpg",
    "name": "University of Navarra",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-navarra",
    "country": "Pamplona, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-navarra_592560cf2aeae70239af4c40_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220325021431am762785logo-48x48.jpg",
    "name": "National Yang Ming Chiao Tung University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-yang-ming-chiao-tung-university",
    "country": "Hsinchu City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220325021431am762785logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-university-of-arizona_26_small.jpg",
    "name": "The University of Arizona",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-arizona",
    "country": "Tucson, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-university-of-arizona_26_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/technische-universitt-darmstadt_628_small.jpg",
    "name": "Technical University of Darmstadt",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/technical-university-darmstadt",
    "country": "Darmstadt, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/technische-universitt-darmstadt_628_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/beijing-normal-university_869_small.jpg",
    "name": "Beijing Normal University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/beijing-normal-university",
    "country": "Beijing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/beijing-normal-university_869_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/heriot-watt-university_592560cf2aeae70239af4d5f_small.jpg",
    "name": "Heriot-Watt University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/heriot-watt-university",
    "country": "Edinburgh, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/heriot-watt-university_592560cf2aeae70239af4d5f_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220907060135am918788DAL-logo-48x48.jpg",
    "name": "Dalhousie University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/dalhousie-university",
    "country": "Halifax, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220907060135am918788DAL-logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tomsk-state-university_616_small.jpg",
    "name": "Tomsk State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tomsk-state-university",
    "country": "Tomsk, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tomsk-state-university_616_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-surrey_584_small.jpg",
    "name": "University of Surrey",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-surrey",
    "country": "Guildford, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-surrey_584_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220530064029am250629Screenshot-at-May-30-14-39-50-48x48.jpg",
    "name": "Southern University of Science and Technology (SUSTech)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/southern-university-science-technology-sustech",
    "country": "Shenzhen, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220530064029am250629Screenshot-at-May-30-14-39-50-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tufts-university_630_small.jpg",
    "name": "Tufts University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tufts-university",
    "country": "Medford, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tufts-university_630_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/graz-university-of-technology_1239_small.jpg",
    "name": "Graz University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/graz-university-technology",
    "country": "Graz, Austria",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/graz-university-of-technology_1239_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-kanpur-iitk_592560cf2aeae70239af4ba5_small.jpg",
    "name": "Indian Institute of Technology Kanpur (IITK)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-kanpur-iitk",
    "country": "Kanpur, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-kanpur-iitk_592560cf2aeae70239af4ba5_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/king-saud-university_1175_small.jpg",
    "name": "King Saud University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/king-saud-university",
    "country": "Riyadh, Saudi Arabia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/king-saud-university_1175_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-kharagpur-iit-kgp_285_small.jpg",
    "name": "Indian Institute of Technology Kharagpur (IIT-KGP)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-kharagpur-iit-kgp",
    "country": "Kharagpur, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-kharagpur-iit-kgp_285_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/bauman-moscow-state-technical-university_592560cf2aeae70239af505c_small.jpg",
    "name": "Bauman Moscow State Technical University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/bauman-moscow-state-technical-university",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/bauman-moscow-state-technical-university_592560cf2aeae70239af505c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-innsbruck_592560cf2aeae70239af4ba7_small.jpg",
    "name": "Universität Innsbruck",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-innsbruck",
    "country": "Innsbruck, Austria",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-innsbruck_592560cf2aeae70239af4ba7_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/download-48x48.png",
    "name": "Deakin University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/deakin-university",
    "country": "Burwood, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/download-48x48.png"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/massey-university_395_small.jpg",
    "name": "Massey University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/massey-university",
    "country": "Palmerston North, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/massey-university_395_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-illinois-chicago-uic_592560cf2aeae70239af4b9a_small.jpg",
    "name": "University of Illinois at Chicago (UIC)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-illinois-chicago-uic",
    "country": "Chicago, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-illinois-chicago-uic_592560cf2aeae70239af4b9a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-tsukuba_592560cf2aeae70239af4cf7_small.jpg",
    "name": "University of Tsukuba",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-tsukuba",
    "country": "Tsukuba City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-tsukuba_592560cf2aeae70239af4cf7_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/hong-kong-baptist-university_893_small.jpg",
    "name": "Hong Kong Baptist University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hong-kong-baptist-university",
    "country": "Hong Kong, Hong Kong SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/hong-kong-baptist-university_893_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/united-arab-emirates-university_778_small.jpg",
    "name": "United Arab Emirates University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/united-arab-emirates-university",
    "country": "Al Ain, United Arab Emirates",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/united-arab-emirates-university_778_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/griffith-university_242_small.jpg",
    "name": "Griffith University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/griffith-university",
    "country": "Nathan, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/griffith-university_242_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/moscow-institute-of-physics-and-technology-mipt-moscow-phystech_15270_small.jpg",
    "name":
        "Moscow Institute of Physics and Technology (MIPT / Moscow Phystech)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/moscow-institute-physics-technology-mipt-moscow-phystech",
    "country": "Dolgoprudny, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/moscow-institute-of-physics-and-technology-mipt-moscow-phystech_15270_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitas-indonesia_290_small.jpg",
    "name": "Universitas Indonesia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitas-indonesia",
    "country": "Depok, Indonesia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitas-indonesia_290_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-paris-1-panthon-sorbonne_482_small.jpg",
    "name": "Université Paris 1 Panthéon-Sorbonne",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-paris-1-pantheon-sorbonne",
    "country": "Paris, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-paris-1-panthon-sorbonne_482_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/xian-jiaotong-university_683_small.jpg",
    "name": "Xi’an Jiaotong University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/xian-jiaotong-university",
    "country": "Xi'an, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/xian-jiaotong-university_683_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/belarusian-state-university_14128_small.jpg",
    "name": "Belarusian State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/belarusian-state-university",
    "country": "Minsk, Belarus",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/belarusian-state-university_14128_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220603114500am903324university-of-porto-logo-48x48.jpg",
    "name": "University of Porto",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-porto",
    "country": "Porto, Portugal",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220603114500am903324university-of-porto-logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-turku_592560cf2aeae70239af4cfe_small.jpg",
    "name": "University of Turku",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-turku",
    "country": "Turku, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-turku_592560cf2aeae70239af4cfe_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/simon-fraser-university_562_small.jpg",
    "name": "Simon Fraser University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/simon-fraser-university",
    "country": "Burnaby, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/simon-fraser-university_562_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-college-cork_142_small.jpg",
    "name": "University College Cork",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-college-cork",
    "country": "Cork, Ireland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-college-cork_142_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/north-carolina-state-university_592560cf2aeae70239af4c2a_small.jpg",
    "name": "North Carolina State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/north-carolina-state-university",
    "country": "Raleigh, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/north-carolina-state-university_592560cf2aeae70239af4c2a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-tartu_592560cf2aeae70239af4d08_small.jpg",
    "name": "University of Tartu",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-tartu",
    "country": "Tartu, Estonia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-tartu_592560cf2aeae70239af4d08_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-strathclyde_579_small.jpg",
    "name": "University of Strathclyde",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-strathclyde",
    "country": "Glasgow, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-strathclyde_579_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/bandung-institute-of-technology-itb_41_small.jpg",
    "name": "Bandung Institute of Technology (ITB)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/bandung-institute-technology-itb",
    "country": "Bandung, Indonesia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/bandung-institute-of-technology-itb_41_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-tasmania_592560cf2aeae70239af4cd5_small.jpg",
    "name": "University of Tasmania",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-tasmania",
    "country": "Hobart, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-tasmania_592560cf2aeae70239af4cd5_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/gwangju-institute-of-science-and-technology-gist_718_small.jpg",
    "name": "Gwangju Institute of Science and Technology (GIST)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/gwangju-institute-science-technology-gist",
    "country": "Gwangju, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/gwangju-institute-of-science-and-technology-gist_718_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220303011024pm152717HSE-logo-48x48.jpg",
    "name": "HSE University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hse-university",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220303011024pm152717HSE-logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-east-anglia-uea_637_small.jpg",
    "name": "University of East Anglia (UEA)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-east-anglia-uea",
    "country": "Norwich, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-east-anglia-uea_637_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-warsaw_663_small.jpg",
    "name": "University of Warsaw",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-warsaw",
    "country": "Warsaw, Poland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-warsaw_663_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/jagiellonian-university_300_small.jpg",
    "name": "Jagiellonian University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/jagiellonian-university",
    "country": "Krakow, Poland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/jagiellonian-university_300_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-southern-denmark_592560cf2aeae70239af4c53_small.jpg",
    "name": "University of Southern Denmark (SDU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-southern-denmark-sdu",
    "country": "Odense, Denmark",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-southern-denmark_592560cf2aeae70239af4c53_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indiana-university-bloomington_289_small.jpg",
    "name": "Indiana University Bloomington",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indiana-university-bloomington",
    "country": "Bloomington, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indiana-university-bloomington_289_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-cologne_592560cf2aeae70239af4bc6_small.jpg",
    "name": "University of Cologne",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-cologne",
    "country": "Cologne, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-cologne_592560cf2aeae70239af4bc6_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-miami_401_small.jpg",
    "name": "University of Miami",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-miami",
    "country": "Miami, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-miami_401_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-taiwan-university-of-science-and-technology-taiwan-tech_590_small.jpg",
    "name":
        "National Taiwan University of Science and Technology (Taiwan Tech)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-taiwan-university-science-technology-taiwan-tech",
    "country": "Taipei City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-taiwan-university-of-science-and-technology-taiwan-tech_590_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-grenoble-alpes_592560cf2aeae70239af5ab2_small.jpg",
    "name": "Université Grenoble Alpes",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-grenoble-alpes",
    "country": "Grenoble, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-grenoble-alpes_592560cf2aeae70239af5ab2_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-milan_1873_small.jpg",
    "name": "University of Milan",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-milan",
    "country": "Milan, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-milan_1873_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220204123836pm785675Logo-IE-University-200x200-75033ef3-ae79-4d34-a78f-45de8b8ef362-48x48.jpg",
    "name": "IE University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ie-university",
    "country": "Segovia, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220204123836pm785675Logo-IE-University-200x200-75033ef3-ae79-4d34-a78f-45de8b8ef362-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rudn-university_1503_small.jpg",
    "name": "RUDN University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rudn-university",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rudn-university_1503_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-research-nuclear-university-mephi-moscow-engineering-physics-institute_15207_small.png",
    "name":
        "National Research Nuclear University MEPhI (Moscow Engineering Physics Institute)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-research-nuclear-university-mephi-moscow-engineering-physics-institute",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-research-nuclear-university-mephi-moscow-engineering-physics-institute_15207_small.png"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitat-politcnica-de-catalunya_103_small.jpg",
    "name": "Universitat Politècnica de Catalunya · BarcelonaTech (UPC)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-politecnica-de-catalunya-barcelonatech-upc",
    "country": "Barcelona, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitat-politcnica-de-catalunya_103_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/swinburne-university-of-technology_759_small.jpg",
    "name": "Swinburne University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/swinburne-university-technology",
    "country": "Melbourne, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/swinburne-university-of-technology_759_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/-university-of-dundee_592560cf2aeae70239af4b2c_small.jpg",
    "name": "University of Dundee",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-dundee",
    "country": "Dundee, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/-university-of-dundee_592560cf2aeae70239af4b2c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/friedrich-alexander-universitt-erlangen-nrnberg_191_small.jpg",
    "name": "Friedrich-Alexander-Universität Erlangen-Nürnberg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/friedrich-alexander-universitat-erlangen-nurnberg",
    "country": "Erlangen, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/friedrich-alexander-universitt-erlangen-nrnberg_191_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/pontificia-universidad-catlica-argentina_592560cf2aeae70239af5486_small.jpg",
    "name": "Pontificia Universidad Católica Argentina",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pontificia-universidad-catolica-argentina",
    "country": "Buenos Aires, Argentina",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/pontificia-universidad-catlica-argentina_592560cf2aeae70239af5486_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-macau_14378_small.jpg",
    "name": "University of Macau",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-macau",
    "country": "Macau SAR",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-macau_14378_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/aalborg-university_1262_small.jpg",
    "name": "Aalborg University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/aalborg-university",
    "country": "Aalborg, Denmark",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/aalborg-university_1262_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-south-australia_566_small.jpg",
    "name": "University of South Australia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-south-australia",
    "country": "Adelaide, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-south-australia_566_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/l.n.-gumilyov-eurasian-national-university-enu_592560cf2aeae70239af52e8_small.jpg",
    "name": "L.N. Gumilyov Eurasian National University (ENU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ln-gumilyov-eurasian-national-university-enu",
    "country": "Nur-Sultan, Kazakhstan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/l.n.-gumilyov-eurasian-national-university-enu_592560cf2aeae70239af52e8_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/linkping-university_348_small.jpg",
    "name": "Linköping University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/linkoping-university",
    "country": "Linköping, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/linkping-university_348_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/city-university-of-london_354_small.jpg",
    "name": "City, University of London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/city-university-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/city-university-of-london_354_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/technion-israel-institute-of-technology_600_small.jpg",
    "name": "Technion - Israel Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/technion-israel-institute-technology",
    "country": "Haifa, Israel",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/technion-israel-institute-of-technology_600_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/birkbeck-university-of-london_1636_small.jpg",
    "name": "Birkbeck, University of London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/birkbeck-university-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/birkbeck-university-of-london_1636_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/taylors-university_592560cf2aeae70239af57af_small.jpg",
    "name": "Taylor's University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/taylors-university",
    "country": "Subang Jaya, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/taylors-university_592560cf2aeae70239af57af_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/huazhong-university-of-science-and-technology_592560cf2aeae70239af5256_small.jpg",
    "name": "Huazhong University of Science and Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/huazhong-university-science-technology",
    "country": "Wuhan, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/huazhong-university-of-science-and-technology_592560cf2aeae70239af5256_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-taiwan-normal-university_440_small.jpg",
    "name": "National Taiwan Normal University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-taiwan-normal-university",
    "country": "Taipei City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-taiwan-normal-university_440_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/211027114149am317273Poli-di-Torino-logo-200x2000-48x48.jpg",
    "name": "Politecnico di Torino",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/politecnico-di-torino",
    "country": "Turin, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/211027114149am317273Poli-di-Torino-logo-200x2000-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/royal-holloway-university-of-london_534_small.jpg",
    "name": "Royal Holloway University of London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/royal-holloway-university-london",
    "country": "Egham, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/royal-holloway-university-of-london_534_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tianjin-university_609_small.jpg",
    "name": "Tianjin University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tianjin-university",
    "country": "Tianjin, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tianjin-university_609_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-victoria-uvic_592560cf2aeae70239af4d0e_small.jpg",
    "name": "University of Victoria (UVic)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-victoria-uvic",
    "country": "Victoria, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-victoria-uvic_592560cf2aeae70239af4d0e_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-frankfurt-am-main_214_small.jpg",
    "name": "Goethe-University Frankfurt am Main",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/goethe-university-frankfurt-am-main",
    "country": "Frankfurt, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-frankfurt-am-main_214_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-hawaii-at-maoa_255_small.jpg",
    "name": "University of Hawaiʻi at Mānoa",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-hawaii-manoa",
    "country": "Honolulu, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-hawaii-at-maoa_255_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/northeastern-university_454_small.jpg",
    "name": "Northeastern University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/northeastern-university",
    "country": "Boston, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/northeastern-university_454_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/hiroshima-university_264_small.jpg",
    "name": "Hiroshima University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hiroshima-university",
    "country": "Higashihiroshima City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/hiroshima-university_264_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-teknologi-brunei_592560e49988f300e23219b2_small.jpg",
    "name": "Universiti Teknologi Brunei",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-teknologi-brunei",
    "country": "Bandar Seri Begawan, Brunei",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-teknologi-brunei_592560e49988f300e23219b2_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-jena_592560cf2aeae70239af4bb5_small.jpg",
    "name": "Universität Jena",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-jena",
    "country": "Jena, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-jena_592560cf2aeae70239af4bb5_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/virginia-polytechnic-institute-and-state-university_592560cf2aeae70239af4d15_small.jpg",
    "name": "Virginia Polytechnic Institute and State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/virginia-polytechnic-institute-state-university",
    "country": "Blacksburg, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/virginia-polytechnic-institute-and-state-university_592560cf2aeae70239af4d15_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kazan-volga-region-federal-university_313_small.jpg",
    "name": "Kazan (Volga region) Federal University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kazan-volga-region-federal-university",
    "country": "Kazan, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kazan-volga-region-federal-university_313_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ucsi-university_592560e09988f300e2320ce5_small.jpg",
    "name": "UCSI University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ucsi-university",
    "country": "Kuala Lumpur, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ucsi-university_592560e09988f300e2320ce5_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-santa-cruz_92_small.jpg",
    "name": "University of California, Santa Cruz",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-santa-cruz",
    "country": "Santa Cruz, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-santa-cruz_92_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-stuttgart_580_small.jpg",
    "name": "Universität Stuttgart",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-stuttgart",
    "country": "Stuttgart, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-stuttgart_580_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/brunel-university-london_592560cf2aeae70239af4acc_small.jpg",
    "name": "Brunel University London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/brunel-university-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/brunel-university-london_592560cf2aeae70239af4acc_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-carlos-iii-de-madrid-uc3m_1509_small.jpg",
    "name": "Universidad Carlos III de Madrid (UC3M)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-carlos-iii-de-madrid-uc3m",
    "country": "Madrid, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-carlos-iii-de-madrid-uc3m_1509_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ural-federal-university-urfu_592560cf2aeae70239af505a_small.jpg",
    "name": "Ural Federal University - UrFU",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ural-federal-university-urfu",
    "country": "Ekaterinburg, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ural-federal-university-urfu_592560cf2aeae70239af505a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/johannes-kepler-university-linz_349_small.jpg",
    "name": "Johannes Kepler University Linz",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/johannes-kepler-university-linz",
    "country": "Linz, Austria",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/johannes-kepler-university-linz_349_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/george-washington-university_223_small.jpg",
    "name": "George Washington University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/george-washington-university",
    "country": "Washington D.C., United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/george-washington-university_223_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tilburg-university_592560cf2aeae70239af4ce5_small.jpg",
    "name": "Tilburg University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tilburg-university",
    "country": "Tilburg, Netherlands",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tilburg-university_592560cf2aeae70239af4ce5_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-lisbon_1475_small.jpg",
    "name": "University of Lisbon",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-lisbon",
    "country": "Lisbon , Portugal",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-lisbon_1475_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/nankai-university_882_small.jpg",
    "name": "Nankai University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/nankai-university",
    "country": "Tianjin, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/nankai-university_882_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-university-of-sciences-and-technology-nust-islamabad_698_small.jpg",
    "name": "National University of Sciences And Technology (NUST) Islamabad",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-university-sciences-technology-nust-islamabad",
    "country": "Islamabad, Pakistan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-university-of-sciences-and-technology-nust-islamabad_698_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-jyvskyl_306_small.jpg",
    "name": "University of Jyväskylä",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-jyvaskyla",
    "country": "Jyväskylä, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-jyvskyl_306_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-utah_645_small.jpg",
    "name": "University of Utah",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-utah",
    "country": "Salt Lake City, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-utah_645_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ewha-womans-university_592560cf2aeae70239af4b38_small.jpg",
    "name": "Ewha Womans University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ewha-womans-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ewha-womans-university_592560cf2aeae70239af4b38_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220913045650am561995LTU-Int-V-RGB-JPG-48x48.jpg",
    "name": "La Trobe University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/la-trobe-university",
    "country": "Melbourne, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220913045650am561995LTU-Int-V-RGB-JPG-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/moscow-state-institute-of-international-relations-mgimo-university_2156_small.jpg",
    "name": "MGIMO University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/mgimo-university",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/moscow-state-institute-of-international-relations-mgimo-university_2156_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/itmo-university_592560cf2aeae70239af5829_small.jpg",
    "name": "ITMO University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/itmo-university",
    "country": "St. Petersburg, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/itmo-university_592560cf2aeae70239af5829_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/logo_Umu-48x48.jpg",
    "name": "Umea University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/umea-university",
    "country": "Umeå, Sweden",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/logo_Umu-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-ulm_638_small.jpg",
    "name": "Ulm University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ulm-university",
    "country": "Ulm, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-ulm_638_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sultan-qaboos-university_2530_small.jpg",
    "name": "Sultan Qaboos University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sultan-qaboos-university",
    "country": "Muscat, Oman",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sultan-qaboos-university_2530_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/norwegian-university-of-science-and-technology_457_small.jpg",
    "name": "Norwegian University of Science And Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/norwegian-university-science-technology",
    "country": "Trondheim, Norway",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/norwegian-university-of-science-and-technology_457_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidade-federal-do-rio-de-janeiro_525_small.jpg",
    "name": "Universidade Federal do Rio de Janeiro",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidade-federal-do-rio-de-janeiro",
    "country": "Rio de Janeiro, Brazil",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidade-federal-do-rio-de-janeiro_525_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitat-politcnica-de-valncia_648_small.jpg",
    "name": "Universitat Politecnica de Valencia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-politecnica-de-valencia",
    "country": "València, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitat-politcnica-de-valncia_648_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/lincoln-university-_592560cf2aeae70239af4ef3_small.jpg",
    "name": "Lincoln University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/lincoln-university",
    "country": "Lincoln, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/lincoln-university-_592560cf2aeae70239af4ef3_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/beijing-institute-of-technology_868_small.jpg",
    "name": "Beijing Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/beijing-institute-technology",
    "country": "Beijing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/beijing-institute-of-technology_868_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-chemistry-and-technology-prague_592560cf2aeae70239af4f53_small.jpg",
    "name": "University of Chemistry and Technology, Prague",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-chemistry-technology-prague",
    "country": "Prague, Czechia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-chemistry-and-technology-prague_592560cf2aeae70239af4f53_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-connecticut_140_small.jpg",
    "name": "University of Connecticut",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-connecticut",
    "country": "Storrs, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-connecticut_140_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-waikato_660_small.jpg",
    "name": "University of Waikato",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-waikato",
    "country": "Hamilton , New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-waikato_660_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-oulu_476_small.jpg",
    "name": "University of Oulu",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-oulu",
    "country": "Oulu, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-oulu_476_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/julius-maximilians-universitt-wrzburg_592560cf2aeae70239af4d2d_small.jpg",
    "name": "Julius-Maximilians-Universität Würzburg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/julius-maximilians-universitat-wurzburg",
    "country": "Würzburg, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/julius-maximilians-universitt-wrzburg_592560cf2aeae70239af4d2d_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/quaid-i-azam-university_592560cf2aeae70239af4d41_small.jpg",
    "name": "Quaid-i-Azam University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/quaid-i-azam-university",
    "country": "Islamabad, Pakistan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/quaid-i-azam-university_592560cf2aeae70239af4d41_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/stony-brook-university-state-university-of-new-york_592560cf2aeae70239af4ccb_small.jpg",
    "name": "Stony Brook University, State University of New York",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/stony-brook-university-state-university-new-york",
    "country": "Stony Brook, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/stony-brook-university-state-university-of-new-york_592560cf2aeae70239af4ccb_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sharif-university-of-technology_592560cf2aeae70239af4d42_small.jpg",
    "name": "Sharif University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sharif-university-technology",
    "country": "Tehran, Iran",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sharif-university-of-technology_592560cf2aeae70239af4d42_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tokyo-medical-and-dental-university-tmdu_592560cf2aeae70239af4e8a_small.jpg",
    "name": "Tokyo Medical and Dental University (TMDU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tokyo-medical-dental-university-tmdu",
    "country": "Tokyo, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tokyo-medical-and-dental-university-tmdu_592560cf2aeae70239af4e8a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/211216011743pm346028American-University-of-Sharjah-AUS-Stacked-200X200px-48x48.jpg",
    "name": "American University of Sharjah",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/american-university-sharjah",
    "country": "Sharjah, United Arab Emirates",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/211216011743pm346028American-University-of-Sharjah-AUS-Stacked-200X200px-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/beihang-university-former-buaa_870_small.jpg",
    "name": "Beihang University (former BUAA)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/beihang-university-former-buaa",
    "country": "Beijing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/beihang-university-former-buaa_870_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-kent_315_small.jpg",
    "name": "University of Kent",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-kent",
    "country": "Canterbury, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-kent_315_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/kobe-university_320_small.jpg",
    "name": "Kobe University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/kobe-university",
    "country": "Kobe City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/kobe-university_320_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-kansas_309_small.jpg",
    "name": "University of Kansas",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-kansas",
    "country": "Lawrence, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-kansas_309_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-at-buffalo-suny_1888_small.jpg",
    "name": "University at Buffalo SUNY",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-buffalo-suny",
    "country": "Buffalo, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-at-buffalo-suny_1888_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-pisa_499_small.jpg",
    "name": "University of Pisa",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-pisa",
    "country": "Pisa, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-pisa_499_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-vita-salute-san-raffaele_592560cf2aeae70239af5016_small.jpg",
    "name": "Università Vita-Salute San Raffaele",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universita-vita-salute-san-raffaele",
    "country": "Milan, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-vita-salute-san-raffaele_592560cf2aeae70239af5016_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/soas-university-of-london-_592560cf2aeae70239af4bf0_small.jpg",
    "name": "SOAS University of London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/soas-university-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/soas-university-of-london-_592560cf2aeae70239af4bf0_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-palermo-up_592560cf2aeae70239af54de_small.jpg",
    "name": "Universidad de Palermo (UP)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-palermo",
    "country": "Buenos Aires, Argentina",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-palermo-up_592560cf2aeae70239af54de_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/peter-the-great-st.-petersburg-polytechnic-university_592560cf2aeae70239af52ed_small.jpg",
    "name": "Peter the Great St. Petersburg Polytechnic University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/peter-great-st-petersburg-polytechnic-university",
    "country": "St. Petersburg, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/peter-the-great-st.-petersburg-polytechnic-university_592560cf2aeae70239af52ed_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ruhr-universitt-bochum_537_small.jpg",
    "name": "Ruhr-Universität Bochum",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ruhr-universitat-bochum",
    "country": "Bochum, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ruhr-universitt-bochum_537_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-guwahati-iitg_283_small.jpg",
    "name": "Indian Institute of Technology Guwahati (IITG)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-guwahati-iitg",
    "country": "Guwahati, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-guwahati-iitg_283_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-research-tomsk-polytechnic-university_14158_small.jpg",
    "name": "National Research Tomsk Polytechnic University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-research-tomsk-polytechnic-university",
    "country": "Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-research-tomsk-polytechnic-university_14158_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/210825042529am231772Isotipo-PUCP-200x200-48x48.jpg",
    "name": "Pontificia Universidad Catolica del Peru",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pontificia-universidad-catolica-del-peru",
    "country": "Lima, Peru",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/210825042529am231772Isotipo-PUCP-200x200-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/pakistan-institute-of-engineering-and-applied-sciences-pieas_592560cf2aeae70239af532f_small.jpg",
    "name": "Pakistan Institute of Engineering and Applied Sciences (PIEAS)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pakistan-institute-engineering-applied-sciences-pieas",
    "country": "Islamabad, Pakistan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/pakistan-institute-of-engineering-and-applied-sciences-pieas_592560cf2aeae70239af532f_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-the-philippines_498_small.jpg",
    "name": "University of the Philippines",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-philippines",
    "country": "Quezon City, Philippines",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-the-philippines_498_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/indian-institute-of-technology-roorkee-iitr_287_small.jpg",
    "name": "Indian Institute of Technology Roorkee (IITR)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/indian-institute-technology-roorkee-iitr",
    "country": "Roorkee, India",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/indian-institute-of-technology-roorkee-iitr_287_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-austral_38_small.jpg",
    "name": "Universidad Austral",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-austral",
    "country": "Pilar, Argentina",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-austral_38_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/vilnius-university-_592560cf2aeae70239af4d7f_small.jpg",
    "name": "Vilnius University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/vilnius-university",
    "country": "Vilnius, Lithuania",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/vilnius-university-_592560cf2aeae70239af4d7f_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/czech-technical-university-in-prague_592560cf2aeae70239af4d3b_small.jpg",
    "name": "Czech Technical University in Prague",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/czech-technical-university-prague",
    "country": "Prague, Czechia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/czech-technical-university-in-prague_592560cf2aeae70239af4d3b_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/shandong-university_555_small.jpg",
    "name": "Shandong University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/shandong-university",
    "country": "Jinan, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/shandong-university_555_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-california-riverside_88_small.jpg",
    "name": "University of California, Riverside",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-california-riverside",
    "country": "Riverside, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-california-riverside_88_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/flinders-university_592560cf2aeae70239af4b53_small.jpg",
    "name": "Flinders University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/flinders-university",
    "country": "Adelaide, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/flinders-university_592560cf2aeae70239af4b53_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/south-china-university-of-technology_887_small.jpg",
    "name": "South China University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/south-china-university-technology",
    "country": "Guangzhou, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/south-china-university-of-technology_887_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/taipei-medical-university_2134_small.jpg",
    "name": "Taipei Medical University (TMU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/taipei-medical-university-tmu",
    "country": "Taipei, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/taipei-medical-university_2134_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/xiamen-university_891_small.jpg",
    "name": "Xiamen University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/xiamen-university",
    "country": "Xiamen, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/xiamen-university_891_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/westflische-wilhelms-universitt-mnster_421_small.jpg",
    "name": "University of Münster",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-munster",
    "country": "Munster, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/westflische-wilhelms-universitt-mnster_421_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-sun-yat-sen-university_439_small.jpg",
    "name": "National Sun Yat-sen University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-sun-yat-sen-university",
    "country": "Kaohsiung City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-sun-yat-sen-university_439_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/pontificia-universidad-javeriana_592560cf2aeae70239af514a_small.jpg",
    "name": "Pontificia Universidad Javeriana",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/pontificia-universidad-javeriana",
    "country": "Bogotá, Colombia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/pontificia-universidad-javeriana_592560cf2aeae70239af514a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/chung-ang-university-cau_1042_small.jpg",
    "name": "Chung-Ang University (CAU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/chung-ang-university-cau",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/chung-ang-university-cau_1042_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/lappeenranta-university-of-technology_592560cf2aeae70239af4f7d_small.jpg",
    "name": "Lappeenranta-Lahti University of Technology LUT",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/lappeenranta-lahti-university-technology-lut",
    "country": "Lappeenranta, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/lappeenranta-university-of-technology_592560cf2aeae70239af4f7d_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tampere-university_5bbf14847d023f5bc849ec9a_small.jpg",
    "name": "Tampere University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tampere-university",
    "country": "Tampere, Finland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tampere-university_5bbf14847d023f5bc849ec9a_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universiti-teknologi-petronas-utp_592560cf2aeae70239af4ef2_small.jpg",
    "name": "Universiti Teknologi PETRONAS (UTP)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universiti-teknologi-petronas-utp",
    "country": "Seri Iskandar, Malaysia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universiti-teknologi-petronas-utp_592560cf2aeae70239af4ef2_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-colorado-denver_2116_small.jpg",
    "name": "University of Colorado, Denver",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-colorado-denver",
    "country": "Denver, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-colorado-denver_2116_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-science-and-technology-beijing_2004_small.jpg",
    "name": "University of Science and Technology Beijing",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-science-technology-beijing",
    "country": "Beijing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-science-and-technology-beijing_2004_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/laval-university_337_small.jpg",
    "name": "Université Laval",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-laval",
    "country": "Québec, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/laval-university_337_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-technical-university-of-athens_592560cf2aeae70239af4aa3_small.jpg",
    "name": "National Technical University of Athens",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-technical-university-athens",
    "country": "Athens, Greece",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-technical-university-of-athens_592560cf2aeae70239af4aa3_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-de-strasbourg_578_small.jpg",
    "name": "Université de Strasbourg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-de-strasbourg",
    "country": "Strasbourg, France",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-de-strasbourg_578_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-mannheim_592560cf2aeae70239af4c0b_small.jpg",
    "name": "Universität Mannheim",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-mannheim",
    "country": "Mannheim, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-mannheim_592560cf2aeae70239af4c0b_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220112080628am351672jcu-48x48.jpg",
    "name": "James Cook University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/james-cook-university",
    "country": "Townsville, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220112080628am351672jcu-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-naples-federico-ii_432_small.jpg",
    "name": "University of Naples - Federico II",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-naples-federico-ii",
    "country": "Naples, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-naples-federico-ii_432_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-the-witwatersrand_679_small.jpg",
    "name": "University of Witwatersrand",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-witwatersrand",
    "country": "Johannesburg, South Africa",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-the-witwatersrand_679_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/johannes-gutenberg-universitt-mainz_382_small.jpg",
    "name": "Johannes Gutenberg Universität Mainz",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/johannes-gutenberg-universitat-mainz",
    "country": "Mainz, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/johannes-gutenberg-universitt-mainz_382_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/washington-state-university_666_small.jpg",
    "name": "Washington State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/washington-state-university",
    "country": "Pullman, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/washington-state-university_666_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/oxford-brookes-university_592560cf2aeae70239af4c61_small.jpg",
    "name": "Oxford Brookes University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/oxford-brookes-university",
    "country": "Oxford, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/oxford-brookes-university_592560cf2aeae70239af4c61_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/wake-forest-university_661_small.jpg",
    "name": "Wake Forest University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/wake-forest-university",
    "country": "Winston-Salem, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/wake-forest-university_661_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/colorado-state-university_136_small.jpg",
    "name": "Colorado State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/colorado-state-university",
    "country": "Fort Collins, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/colorado-state-university_136_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/rensselaer-polytechnic-institute_522_small.jpg",
    "name": "Rensselaer Polytechnic Institute",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/rensselaer-polytechnic-institute",
    "country": "Troy, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/rensselaer-polytechnic-institute_522_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidade-nova-de-lisboa_460_small.jpg",
    "name": "Universidade Nova de Lisboa",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidade-nova-de-lisboa",
    "country": "Lisbon, Portugal",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidade-nova-de-lisboa_460_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidade-federal-de-so-paulo_2750_small.jpg",
    "name": "Universidade Federal de São Paulo",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidade-federal-de-sao-paulo",
    "country": "São Paulo, Brazil",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidade-federal-de-so-paulo_2750_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-johannesburg-_592560cf2aeae70239af4f46_small.jpg",
    "name": "University of Johannesburg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-johannesburg",
    "country": "Johannesburg, South Africa",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-johannesburg-_592560cf2aeae70239af4f46_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/shanghai-university_557_small.jpg",
    "name": "Shanghai University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/shanghai-university",
    "country": "Shanghai, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/shanghai-university_557_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/tulane-university_631_small.jpg",
    "name": "Tulane University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/tulane-university",
    "country": "New Orleans, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/tulane-university_631_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220623031009am674262UC-logo-48x48.jpg",
    "name": "University of Canberra",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-canberra",
    "country": "Bruce, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220623031009am674262UC-logo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-essex_592560cf2aeae70239af4b4c_small.jpg",
    "name": "Essex, University of",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/essex-university",
    "country": "Colchester, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-essex_592560cf2aeae70239af4b4c_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220308050407pm529761Swansea-Uni-logo-200x200-photo-48x48.jpg",
    "name": "Swansea University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/swansea-university",
    "country": "Swansea, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220308050407pm529761Swansea-Uni-logo-200x200-photo-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-cyprus-ucy_14238_small.jpg",
    "name": "University of Cyprus (UCY)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-cyprus-ucy",
    "country": "Nicosia, Cyprus",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-cyprus-ucy_14238_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-trento_623_small.jpg",
    "name": "University of Trento",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-trento",
    "country": "Trento, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-trento_623_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-troms-the-arctic-university-of-norway_625_small.jpg",
    "name": "University of Tromsø The Arctic University of Norway",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-tromso-arctic-university-norway",
    "country": "Tromsø, Norway",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-troms-the-arctic-university-of-norway_625_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/illinois-institute-of-technology_277_small.jpg",
    "name": "Illinois Institute of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/illinois-institute-technology",
    "country": "Chicago, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/illinois-institute-of-technology_277_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/hufs-hankuk-korea-university-of-foreign-studies_1054_small.jpg",
    "name": "HUFS - Hankuk (Korea) University of Foreign Studies",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hufs-hankuk-korea-university-foreign-studies",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/hufs-hankuk-korea-university-of-foreign-studies_1054_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-american-university-in-cairo_36_small.jpg",
    "name": "The American University in Cairo",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/american-university-cairo",
    "country": "Cairo, Egypt",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-american-university-in-cairo_36_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/umm-al-qura-university-_592560cf2aeae70239af4d44_small.jpg",
    "name": "Umm Al-Qura University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/umm-al-qura-university",
    "country": "Makkah, Saudi Arabia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/umm-al-qura-university-_592560cf2aeae70239af4d44_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-leipzig_341_small.jpg",
    "name": "Universität Leipzig",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-leipzig",
    "country": "Leipzig, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-leipzig_341_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universitt-des-saarlandes_541_small.jpg",
    "name": "Universität des Saarlandes",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universitat-des-saarlandes",
    "country": "Saarbrücken, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universitt-des-saarlandes_541_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-milano-bicocca_14336_small.jpg",
    "name": "University of Milano-Bicocca",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-milano-bicocca",
    "country": "Milan, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-milano-bicocca_14336_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/auckland-university-of-technology-aut_592560cf2aeae70239af4ef7_small.jpg",
    "name": "Auckland University of Technology (AUT)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/auckland-university-technology-aut",
    "country": "Auckland, New Zealand",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/auckland-university-of-technology-aut_592560cf2aeae70239af4ef7_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/bond-university_715_small.jpg",
    "name": "Bond University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/bond-university",
    "country": "Gold Coast, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/bond-university_715_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sichuan-university_885_small.jpg",
    "name": "Sichuan University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sichuan-university",
    "country": "Chengdu, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sichuan-university_885_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-florence_208_small.jpg",
    "name": "University of Florence",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-florence",
    "country": "Florence, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-florence_208_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/brandeis-university_66_small.jpg",
    "name": "Brandeis University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/brandeis-university",
    "country": "Waltham, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/brandeis-university_66_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-coimbra_592560cf2aeae70239af4b07_small.jpg",
    "name": "University of Coimbra",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-coimbra",
    "country": "Coimbra, Portugal",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-coimbra_592560cf2aeae70239af4b07_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-iowa_592560cf2aeae70239af4baa_small.jpg",
    "name": "University of Iowa",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-iowa",
    "country": "Iowa City, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-iowa_592560cf2aeae70239af4baa_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-saskatchewan_1755_small.jpg",
    "name": "University of Saskatchewan",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-saskatchewan",
    "country": "Saskatoon, Canada",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-saskatchewan_1755_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/politcnica-de-madrid_1507_small.jpg",
    "name": "Universidad Politécnica de Madrid (UPM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-politecnica-de-madrid",
    "country": "Madrid, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/politcnica-de-madrid_1507_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/220202052805pm846901HSG-Bildmarke-RGB-48x48.jpg",
    "name": "University of St.Gallen (HSG)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-stgallen-hsg",
    "country": "St. Gallen, Switzerland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/220202052805pm846901HSG-Bildmarke-RGB-48x48.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/colorado-school-of-mines_592560de9988f300e2320883_small.jpg",
    "name": "Colorado School of Mines",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/colorado-school-mines",
    "country": "Golden, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/colorado-school-of-mines_592560de9988f300e2320883_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/far-eastern-federal-university_592560cf2aeae70239af57c9_small.jpg",
    "name": "Far Eastern Federal University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/far-eastern-federal-university",
    "country": "Vladivostok, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/far-eastern-federal-university_592560cf2aeae70239af57c9_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/goldsmiths-university-of-london_355_small.jpg",
    "name": "Goldsmiths, University of London",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/goldsmiths-university-london",
    "country": "London, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/goldsmiths-university-of-london_355_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/martin-luther-universitt-halle-wittenberg_245_small.jpg",
    "name": "Martin-Luther-Universität Halle-Wittenberg",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/martin-luther-universitat-halle-wittenberg",
    "country": "Halle, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/martin-luther-universitt-halle-wittenberg_245_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/logo-UNAIR-200px-x-200px-01-48x48.jpeg",
    "name": "Airlangga University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/airlangga-university",
    "country": "Surabaya, Indonesia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/logo-UNAIR-200px-x-200px-01-48x48.jpeg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/amirkabir-university-of-technology_592560cf2aeae70239af4e54_small.jpg",
    "name": "Amirkabir University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/amirkabir-university-technology",
    "country": "Tehran, Iran",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/amirkabir-university-of-technology_592560cf2aeae70239af4e54_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/southeast-university_568_small.jpg",
    "name": "Southeast University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/southeast-university",
    "country": "Nanjing, China (Mainland)",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/southeast-university_568_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-belgrano_51_small.jpg",
    "name": "Universidad de Belgrano",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-belgrano",
    "country": "Buenos Aires, Argentina",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-belgrano_51_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/national-taipei-university-of-technology_1993_small.jpg",
    "name": "National Taipei University of Technology",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-taipei-university-technology",
    "country": "Taipei City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/national-taipei-university-of-technology_1993_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-montevideo-um_695_small.jpg",
    "name": "Universidad de Montevideo (UM)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-montevideo-um",
    "country": "Montevideo, Uruguay",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-montevideo-um_695_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/ben-gurion-university-of-the-negev_592560cf2aeae70239af4ab7_small.jpg",
    "name": "Ben-Gurion University of The Negev",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/ben-gurion-university-negev",
    "country": "Be'er Sheva, Israel",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/ben-gurion-university-of-the-negev_592560cf2aeae70239af4ab7_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/hasselt-university_1255_small.jpg",
    "name": "Hasselt University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/hasselt-university",
    "country": "Diepenbeek, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/hasselt-university_1255_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-ort-uruguay_470_small.jpg",
    "name": "Universidad ORT Uruguay",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-ort-uruguay",
    "country": "Montevideo, Uruguay",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-ort-uruguay_470_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-stirling_575_small.jpg",
    "name": "University of Stirling",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-stirling",
    "country": "Stirling, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-stirling_575_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/florida-state-university_211_small.jpg",
    "name": "Florida State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/florida-state-university",
    "country": "Tallahassee, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/florida-state-university_211_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-missouri-columbia_409_small.jpg",
    "name": "University of Missouri, Columbia",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-missouri-columbia",
    "country": "Columbia, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-missouri-columbia_409_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/bar-ilan-university_997_small.jpg",
    "name": "Bar-Ilan University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/bar-ilan-university",
    "country": "Ramat Gan, Israel",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/bar-ilan-university_997_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/chiba-university_119_small.jpg",
    "name": "Chiba University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/chiba-university",
    "country": "Chiba City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/chiba-university_119_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-texas-dallas_592560cf2aeae70239af5355_small.jpg",
    "name": "University of Texas Dallas",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-texas-dallas",
    "country": "Richardson, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-texas-dallas_592560cf2aeae70239af5355_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/chang-gung-university_1187_small.jpg",
    "name": "Chang Gung University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/chang-gung-university",
    "country": "Taoyuan City, Taiwan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/chang-gung-university_1187_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universit-de-lige_592560cf2aeae70239af4bd9_small.jpg",
    "name": "Université de Liège",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universite-de-liege",
    "country": "Liège, Belgium",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universit-de-lige_592560cf2aeae70239af4bd9_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/auezov-south-kazakhstan-state-university-sksu_592560cf2aeae70239af52eb_small.jpg",
    "name": "Auezov South Kazakhstan University (SKU)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/auezov-south-kazakhstan-university-sku",
    "country": "Shymkent, Kazakhstan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/auezov-south-kazakhstan-state-university-sksu_592560cf2aeae70239af52eb_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/stellenbosch-university_574_small.jpg",
    "name": "Stellenbosch University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/stellenbosch-university",
    "country": "Stellenbosch, South Africa",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/stellenbosch-university_574_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-catholic-university-of-korea-_592560cf2aeae70239af4ed7_small.jpg",
    "name": "The Catholic University of Korea",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/catholic-university-korea",
    "country": "Gyeonggi, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-catholic-university-of-korea-_592560cf2aeae70239af4ed7_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/aston-university_29_small.jpg",
    "name": "Aston University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/aston-university",
    "country": "Birmingham, United Kingdom",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/aston-university_29_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-turin_632_small.jpg",
    "name": "University of Turin",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-turin",
    "country": "Turin, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-turin_632_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/the-national-university-of-science-and-technology-misis_14956_small.jpg",
    "name": "The National University of Science and Technology MISIS",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/national-university-science-technology-misis",
    "country": "Moscow, Russia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/the-national-university-of-science-and-technology-misis_14956_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/universidad-de-santiago-de-chile-usach_548_small.jpg",
    "name": "Universidad de Santiago de Chile (USACH)",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/universidad-de-santiago-de-chile-usach",
    "country": "Santiago, Chile",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/universidad-de-santiago-de-chile-usach_548_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/yokohama-city-university_592560cf2aeae70239af4d32_small.jpg",
    "name": "Yokohama City University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/yokohama-city-university",
    "country": "Yokohama City, Japan",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/yokohama-city-university_592560cf2aeae70239af4d32_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/dublin-city-university_592560cf2aeae70239af4b27_small.jpg",
    "name": "Dublin City University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/dublin-city-university",
    "country": "Dublin, Ireland",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/dublin-city-university_592560cf2aeae70239af4b27_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/justus-liebig-university-giessen_592560cf2aeae70239af4b68_small.jpg",
    "name": "Justus-Liebig-University Giessen",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/justus-liebig-university-giessen",
    "country": "Giessen, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/justus-liebig-university-giessen_592560cf2aeae70239af4b68_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/unesp_492_small.jpg",
    "name": "UNESP",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/unesp",
    "country": "Sao Paulo, Brazil",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/unesp_492_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-granada_235_small.jpg",
    "name": "University of Granada",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-granada",
    "country": "Granada, Spain",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-granada_235_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/western-sydney-university_848_small.jpg",
    "name": "Western Sydney University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/western-sydney-university",
    "country": "Milperra, Australia",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/western-sydney-university_848_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/boston-college_723_small.jpg",
    "name": "Boston College",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/boston-college",
    "country": "Chestnut Hill, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/boston-college_723_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/christian-albrechts-university-zu-kiel_318_small.jpg",
    "name": "Christian-Albrechts-University zu Kiel",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/christian-albrechts-university-zu-kiel",
    "country": "Kiel, Germany",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/christian-albrechts-university-zu-kiel_318_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/dongguk-university_1048_small.jpg",
    "name": "Dongguk University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/dongguk-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/dongguk-university_1048_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/iowa-state-university_294_small.jpg",
    "name": "Iowa State University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/iowa-state-university",
    "country": "Ames, United States",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/iowa-state-university_294_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/sogang-university_565_small.jpg",
    "name": "Sogang University",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/sogang-university",
    "country": "Seoul, South Korea",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/sogang-university_565_small.jpg"
  },
  {
    "oldIconUrl":
        "https://www.topuniversities.com/sites/default/files/university-of-rome-tor-vergata_592560cf2aeae70239af4c99_small.jpg",
    "name": "University of Rome \\Tor Vergata\\\"\"",
    "collegeUrl":
        "https://www.topuniversities.com/university-rankings/world-university-rankings/2022/universities/university-rome-tor-vergata",
    "country": "Rome, Italy",
    "iconUrl":
        "https://res.cloudinary.com/dx6dieevo/image/upload/nova_social/colleges/university-of-rome-tor-vergata_592560cf2aeae70239af4c99_small.jpg"
  }
];
