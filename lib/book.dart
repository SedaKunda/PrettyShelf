import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  List<String>? publishers;

  @JsonKey(name: 'number_of_pages')
  int? numberOfPages;

  String? weight;

  @JsonKey(name: 'physical_format')
  String? physicalFormat;

  String? key;

  List<KeyString>? authors;

  List<String>? subjects;

  List<KeyString>? languages;

  @JsonKey(required: true)
  String title = '';

  @JsonKey(defaultValue: '')
  String? subtitle;

  @JsonKey(defaultValue: '', name: 'full_title')
  String? fullTitle;

  Identifiers? identifiers;

  @JsonKey(defaultValue: '', name: 'isbn_13')
  List<String>? isbn13;

  @JsonKey(defaultValue: '', name: 'isbn_10')
  List<String>? isbn10;

  @JsonKey(name: 'publish_date')
  String? publishDate;

  @JsonKey(name: 'oclc_numbers')
  List<String>? oclcNumbers;

  List<KeyString>? works;

  KeyString? type;

  @JsonKey(name: 'physical_dimensions')
  String? physicalDimensions;

  @JsonKey(defaultValue: 0)
  List<int>? covers;

  String? ocaid;

  @JsonKey(defaultValue: '')
  List<String>? lccn;

  @JsonKey(defaultValue: '', name: 'lc_classifications')
  List<String>? lcClassifications;

  @JsonKey(defaultValue: '', name: 'source_records')
  List<String>? sourceRecords;

  @JsonKey(name: 'latest_revision')
  int? latestRevision;

  int? revision;

  Created? created;

  @JsonKey(name: 'last_modified')
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

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
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
