class SearchResultEntity {
  late int total;
  late List<SearchResultSubject> subjects;
  late int count;
  late int start;
  late String title;

  SearchResultEntity(
      {required this.total,
      required this.subjects,
      required this.count,
      required this.start,
      required this.title});

  SearchResultEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['subjects'] != null) {
      // ignore: deprecated_member_use
      subjects = <SearchResultSubject>[];
      json['subjects'].forEach((v) {
        subjects.add(new SearchResultSubject.fromJson(v));
      });
    }
    count = json['count'];
    start = json['start'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['start'] = this.start;
    data['title'] = this.title;
    return data;
  }
}

class SearchResultSubject {
  late SearchResultSubjectsImages? images;
  late String originalTitle;
  late String year;
  late List<SearchResultSubjectsDirector>? directors;
  late SearchResultSubjectsRating? rating;
  late String alt;
  late String title;
  late int collectCount;
  late bool hasVideo;
  late List<String> pubdates;
  late List<SearchResultSubjectsCast> casts;
  late String subtype;
  late List<String> genres;
  late List<String> durations;
  late String mainlandPubdate;
  late String id;
  SearchResultSubject(
      {this.images,
      required this.originalTitle,
      required this.year,
      this.directors,
      required this.rating,
      required this.alt,
      required this.title,
      required this.collectCount,
      required this.hasVideo,
      required this.pubdates,
      required this.casts,
      required this.subtype,
      required this.genres,
      required this.durations,
      required this.mainlandPubdate,
      required this.id});

  SearchResultSubject.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null
        ? new SearchResultSubjectsImages.fromJson(json['images'])
        : null;
    originalTitle = json['original_title'];
    year = json['year'];
    if (json['directors'] != null) {
      // ignore: deprecated_member_use
      directors = <SearchResultSubjectsDirector>[];
      json['directors'].forEach((v) {
        directors?.add(new SearchResultSubjectsDirector.fromJson(v));
      });
    }
    rating = json['rating'] != null
        ? new SearchResultSubjectsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    title = json['title'];
    collectCount = json['collect_count'];
    hasVideo = json['has_video'];
    pubdates = json['pubdates'].cast<String>();
    if (json['casts'] != null) {
      casts = <SearchResultSubjectsCast>[];
      json['casts'].forEach((v) {
        casts.add(new SearchResultSubjectsCast.fromJson(v));
      });
    }
    subtype = json['subtype'];
    genres = json['genres'].cast<String>();
    durations = json['durations'].cast<String>();
    mainlandPubdate = json['mainland_pubdate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images?.toJson();
    }
    data['original_title'] = this.originalTitle;
    data['year'] = this.year;
    if (this.directors != null) {
      data['directors'] = this.directors?.map((v) => v.toJson()).toList();
    }
    if (this.rating != null) {
      data['rating'] = this.rating?.toJson();
    }
    data['alt'] = this.alt;
    data['title'] = this.title;
    data['collect_count'] = this.collectCount;
    data['has_video'] = this.hasVideo;
    data['pubdates'] = this.pubdates;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    data['durations'] = this.durations;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['id'] = this.id;
    return data;
  }
}

class SearchResultSubjectsImages {
  String? small;
  String? large;
  String? medium;

  SearchResultSubjectsImages({this.small, this.large, this.medium});

  SearchResultSubjectsImages.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class SearchResultSubjectsDirector {
  var name;
  var alt;
  var id;
  var avatars;
  var nameEn;

  SearchResultSubjectsDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  SearchResultSubjectsDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['avatars'] = this.avatars;
    data['name_en'] = this.nameEn;
    return data;
  }
}

class SearchResultSubjectsRating {
  var average;
  var min;
  var max;
  SearchResultSubjectsRatingDetails? details;
  String? stars;

  SearchResultSubjectsRating(
      {this.average, this.min, this.max, this.details, this.stars});

  SearchResultSubjectsRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new SearchResultSubjectsRatingDetails.fromJson(json['details'])
        : null;
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['min'] = this.min;
    data['max'] = this.max;
    if (this.details != null) {
      data['details'] = this.details?.toJson();
    }
    data['stars'] = this.stars;
    return data;
  }
}

class SearchResultSubjectsRatingDetails {
  var d1;
  var d2;
  var d3;
  var d4;
  var d5;

  SearchResultSubjectsRatingDetails(
      {this.d1, this.d2, this.d3, this.d4, this.d5});

  SearchResultSubjectsRatingDetails.fromJson(Map<String, dynamic> json) {
    d1 = json['1'];
    d2 = json['2'];
    d3 = json['3'];
    d4 = json['4'];
    d5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.d1;
    data['2'] = this.d2;
    data['3'] = this.d3;
    data['4'] = this.d4;
    data['5'] = this.d5;
    return data;
  }
}

class SearchResultSubjectsCast {
  String? name;
  var alt;
  var id;
  var avatars;
  String? nameEn;

  SearchResultSubjectsCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  SearchResultSubjectsCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['avatars'] = this.avatars;
    data['name_en'] = this.nameEn;
    return data;
  }
}
