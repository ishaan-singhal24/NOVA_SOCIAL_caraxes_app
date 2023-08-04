import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/misc/interfaces/interfaces.dart';
part 'user_dream_career.freezed.dart';
part 'user_dream_career.g.dart';

@freezed
class UserDreamCareer
    with _$UserDreamCareer
    implements GlobalDocHelperInterface, DreamInterface {
  @Implements<GlobalDocHelperInterface>()
  @Implements<DreamInterface>()
  const factory UserDreamCareer({
    String? id,
    String? name,
    String? iconUrl,
    @Default(AppKeyNames.countries) @JsonKey(ignore: true) String? docName,
  }) = _UserDreamCareer;

  factory UserDreamCareer.fromJson(Map<String, dynamic> json) =>
      _$UserDreamCareerFromJson(json);
}

var dreamCareersList = [
  {
    "name": "Content Writer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671114405/writer_interest.png"
  },
  {
    "name": "Interior Designer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839274/Dream%20Careers/icons8-architect-100_1_cpvfix.png"
  },
  {
    "name": "Journalist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117940/icons8-journalist-100_ldrwv1.png"
  },
  {
    "name": "Social Worker",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115477/global-fill_phjhqc.png"
  },
  {
    "name": "Wildlife Photography",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694156/Icons%20for%20Nova/photography_interest_cww9g2.png"
  },
  {
    "name": "Social Media Manager",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118035/icons8-marketing-96_sr4dxk.png"
  },
  {
    "name": "IAS/IPS Officer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839715/Dream%20Careers/icons8-public-safety-100_crqrjk.png"
  },
  {
    "name": "Event Management",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115373/bar-chart-box-fill_aaqwzm.png"
  },
  {
    "name": "Financial Analyst and Advisor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/finance_interest_zpfuie.png"
  },
  {
    "name": "Investment Banking ",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/finance_interest_zpfuie.png"
  },
  {
    "name": "Chartered Accountant",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1675012713/Dream%20Careers/icons8-accountant-96_magqzo.png"
  },
  {
    "name": "Company Secretary",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1675012713/Dream%20Careers/icons8-accountant-96_magqzo.png"
  },
  {
    "name": "Human Resources",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694153/Icons%20for%20Nova/human-resources_interest_sabw0e.png"
  },
  {
    "name": "Event Manager",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115373/bar-chart-box-fill_aaqwzm.png"
  },
  {
    "name": "Engineer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839518/Dream%20Careers/icons8-engineering-100_mosvg1.png"
  },
  {
    "name": "Doctor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1675011883/Dream%20Careers/icons8-doctors-bag-100_n8jdqx.png"
  },
  {
    "name": "Pilot",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839070/Dream%20Careers/icons8-air-pilot-hat-100_wqbohn.png"
  },
  {
    "name": "Data Scientist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839793/Dream%20Careers/icons8-artificial-intelligence-100_lwhtir.png"
  },
  {
    "name": "Actor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-drama-96_k7qhhv.png"
  },
  {
    "name": "Army Officer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839073/Dream%20Careers/icons8-army-star-100_mmhxty.png"
  },
  {
    "name": "Astronaut",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118155/icons8-astronomy-100_uvwxdi.png"
  },
  {
    "name": "Banker",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/finance_interest_zpfuie.png"
  },
  {
    "name": "Chef",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117964/icons8-chef-hat-100_1_hxtcae.png"
  },
  {
    "name": "Choreographer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-dancing-100_iagehe.png"
  },
  {
    "name": "Fashion Designer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/fashion_stylist_interest_yyvwfn.png"
  },
  {
    "name": "Journalist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117940/icons8-journalist-100_ldrwv1.png"
  },
  {
    "name": "Lawyer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674838720/Dream%20Careers/icons8-lawyer-100_l0l9tt.png"
  },
  {
    "name": "Criminologist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674838847/Dream%20Careers/icons8-investigation-100_x0jmhy.png"
  },
  {
    "name": "Media",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117753/icons8-cinema-90_zkhmsf.png"
  },
  {
    "name": "Teacher",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-training-100_mgjccz.png"
  },
  {
    "name": "Scientist",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674838887/Dream%20Careers/icons8-scientist-man-100_aigmkl.png"
  },
  {
    "name": "Product Design",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694160/Icons%20for%20Nova/UI_UX_design_interest_xvzbqw.png"
  },
  {
    "name": "Counselor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674838934/Dream%20Careers/icons8-counselor-100_vlrwea.png"
  },
  {
    "name": "Bakery and Confectionery",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117964/icons8-chef-hat-100_1_hxtcae.png"
  },
  {
    "name": "Anchor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117940/icons8-journalist-100_ldrwv1.png"
  },
  {
    "name": "News Reporter",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117940/icons8-journalist-100_ldrwv1.png"
  },
  {
    "name": "Professor",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-training-100_mgjccz.png"
  },
  {
    "name": "TV Producer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694151/Icons%20for%20Nova/content_creator_interest_O_-_content_creation_gzcnu5.png"
  },
  {
    "name": "Aerospace Engineers",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1675012822/Dream%20Careers/icons8-astronaut-helmet-100_fh8mzt.png"
  },
  {
    "name": "Automobile Engineers",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1675012820/Dream%20Careers/icons8-automotive-100_ikvm9u.png"
  },
  {
    "name": "Computer Engineers",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115251/computer-fill_mzi8t0.png"
  },
  {
    "name": "Cell Therapy",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118016/icons8-biology-book-100_vddzeb.png"
  },
  {
    "name": "Biotechnology",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118016/icons8-biology-book-100_vddzeb.png"
  },
  {
    "name": "Biochemistry",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118016/icons8-biology-book-100_vddzeb.png"
  },
  {
    "name": "Genetic Engineering",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118016/icons8-biology-book-100_vddzeb.png"
  },
  {
    "name": "Aviation",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1674839068/Dream%20Careers/icons8-aviation-100_wkzk8d.png"
  },
  {
    "name": "Entrepreneurship",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671112537/Entrepreneur_interest.png"
  },
  {
    "name": "Financial Markets",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/finance_interest_zpfuie.png"
  },
  {
    "name": "Digital Marketer",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118035/icons8-marketing-96_sr4dxk.png"
  },
  {
    "name": "Product Manager",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1675012966/Dream%20Careers/icons8-ideas-96_d2vxyt.png"
  },
  {
    "name": "Animation & Multimedia",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117753/icons8-cinema-90_zkhmsf.png"
  },
  {
    "name": "Fashion Technology",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/fashion_stylist_interest_yyvwfn.png"
  },
  {
    "name": "Visual Arts",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694150/Icons%20for%20Nova/artist_interest_btvdb1.png"
  },
  {
    "name": "Literary Arts",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694150/Icons%20for%20Nova/artist_interest_btvdb1.png"
  },
  {
    "name": "Performing Arts",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694150/Icons%20for%20Nova/artist_interest_btvdb1.png"
  },
  {
    "name": "Hotel Management ",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115373/bar-chart-box-fill_aaqwzm.png"
  }
];
