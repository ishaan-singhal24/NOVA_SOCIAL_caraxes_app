import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Message {
  String? text;
  UserModel? user;
  @TimestampConverter()
  DateTime? sentAt;
  bool? readReciept;

  Message({
    this.text,
    this.user,
    this.sentAt,
    this.readReciept,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

final List<Map<String, dynamic>> chatJson = [
  {
    'text':
        'Thanks for the help man, really appriciate your efforts, thanks :)',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668795038000),
    'readReciept': false,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text':
        'Alright so reviewed the resume and some things require immmediate change:\n1.Name should be in caps\n2.School certificates are not required',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668794378000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'File recieved\nWill send you the response in 10 minutes',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668793778000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text':
        'attachment is included, please do check that jfbjdbsfjdbfjbf ssfbdjkfbdjbf jbfhdsbfsdbfhsj sjfdbdsjkfbjsdf hfgfdsdfhbshjbfshfbweh effbesfbehewyfb',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668765278000),
    'readReciept': false,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Hey brother, send me that file also',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668764438000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'Bro what documents you need?',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668763838000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Ohh, sorry forgot about that!',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668763538000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'Do you remember what we were told to do yesterday',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668762938000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Hey Khushal, how are you!',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668708938000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'I am your friend from coaching',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668620978000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Sorry I dont remember you!',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668611558000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'Hey Sparsh',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668609158000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Sorry I dont remember you!',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668527738000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'Hey Sparsh',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668527438000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Sorry I dont remember you!',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668526838000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'Hey Sparsh',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668526538000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
  {
    'text': 'Sorry I dont remember you!',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668525938000),
    'readReciept': true,
    'user': {
      'userId': '121212',
      'userName': 'Sparsh Agarwal',
      'userImage':
          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
    },
  },
  {
    'text': 'Hey Sparsh',
    'sentAt': Timestamp.fromMillisecondsSinceEpoch(1668525458000),
    'readReciept': true,
    'user': {
      'userId': '242424',
      'userName': 'Khushal Rao',
      'userImage':
          'https://instagram.fjai6-1.fna.fbcdn.net/v/t51.2885-19/299310937_5319560438151258_302618196935923778_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fjai6-1.fna.fbcdn.net&_nc_cat=106&_nc_ohc=I2cuv8MoU2QAX-m5tzM&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDTQfq3Pcd4alMh4RMqMHKYDBWLuilKBU0vypcdCsO_9w&oe=637A6674&_nc_sid=8fd12b',
    },
  },
];
