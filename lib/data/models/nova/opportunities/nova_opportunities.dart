import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:nova_social/data/models/misc/interfaces/interfaces.dart';
part 'nova_opportunities.freezed.dart';
part 'nova_opportunities.g.dart';

@freezed
class NovaOpportunities
    with _$NovaOpportunities
    implements GlobalDocHelperInterface {
  @Implements<GlobalDocHelperInterface>()
  const factory NovaOpportunities({
    String? id,
    String? name,
    String? description,
    String? iconUrl,
    String? mapSvgUrl,
    String? topDisplayPosition,
    String? leftDisplayPosition,
    String? semanticsLabel,
    String? angle,
    @Default(AppKeyNames.interests) @JsonKey(ignore: true) String? docName,
  }) = _NovaOpportunities;

  factory NovaOpportunities.fromJson(Map<String, dynamic> json) =>
      _$NovaOpportunitiesFromJson(json);
}

// @CopyWith()
// @JsonSerializable()
// class NovaOpportunities implements ToFromJsonInterface, GlobalDocHelperInterface {
//   @override
//   String? id;
//   String? name;
//   String? description;
//   String? iconUrl;

//   @override
//   @JsonKey(ignore: true)
//   String? docName;

//   NovaOpportunities({
//     this.id,
//     this.name,
//     this.description,
//     this.iconUrl,
//     this.docName = AppKeyNames.opportunities,
//   });

//   factory NovaOpportunities.fromJson(Map<String, dynamic> json) =>
//       _$NovaOpportunitiesFromJson(json);

//   Map<String, dynamic> toJson() => _$NovaOpportunitiesToJson(this);
// }

final List<Map<String, String>> opportunitiesList = [
  {
    "description":
        "Paying it forward by giving up your time to help organizations in need",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119779/icons8-volunteering-100_jc1dzf.png",
    "id": "2f6f635c-f606-40c9-9675-fd3147668f69",
    "name": "Volunteering",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815289/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Volunteering_bxlypj.svg"
  },
  {
    "description": "Contributing articles or blogs on certain topics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119780/icons8-pen-100_rok92q.png",
    "id": "550617ef-4682-46eb-bc05-24e16dcf2ed6",
    "name": "Writing",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815290/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Writing_s0ri0y.svg"
  },
  {
    "description": "Speaking on podcast episodes on certain topics",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-microphone-100_mjtlue.png",
    "id": "50d15ca5-24fb-4f10-8362-8294021ec327",
    "name": "Speaking on podcasts"
  },
  {
    "description":
        "Speaking on topics you are passionate about at all kinds of events",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113827/speaker_interest.png",
    "id": "5b700be2-5ca9-49d3-bce4-67d7e08f05e6",
    "name": "Speaking at Events"
  },
  {
    "description": "Fundraising for your company",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png",
    "id": "c05e68d1-e81b-4113-838c-9cd446bb664b",
    "name": "Raising funding"
  },
  {
    "description": "Collaborate to start a podcast ",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671115994/icons8-microphone-100_mjtlue.png",
    "id": "4229a412-76ab-4929-a438-6ed360b1e590",
    "name": "Starting a podcast",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815289/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Starting_a_Podcast_nvgmzt.svg"
  },
  {
    "description": "Partnering with people to build side projects part time",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118821/icons8-collaborating-in-circle-100_i5nt7l.png",
    "id": "e73776bb-7693-40fa-bd4b-ee371aa5bc48",
    "name": "Collaborating on Side Projects"
  },
  {
    "description": "Freelancing, consulting, or part time employment",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694156/Icons%20for%20Nova/O_-_part_time_roles_xkeouo.png",
    "id": "e49826d4-77cc-46fd-a78d-4809e74720ff",
    "name": "Part time roles",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815287/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Part_time_roles_uubtmn.svg"
  },
  {
    "description": "Contributing to open source projects",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113611/open-source-fill_sesfca.png",
    "id": "730e8251-585a-45d3-aaf8-1cdc4b7ea536",
    "name": "Open Source Contributions"
  },
  {
    "description": "Mentoring people in similar fields to you",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113904/mentor_interest.png",
    "id": "d1c9f535-7b71-40b5-bbfb-4f75cd1825eb",
    "name": "Mentoring",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815287/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Mentoring_byrkca.svg"
  },
  {
    "description":
        "Chatting and networking with new people. Feel free to reach out!",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119834/icons8-communication-100_ybdpep.png",
    "id": "d471df93-af33-4d4b-a8fd-30229ad2f2e9",
    "name": "Meeting new people"
  },
  {
    "description": "Live streaming with people",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119755/icons8-youtube-live-100_iskmnz.png",
    "id": "eaa82e55-2068-416e-a0b3-358b52f116d0",
    "name": "Live Streaming"
  },
  {
    "description": "Joining companies or organizations as an intern",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119477/icons8-resume-100_oirbzk.png",
    "id": "210c8009-c23f-4ffb-9b77-35c88a02af63",
    "name": "Internships",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815286/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Internships_ls7ryx.svg"
  },
  {
    "description": "Hiring for full time roles",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119477/icons8-resume-100_oirbzk.png",
    "id": "ccf3e5b6-6885-4714-b0d1-dc1df1b9f943",
    "name": "Hiring",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815285/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Hiring_qurl5g.svg"
  },
  {
    "description":
        "Sharing your knowledge by guest lecturing at schools and universities",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671113827/speaker_interest.png",
    "id": "32179b3b-7f7b-475c-a8eb-94a3f1f9731c",
    "name": "Guest lecturing",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815285/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Guest_lecturing_jp5llc.svg"
  },
  {
    "description": "Reviewing and giving feedback on someone's portfolio",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671119351/icons8-comments-100_zpto2t.png",
    "id": "ca5a64b6-ef18-4ab0-8de2-b1c434a996d1",
    "name": "Giving portfolio feedback",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815285/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Giving_Portfolio_feedback_ixsl12.svg"
  },
  {
    "description": "Creating content for brands and companies",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694151/Icons%20for%20Nova/content_creator_interest_O_-_content_creation_gzcnu5.png",
    "id": "214f18b5-08bc-4bb0-bd4b-f43cfa920353",
    "name": "Content Creation"
  },
  {
    "description":
        "Building up a business from vision to reality with a co-founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png",
    "id": "1298a5c6-09d6-4110-b274-42a8343162f7",
    "name": "Co-founding a company"
  },
  {
    "description":
        "Joining video calls to brainstorm with like minded people on certain problems",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118855/icons8-analyzing-skill-100_wkjpta.png",
    "id": "e23c1124-88e2-4673-9721-db383aef94b3",
    "name": "Brainstorming",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815284/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Brainstorming_kvzzvj.svg"
  },
  {
    "description": "Checking out the newest consumer or business products",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1670694155/Icons%20for%20Nova/O_-_beta_testing_new_products_evbpgw.png",
    "id": "a57e1262-81b7-49ee-ae43-9f610b9cdc79",
    "name": "Beta testing new products",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815284/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Beta_testing_new_products_pei0f7.svg"
  },
  {
    "description":
        "Building up an organisation from vision to reality with a co-founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png",
    "id": "770c1f83-8794-4fe8-b774-03bfb1c44c5a",
    "name": "Co-founding a non-profit organisation"
  },
  {
    "description": "Collaborating to start a project",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118821/icons8-collaborating-in-circle-100_i5nt7l.png",
    "id": "8ee03ed5-bd98-4143-ad8b-ab13bd2c2ab5",
    "name": "Working on projects"
  },
  {
    "description":
        "Partnering with people to participate in various events and competitions",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118821/icons8-collaborating-in-circle-100_i5nt7l.png",
    "id": "6a11293e-bce6-4069-8663-fae99c4e1294",
    "name": "Participating in competitions"
  },
  {
    "description": "Working on research projects with people",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118855/icons8-analyzing-skill-100_wkjpta.png",
    "id": "65c61af4-d827-440e-bc8c-3715c5d25d4b",
    "name": "Research Roles"
  },
  {
    "description": "Building up a club with a co-founder",
    "iconUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1671118315/icons8-rocket-96_usqnvz.png",
    "id": "0cedbc66-04b9-42ba-ba8c-1ea3723cf506",
    "name": "Co-founding a club",
    "mapSvgUrl":
        "https://res.cloudinary.com/dx67gtwat/image/upload/v1679815284/Interest%20Island%20Map%20-%20Space%20Station/Blue%20Continent/Co-founding_a_club_qqucck.svg"
  }
];
