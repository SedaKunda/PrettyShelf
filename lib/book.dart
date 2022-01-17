class Book {
  List<String>? publishers;
  int? numberOfPages;
  String? weight;
  String? physicalFormat;
  String? key;
  List<KeyString>? authors;
  List<String>? subjects;
  List<KeyString>? languages;
  String title = '';
  String? subtitle;
  String? fullTitle;
  Identifiers? identifiers;
  List<String>? isbn13;
  List<String>? isbn10;
  String? publishDate;
  List<String>? oclcNumbers;
  List<KeyString>? works;
  KeyString? type;
  String? physicalDimensions;
  List<int>? covers;
  String? ocaid;
  List<String>? lccn;
  List<String>? lcClassifications;
  List<String>? sourceRecords;
  int? latestRevision;
  int? revision;
  Created? created;
  Created? lastModified;

  Book(
      {this.publishers,
      this.numberOfPages,
      this.weight,
      this.physicalFormat,
      this.key,
      this.authors,
      this.subjects,
      this.languages,
      required this.title,
      this.identifiers,
      this.subtitle,
      this.fullTitle,
      this.isbn13,
      this.isbn10,
      this.publishDate,
      this.oclcNumbers,
      this.works,
      this.type,
      this.physicalDimensions,
      this.covers,
      this.ocaid,
      this.lccn,
      this.lcClassifications,
      this.sourceRecords,
      this.latestRevision,
      this.revision,
      this.created,
      this.lastModified});

  Book.fromJson(Map<String, dynamic> json) {
    publishers = json['publishers']?.cast<String>();
    numberOfPages = json['number_of_pages'];
    weight = json['weight'];
    physicalFormat = json['physical_format'];
    key = json['key'];
    if (json['authors'] != null) {
      authors = <KeyString>[];
      json['authors'].forEach((v) {
        authors!.add(KeyString.fromJson(v));
      });
    }
    subjects = json['subjects']?.cast<String>();
    if (json['languages'] != null) {
      languages = <KeyString>[];
      json['languages'].forEach((v) {
        languages!.add(KeyString.fromJson(v));
      });
    }
    title = json['title'];
    subtitle = json['subtitle'];
    fullTitle = json['full_title'];
    identifiers = json['identifiers'] != null ? Identifiers.fromJson(json['identifiers']) : null;
    isbn13 = json['isbn_13']?.cast<String>();
    isbn10 = json['isbn_10']?.cast<String>();
    publishDate = json['publish_date'];
    oclcNumbers = json['oclc_numbers']?.cast<String>();
    if (json['works'] != null) {
      works = <KeyString>[];
      json['works'].forEach((v) {
        works!.add(KeyString.fromJson(v));
      });
    }
    type = json['type'] != null ? KeyString.fromJson(json['type']) : null;
    physicalDimensions = json['physical_dimensions'];
    covers = json['covers']?.cast<int>();
    ocaid = json['ocaid'];
    lccn = json['lccn']?.cast<String>();
    lcClassifications = json['lc_classifications']?.cast<String>();
    sourceRecords = json['source_records']?.cast<String>();
    latestRevision = json['latest_revision'];
    revision = json['revision'];
    created = json['created'] != null ? Created.fromJson(json['created']) : null;
    lastModified = json['last_modified'] != null ? Created.fromJson(json['last_modified']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['publishers'] = publishers;
    data['number_of_pages'] = numberOfPages;
    data['weight'] = weight;
    data['physical_format'] = physicalFormat;
    data['key'] = key;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    data['subjects'] = subjects;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['full_title'] = fullTitle;
    if (identifiers != null) {
      data['identifiers'] = identifiers!.toJson();
    }
    data['isbn_13'] = isbn13;
    data['isbn_10'] = isbn10;
    data['publish_date'] = publishDate;
    data['oclc_numbers'] = oclcNumbers;
    if (works != null) {
      data['works'] = works!.map((v) => v.toJson()).toList();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['physical_dimensions'] = physicalDimensions;
    data['covers'] = covers;
    data['ocaid'] = ocaid;
    data['lccn'] = lccn;
    data['lc_classifications'] = lcClassifications;
    data['source_records'] = sourceRecords;
    data['latest_revision'] = latestRevision;
    data['revision'] = revision;
    if (created != null) {
      data['created'] = created!.toJson();
    }
    if (lastModified != null) {
      data['last_modified'] = lastModified!.toJson();
    }
    return data;
  }
}

class KeyString {
  String? key;

  KeyString({this.key});

  KeyString.fromJson(Map<String, dynamic> json) {
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    return data;
  }
}

class Identifiers {
  List<String>? librarything;
  List<String>? goodreads;

  Identifiers({this.librarything, this.goodreads});

  Identifiers.fromJson(Map<String, dynamic> json) {
    librarything = json['librarything']?.cast<String>();
    goodreads = json['goodreads']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['librarything'] = librarything;
    data['goodreads'] = goodreads;
    return data;
  }
}

class Created {
  String? type;
  String? value;

  Created({this.type, this.value});

  Created.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    return data;
  }
}
