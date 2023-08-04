import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:nova_social/data/models/misc/misc.dart';
part 'nova_interests.freezed.dart';
part 'nova_interests.g.dart';

@freezed
class NovaInterests with _$NovaInterests implements GlobalDocHelperInterface {
  @Implements<GlobalDocHelperInterface>()
  const factory NovaInterests({
    String? id,
    String? name,
    String? iconUrl,
    String? mapSvgUrl,
    String? topDisplayPosition,
    String? leftDisplayPosition,
    String? semanticsLabel,
    @Default(AppKeyNames.interests) @JsonKey(ignore: true) String? docName,
  }) = _NovaInterests;

  factory NovaInterests.fromJson(Map<String, dynamic> json) =>
      _$NovaInterestsFromJson(json);
}

// class NovaInterests implements ToFromJson {
//   @override
//   String? id;
//   String? name;
//   String? iconUrl;

//   @override
//   @JsonKey(ignore: true)
//   String? docName;

//   NovaInterests({
//     this.id,
//     this.name,
//     this.iconUrl,
//     this.docName = AppKeyNames.interests,
//   });

//   factory NovaInterests.fromJson(Map<String, dynamic> json) =>
//       _$NovaInterestsFromJson(json);

//   @override
//   Map<String, dynamic> toJson() => _$NovaInterestsToJson(this);
// }

final List<Map<String, String>> interestIconLists = [
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671112537/Entrepreneur_interest.png",
    "id": "ebffa316-f136-4cdf-91ca-bf98f6d51c2c",
    "name": "Entrepreneur",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815187/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Entrepreneur_zjbwvg.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png",
    "id": "33d9bebc-77f8-41bd-9cee-e00e8a428a34",
    "name": "Founder",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815187/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Founder_oabuz0.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115588/icons8-rock-music-100_ydcqiw.png",
    "id": "f55fd612-960e-4f45-b733-57a85a70c59c",
    "name": "Guitarist",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815970/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Guitarist_kuruit.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-micro-100_pyqhmw.png",
    "id": "af580297-a626-4304-b0c5-069974c31f64",
    "name": "Singer",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815972/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Singer_alrhkw.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694155/Icons%20for%20Nova/music_interest_wcspu6.png",
    "id": "62b6aae7-6352-4b59-8125-8cce1cf5f499",
    "name": "Music",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815970/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Music_wdnmfp.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-dancing-100_iagehe.png",
    "id": "17453200-67e6-4563-ad48-64b973d13157",
    "name": "Dance"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113486/Blockchain_interest.png",
    "id": "a5a3d2f5-d4bc-43d2-b570-8eb3d6d74b3e",
    "name": "Blockchain",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816666/Interest%20Island%20Map%20-%20Space%20Station/Rightmost%20Blue%20Continent/Bllockchain_msgx8w.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113611/open-source-fill_sesfca.png",
    "id": "b0aa7c1e-2108-487f-b8ab-d622a2032b38",
    "name": "Open Source"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113721/cybersecurity_interest.png",
    "id": "c3508685-7ceb-4d79-a679-97b00148da24",
    "name": "Cybersecurity",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816667/Interest%20Island%20Map%20-%20Space%20Station/Rightmost%20Blue%20Continent/Cybersecurity_uxykgo.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694160/Icons%20for%20Nova/UI_UX_design_interest_xvzbqw.png",
    "id": "83714412-795f-4b5b-ae8f-67acaaa46bd0",
    "name": "UI UX Design"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113827/speaker_interest.png",
    "id": "22371982-8057-4243-a962-12bc1396a845",
    "name": "Speaker",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816668/Interest%20Island%20Map%20-%20Space%20Station/Rightmost%20Blue%20Continent/Speaker_b2a00y.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694154/Icons%20for%20Nova/Investor_interest_vgwezb.png",
    "id": "eef745c2-9156-42b1-89d3-e6116e2d6778",
    "name": "Investor"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113904/mentor_interest.png",
    "id": "e87f14a9-6b5b-416c-aee3-f292506d4953",
    "name": "Mentor"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113973/volunteer_interest.png",
    "id": "1ecbd4bd-9da2-4413-a602-f044ac37aa4f",
    "name": "Volunteer",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816761/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Volunteer_naqauw.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671114405/writer_interest.png",
    "id": "c31fa5be-4bd4-4461-a254-545799f2fd65",
    "name": "Writer",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816761/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Writer_uwdqwk.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671114809/internship_interest.png",
    "id": "9c0c50e4-4414-4885-8ff9-5e40b49050e5",
    "name": "Intern",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816758/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Intern_pwzkst.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115995/icons8-reading-100_b808az.png",
    "id": "113f2633-ed08-443f-93dc-868c17c088ad",
    "name": "Reader"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670695768/Icons%20for%20Nova/activist_interest_O_-_Activism_cuskdl.png",
    "id": "7cd5164f-2f40-4ea9-8679-1057d743d5b7",
    "name": "Politics"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-training-100_mgjccz.png",
    "id": "326012e0-71e9-416f-a487-5dc30b797d7b",
    "name": "Teacher",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816760/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Teacher_qaavnn.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-microphone-100_mjtlue.png",
    "id": "48cdb2c2-4fca-460b-800b-40c73f290770",
    "name": "Podcaster",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816759/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Podcaster_ftyoul.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-game-controller-100_h9mq4z.png",
    "id": "9d54776c-ad1c-4ae5-8948-bc0a47439d2e",
    "name": "Gamer",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815970/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Gamer_qpumbk.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671116376/icons8-expand-influence-100_btycsa.png",
    "id": "5585870b-80f5-47e5-8f53-f14d34388b34",
    "name": "Influencer",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816024/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Influencer_f6q8pn.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115698/earth-fill_tfno5u.png",
    "id": "2d18244d-c866-4b16-bee5-4d8e0260a069",
    "name": "Traveler",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816026/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Traveler_ylbwmp.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115751/trophy-fill_lt9ald.png",
    "id": "08270d30-fead-4054-8a60-9ea9d02a98c9",
    "name": "Young Achiever"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694151/Icons%20for%20Nova/content_creator_interest_O_-_content_creation_gzcnu5.png",
    "id": "96778344-4fc4-4253-ae8d-e3df5dcdd67a",
    "name": "Content Creator"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-drama-96_k7qhhv.png",
    "id": "f50e8f05-532e-4afe-ab94-cd0ebb98c47a",
    "name": "Actor",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815968/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Actor_rzghw6.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694156/Icons%20for%20Nova/photography_interest_cww9g2.png",
    "id": "23917c24-4680-4e1c-b4c1-cd4d9dbc1570",
    "name": "Photography",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815971/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Photography_chm8b7.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/graphic_design_interest_tbcun7.png",
    "id": "caf1cfa9-02cd-4cfa-bf40-c6996aeebd10",
    "name": "Graphic Design",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815970/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Graphic_Design_f0sn9d.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-blogger-96_aqdioy.png",
    "id": "943fe59f-fc6f-4ee4-9a7c-14836dfd6d9c",
    "name": "Blogger",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815187/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Blogger_javdhu.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118035/icons8-marketing-96_sr4dxk.png",
    "id": "4ac10876-3ea1-466e-a463-91fd4257a7a3",
    "name": "Marketer",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815189/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Marketer_t3dnne.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694150/Icons%20for%20Nova/artist_interest_btvdb1.png",
    "id": "4fea7cfd-da76-4d75-82e1-9b542e31d6ed",
    "name": "Artist",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815968/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Artist_fjnwf8.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/finance_interest_zpfuie.png",
    "id": "a3ad5e0b-6a93-42fc-a6b2-ec27345cb845",
    "name": "Finance",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815187/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Finance_cg1jcz.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-creativity-100_fackhr.png",
    "id": "c9870f68-7990-4412-a149-ba838155dff5",
    "name": "Mental Health",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816025/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Mental_Health_smmb7o.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-climate-change-100_tl1rcp.png",
    "id": "40fedee6-7d64-431d-9625-324e47ea7ad7",
    "name": "Climate Change",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816024/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Climate_change_wapmnt.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117752/icons8-environment-care-100_om7j7j.png",
    "id": "9e3ad937-0ed9-4694-930d-370d993fe672",
    "name": "Environmentalist",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816024/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Environmentalist_ncjz2w.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694153/Icons%20for%20Nova/human-resources_interest_sabw0e.png",
    "id": "5a688654-2785-42d5-83fd-51154b0cfcc4",
    "name": "Human Resources",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815188/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Human_Resources_pyn3xp.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694154/Icons%20for%20Nova/non_profit_founder_interest_yriz4z.png",
    "id": "b099d795-3d3a-429e-8c04-52a9a9fd380f",
    "name": "Non Profit Founder"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117752/icons8-figma-100_pfxgjd.png",
    "id": "bdab7247-ad7b-4dc7-84fd-af30cee083ce",
    "name": "Figma Wizard",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816666/Interest%20Island%20Map%20-%20Space%20Station/Rightmost%20Blue%20Continent/Figma_Wizard_wcotya.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694152/Icons%20for%20Nova/fashion_stylist_interest_yyvwfn.png",
    "id": "ec04bcab-dc05-456f-8d51-162585a22526",
    "name": "Fashion Stylist"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117940/icons8-journalist-100_ldrwv1.png",
    "id": "81160881-ad48-4557-b88d-3362315b2c02",
    "name": "Journalist"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-dog-training-100_h2s0zs.png",
    "id": "d2ad14af-9eaa-43d9-8b61-f70a3125cf4e",
    "name": "Pet Owner"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694159/Icons%20for%20Nova/youtube_interest_fbblhj.png",
    "id": "9b0ab668-525e-490e-9892-a3ec1ab93fb9",
    "name": "YouTube"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117753/icons8-cinema-90_zkhmsf.png",
    "id": "e3749b98-7809-488a-98da-93069ff7cdbb",
    "name": "Film Making"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117948/icons8-innovation-100_wd3w2y.png",
    "id": "211b1264-457f-48a5-a234-30440d472498",
    "name": "Inventor",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816666/Interest%20Island%20Map%20-%20Space%20Station/Rightmost%20Blue%20Continent/Inventor_ocdtyg.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117751/icons8-chess-96_mulber.png",
    "id": "64605117-c412-431c-b4a9-b76c98833ef0",
    "name": "Chess",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816024/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Chess_ldhvnw.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115477/global-fill_phjhqc.png",
    "id": "69badff4-9e78-4c85-9b3a-62bf82b3a718",
    "name": "Social service"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118184/icons8-test-tube-100_uqo3q1.png",
    "id": "e873fa05-7723-4049-a5cd-ac0971aaf33d",
    "name": "Science",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816760/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Science_l8xa3q.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118189/icons8-pi-100_eksp87.png",
    "id": "4319dd68-e516-4258-9634-e1d614db8a43",
    "name": "Mathematics",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816759/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Mathematics_hnlukw.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118238/icons8-mental-health-100_1_fhgeap.png",
    "id": "d5f11477-5de3-4a7c-9c7c-787c101ea9fe",
    "name": "Psychology",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816760/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Psychology_bfarjr.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118155/icons8-astronomy-100_uvwxdi.png",
    "id": "97085cf0-1dad-4305-bfa3-01a8d1675207",
    "name": "Astronomy",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816758/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Astronomy_g9mjn0.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671116064/icons8-exercise-100_koeazh.png",
    "id": "6233ee4d-0a37-4935-99c2-f476dbb8e3c0",
    "name": "Sports",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816026/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/Sports_w9kldi.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115590/microscope-fill_qyduui.png",
    "id": "43edeff9-d130-4494-9c01-e61f673f1100",
    "name": "Researching",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816759/Interest%20Island%20Map%20-%20Space%20Station/Dark%20Green%20Continent/Researching_kax4k7.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118070/icons8-language-100_uiguh0.png",
    "id": "99a78446-f6a6-453a-9b2b-78dff5790bd1",
    "name": "Foreign language"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118016/icons8-biology-book-100_vddzeb.png",
    "id": "8d418bd2-a9fe-464f-b539-c92d2d1f8036",
    "name": "Biology"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117964/icons8-chef-hat-100_1_hxtcae.png",
    "id": "ea50a93b-75e2-48a6-b412-ef6e2923150f",
    "name": "Culinary arts and Bakery"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115373/bar-chart-box-fill_aaqwzm.png",
    "id": "95b2f30d-b521-4eac-adbd-3ef5157e4409",
    "name": "Business and Economics",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815187/Interest%20Island%20Map%20-%20Space%20Station/Green%20Continent/Business_and_Economics_dxrysq.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117916/icons8-theatre-mask-100_aszvgf.png",
    "id": "d6682f40-59f0-4565-822e-1f63a2ff4f4e",
    "name": "Drama",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815968/Interest%20Island%20Map%20-%20Space%20Station/Red%20Continent/Drama_mcglgd.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115251/computer-fill_mzi8t0.png",
    "id": "f8ecd3ac-6781-49d2-ac49-292f71dd9e89",
    "name": "Computer Science",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816666/Interest%20Island%20Map%20-%20Space%20Station/Rightmost%20Blue%20Continent/Computer_Science_mmyblh.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694159/Icons%20for%20Nova/STEM_interest_lmkme4.png",
    "id": "e9ea155c-8ab0-4b83-8711-e05d44e1fb08",
    "name": "STEM",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679816026/Interest%20Island%20Map%20-%20Space%20Station/Maroon%20continent/STEM_sibqbu.svg"
  },
  {
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671117756/icons8-us-music-100_ukluum.png",
    "id": "35402d0b-4af1-40b7-ac10-367f4de7cfa9",
    "name": "Pop culture"
  }
];
