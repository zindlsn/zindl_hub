class TrelloCard {
  TrelloCard({
    required this.id,
    required this.badges,
    required this.checkItemStates,
    required this.closed,
    required this.dueComplete,
    required this.dateLastActivity,
    required this.desc,
    required this.descData,
    this.due,
    required this.dueReminder,
    this.email,
    required this.idBoard,
    required this.idChecklists,
    required this.idList,
    required this.idMembers,
    required this.idMembersVoted,
    required this.idShort,
    this.idAttachmentCover,
    required this.labels,
    required this.idLabels,
    required this.manualCoverAttachment,
    required this.name,
    required this.pos,
    required this.shortLink,
    required this.shortUrl,
    this.start,
    required this.subscribed,
    required this.url,
    required this.cover,
    required this.isTemplate,
    this.cardRole,
  });
  late final String id;
  late final Badges badges;
  late final List<CheckItemStates> checkItemStates;
  late final bool closed;
  late final bool dueComplete;
  late final String dateLastActivity;
  late final String desc;
  late final DescData descData;
  late final DateTime? due;
  late final int dueReminder;
  late final String? email;
  late final String idBoard;
  late final List<String> idChecklists;
  late final String idList;
  late final List<dynamic> idMembers;
  late final List<dynamic> idMembersVoted;
  late final int idShort;
  late final String? idAttachmentCover;
  late final List<dynamic> labels;
  late final List<dynamic> idLabels;
  late final bool manualCoverAttachment;
  late final String name;
  late final double pos;
  late final String shortLink;
  late final String shortUrl;
  late final DateTime? start;
  late final bool subscribed;
  late final String url;
  late final Cover cover;
  late final bool isTemplate;
  late final String? cardRole;

  TrelloCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    badges = Badges.fromJson(json['badges']);
    checkItemStates = List.from(json['checkItemStates'])
        .map((e) => CheckItemStates.fromJson(e))
        .toList();
    closed = json['closed'];
    dueComplete = json['dueComplete'];
    dateLastActivity = json['dateLastActivity'];
    desc = json['desc'];
    descData = DescData.fromJson(json['descData']);
    due = null;
    dueReminder = json['dueReminder'];
    email = null;
    idBoard = json['idBoard'];
    idChecklists = List.castFrom<dynamic, String>(json['idChecklists']);
    idList = json['idList'];
    idMembers = List.castFrom<dynamic, dynamic>(json['idMembers']);
    idMembersVoted = List.castFrom<dynamic, dynamic>(json['idMembersVoted']);
    idShort = json['idShort'];
    idAttachmentCover = null;
    labels = List.castFrom<dynamic, dynamic>(json['labels']);
    idLabels = List.castFrom<dynamic, dynamic>(json['idLabels']);
    manualCoverAttachment = json['manualCoverAttachment'];
    name = json['name'];
    pos = json['pos'];
    shortLink = json['shortLink'];
    shortUrl = json['shortUrl'];
    start = null;
    subscribed = json['subscribed'];
    url = json['url'];
    cover = Cover.fromJson(json['cover']);
    isTemplate = json['isTemplate'];
    cardRole = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['badges'] = badges.toJson();
    data['checkItemStates'] = checkItemStates.map((e) => e.toJson()).toList();
    data['closed'] = closed;
    data['dueComplete'] = dueComplete;
    data['dateLastActivity'] = dateLastActivity;
    data['desc'] = desc;
    data['descData'] = descData.toJson();
    data['due'] = due;
    data['dueReminder'] = dueReminder;
    data['email'] = email;
    data['idBoard'] = idBoard;
    data['idChecklists'] = idChecklists;
    data['idList'] = idList;
    data['idMembers'] = idMembers;
    data['idMembersVoted'] = idMembersVoted;
    data['idShort'] = idShort;
    data['idAttachmentCover'] = idAttachmentCover;
    data['labels'] = labels;
    data['idLabels'] = idLabels;
    data['manualCoverAttachment'] = manualCoverAttachment;
    data['name'] = name;
    data['pos'] = pos;
    data['shortLink'] = shortLink;
    data['shortUrl'] = shortUrl;
    data['start'] = start;
    data['subscribed'] = subscribed;
    data['url'] = url;
    data['cover'] = cover.toJson();
    data['isTemplate'] = isTemplate;
    data['cardRole'] = cardRole;
    return data;
  }
}

class Badges {
  Badges({
    required this.attachmentsByType,
    required this.location,
    required this.votes,
    required this.viewingMemberVoted,
    required this.subscribed,
    required this.fogbugz,
    required this.checkItems,
    required this.checkItemsChecked,
    this.checkItemsEarliestDue,
    required this.comments,
    required this.attachments,
    required this.description,
    this.due,
    required this.dueComplete,
    this.start,
  });
  late final AttachmentsByType attachmentsByType;
  late final bool location;
  late final int votes;
  late final bool viewingMemberVoted;
  late final bool subscribed;
  late final String fogbugz;
  late final int checkItems;
  late final int checkItemsChecked;
  late final DateTime? checkItemsEarliestDue;
  late final int comments;
  late final int attachments;
  late final bool description;
  late final DateTime? due;
  late final bool dueComplete;
  late final DateTime? start;

  Badges.fromJson(Map<String, dynamic> json) {
    attachmentsByType = AttachmentsByType.fromJson(json['attachmentsByType']);
    location = json['location'];
    votes = json['votes'];
    viewingMemberVoted = json['viewingMemberVoted'];
    subscribed = json['subscribed'];
    fogbugz = json['fogbugz'];
    checkItems = json['checkItems'];
    checkItemsChecked = json['checkItemsChecked'];
    checkItemsEarliestDue = null;
    comments = json['comments'];
    attachments = json['attachments'];
    description = json['description'];
    due = null;
    dueComplete = json['dueComplete'];
    start = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['attachmentsByType'] = attachmentsByType.toJson();
    data['location'] = location;
    data['votes'] = votes;
    data['viewingMemberVoted'] = viewingMemberVoted;
    data['subscribed'] = subscribed;
    data['fogbugz'] = fogbugz;
    data['checkItems'] = checkItems;
    data['checkItemsChecked'] = checkItemsChecked;
    data['checkItemsEarliestDue'] = checkItemsEarliestDue;
    data['comments'] = comments;
    data['attachments'] = attachments;
    data['description'] = description;
    data['due'] = due;
    data['dueComplete'] = dueComplete;
    data['start'] = start;
    return data;
  }
}

class AttachmentsByType {
  AttachmentsByType({
    required this.trello,
  });
  late final Trello trello;

  AttachmentsByType.fromJson(Map<String, dynamic> json) {
    trello = Trello.fromJson(json['trello']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['trello'] = trello.toJson();
    return data;
  }
}

class Trello {
  Trello({
    required this.board,
    required this.card,
  });
  late final int board;
  late final int card;

  Trello.fromJson(Map<String, dynamic> json) {
    board = json['board'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['board'] = board;
    data['card'] = card;
    return data;
  }
}

class CheckItemStates {
  CheckItemStates({
    required this.idCheckItem,
    required this.state,
  });
  late final String idCheckItem;
  late final String state;

  CheckItemStates.fromJson(Map<String, dynamic> json) {
    idCheckItem = json['idCheckItem'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idCheckItem'] = idCheckItem;
    data['state'] = state;
    return data;
  }
}

class DescData {
  DescData({
    required this.emoji,
  });
  late final Emoji emoji;

  DescData.fromJson(Map<String, dynamic> json) {
    emoji = Emoji.fromJson(json['emoji']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['emoji'] = emoji.toJson();
    return data;
  }
}

class Emoji {
  Emoji();

  Emoji.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}

class Cover {
  Cover({
    this.idAttachment,
    this.color,
    this.idUploadedBackground,
    required this.size,
    required this.brightness,
    this.idPlugin,
  });
  late final String? idAttachment;
  late final String? color;
  late final String? idUploadedBackground;
  late final String size;
  late final String brightness;
  late final String? idPlugin;

  Cover.fromJson(Map<String, dynamic> json) {
    idAttachment = null;
    color = null;
    idUploadedBackground = null;
    size = json['size'];
    brightness = json['brightness'];
    idPlugin = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['idAttachment'] = idAttachment;
    data['color'] = color;
    data['idUploadedBackground'] = idUploadedBackground;
    data['size'] = size;
    data['brightness'] = brightness;
    data['idPlugin'] = idPlugin;
    return data;
  }
}
