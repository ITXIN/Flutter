// import 'dart:convert' show json;

// ///影视条目详情
// class MovieDetailBean {
//   bool? collection;
//   String? current_season;
//   var do_count;
//   var episodes_count;
//   var seasons_count;
//   var collect_count;
//   var comments_count;
//   var photos_count;
//   var ratings_count;
//   var reviews_count;
//   var wish_count;
//   bool? has_schedule;
//   bool? has_ticket;
//   bool? has_video;
//   String? alt;
//   String? douban_site;
//   String? id;
//   String? mainland_pubdate;
//   String? mobile_url;
//   String? original_title;
//   String? pubdate;
//   String? schedule_url;
//   String? share_url;
//   String? subtype;
//   String? summary;
//   String? title;
//   String? website;
//   String? year;
//   List<String>? aka;
//   List<String>? blooper_urls;
//   List<Blooper>? bloopers;
//   List<Cast>? casts;
//   List<dynamic>? clip_urls;
//   List<dynamic>? clips;
//   List<String>? countries;
//   List<Director>? directors;
//   List<String>? durations;
//   List<String>? genres;
//   List<String>? languages;
//   List<Photo>? photos;
//   List<PopularComment>? popular_comments;
//   List<PopularReview>? popular_reviews;
//   List<String>? pubdates;
//   List<String>? tags;
//   List<String>? trailer_urls;
//   List<Blooper>? trailers;
//   List<dynamic>? videos;
//   List<Writer>? writers;
//   _Image? images;
//   Rating? rating;

//   MovieDetailBean.fromParams(
//       {this.collection,
//       this.current_season,
//       this.do_count,
//       this.episodes_count,
//       this.seasons_count,
//       this.collect_count,
//       this.comments_count,
//       this.photos_count,
//       this.ratings_count,
//       this.reviews_count,
//       this.wish_count,
//       this.has_schedule,
//       this.has_ticket,
//       this.has_video,
//       this.alt,
//       this.douban_site,
//       this.id,
//       this.mainland_pubdate,
//       this.mobile_url,
//       this.original_title,
//       this.pubdate,
//       this.schedule_url,
//       this.share_url,
//       this.subtype,
//       this.summary,
//       this.title,
//       this.website,
//       this.year,
//       this.aka,
//       this.blooper_urls,
//       this.bloopers,
//       this.casts,
//       this.clip_urls,
//       this.clips,
//       this.countries,
//       this.directors,
//       this.durations,
//       this.genres,
//       this.languages,
//       this.photos,
//       this.popular_comments,
//       this.popular_reviews,
//       this.pubdates,
//       this.tags,
//       this.trailer_urls,
//       this.trailers,
//       this.videos,
//       this.writers,
//       this.images,
//       this.rating});

//   // factory MovieDetailBean(jsonStr) => jsonStr == null
//   //     ? null
//   //     : jsonStr is String
//   //         ? new MovieDetailBean.fromJson(json.decode(jsonStr))
//   //         : new MovieDetailBean.fromJson(jsonStr) ?? MovieDetailBean();

//   MovieDetailBean.fromJson(jsonRes) {
//     collection = jsonRes['collection'];
//     current_season = jsonRes['current_season'];
//     do_count = jsonRes['do_count'];
//     episodes_count = jsonRes['episodes_count'];
//     seasons_count = jsonRes['seasons_count'];
//     collect_count = jsonRes['collect_count'];
//     comments_count = jsonRes['comments_count'];
//     photos_count = jsonRes['photos_count'];
//     ratings_count = jsonRes['ratings_count'];
//     reviews_count = jsonRes['reviews_count'];
//     wish_count = jsonRes['wish_count'];
//     has_schedule = jsonRes['has_schedule'];
//     has_ticket = jsonRes['has_ticket'];
//     has_video = jsonRes['has_video'];
//     alt = jsonRes['alt'];
//     douban_site = jsonRes['douban_site'];
//     id = jsonRes['id'];
//     mainland_pubdate = jsonRes['mainland_pubdate'];
//     mobile_url = jsonRes['mobile_url'];
//     original_title = jsonRes['original_title'];
//     pubdate = jsonRes['pubdate'];
//     schedule_url = jsonRes['schedule_url'];
//     share_url = jsonRes['share_url'];
//     subtype = jsonRes['subtype'];
//     summary = jsonRes['summary'];
//     title = jsonRes['title'];
//     website = jsonRes['website'];
//     year = jsonRes['year'];
//     aka = jsonRes['aka'] == null ? null : [];

//     for (var akaItem in aka == null ? [] : jsonRes['aka']) {
//       aka?.add(akaItem);
//     }

//     blooper_urls = jsonRes['blooper_urls'] == null ? null : [];

//     for (var blooper_urlsItem
//         in blooper_urls == null ? [] : jsonRes['blooper_urls']) {
//       blooper_urls?.add(blooper_urlsItem);
//     }

//     bloopers = jsonRes['bloopers'] == null ? null : [];

//     for (var bloopersItem in bloopers == null ? [] : jsonRes['bloopers']) {
//       bloopers?.add(
//           bloopersItem == null ? null : new Blooper.fromJson(bloopersItem));
//     }

//     casts = jsonRes['casts'] == null ? null : [];

//     for (var castsItem in casts == null ? [] : jsonRes['casts']) {
//       casts?.add(castsItem == null ? null : new Cast.fromJson(castsItem));
//     }

//     clip_urls = jsonRes['clip_urls'] == null ? null : [];

//     for (var clip_urlsItem in clip_urls == null ? [] : jsonRes['clip_urls']) {
//       clip_urls?.add(clip_urlsItem);
//     }

//     clips = jsonRes['clips'] == null ? null : [];

//     for (var clipsItem in clips == null ? [] : jsonRes['clips']) {
//       clips?.add(clipsItem);
//     }

//     countries = jsonRes['countries'] == null ? null : [];

//     for (var countriesItem in countries == null ? [] : jsonRes['countries']) {
//       countries?.add(countriesItem);
//     }

//     directors = jsonRes['directors'] == null ? null : [];

//     for (var directorsItem in directors == null ? [] : jsonRes['directors']) {
//       directors?.add(
//           directorsItem == null ? null : new Director.fromJson(directorsItem));
//     }

//     durations = jsonRes['durations'] == null ? null : [];

//     for (var durationsItem in durations == null ? [] : jsonRes['durations']) {
//       durations?.add(durationsItem);
//     }

//     genres = jsonRes['genres'] == null ? null : [];

//     for (var genresItem in genres == null ? [] : jsonRes['genres']) {
//       genres?.add(genresItem);
//     }

//     languages = jsonRes['languages'] == null ? null : [];

//     for (var languagesItem in languages == null ? [] : jsonRes['languages']) {
//       languages?.add(languagesItem);
//     }

//     photos = jsonRes['photos'] == null ? null : [];

//     for (var photosItem in photos == null ? [] : jsonRes['photos']) {
//       photos?.add(photosItem == null ? null : new Photo.fromJson(photosItem));
//     }

//     popular_comments = jsonRes['popular_comments'] == null ? null : [];

//     for (var popular_commentsItem
//         in popular_comments == null ? [] : jsonRes['popular_comments']) {
//       popular_comments?.add(popular_commentsItem == null
//           ? null
//           : new PopularComment.fromJson(popular_commentsItem));
//     }

//     popular_reviews = jsonRes['popular_reviews'] == null ? null : [];

//     for (var popular_reviewsItem
//         in popular_reviews == null ? [] : jsonRes['popular_reviews']) {
//       popular_reviews?.add(popular_reviewsItem == null
//           ? null
//           : new PopularReview.fromJson(popular_reviewsItem));
//     }

//     pubdates = jsonRes['pubdates'] == null ? null : [];

//     for (var pubdatesItem in pubdates == null ? [] : jsonRes['pubdates']) {
//       pubdates?.add(pubdatesItem);
//     }

//     tags = jsonRes['tags'] == null ? null : [];

//     for (var tagsItem in tags == null ? [] : jsonRes['tags']) {
//       tags?.add(tagsItem);
//     }

//     trailer_urls = jsonRes['trailer_urls'] == null ? null : [];

//     for (var trailer_urlsItem
//         in trailer_urls == null ? [] : jsonRes['trailer_urls']) {
//       trailer_urls?.add(trailer_urlsItem);
//     }

//     trailers = jsonRes['trailers'] == null ? null : [];

//     for (var trailersItem in trailers == null ? [] : jsonRes['trailers']) {
//       trailers?.add(
//           trailersItem == null ? null : new Blooper.fromJson(trailersItem));
//     }

//     videos = jsonRes['videos'] == null ? null : [];

//     for (var videosItem in videos == null ? [] : jsonRes['videos']) {
//       videos?.add(videosItem);
//     }

//     writers = jsonRes['writers'] == null ? null : [];

//     for (var writersItem in writers == null ? [] : jsonRes['writers']) {
//       writers
//           ?.add(writersItem == null ? null : new Writer.fromJson(writersItem));
//     }

//     images = jsonRes['images'] == null
//         ? null
//         : new _Image.fromJson(jsonRes['images']);
//     rating = jsonRes['rating'] == null
//         ? null
//         : new Rating.fromJson(jsonRes['rating']);
//   }

//   @override
//   String toString() {
//     return '{"collection": $collection,"current_season": ${current_season != null ? '${json.encode(current_season)}' : 'null'},"do_count": $do_count,"episodes_count": $episodes_count,"seasons_count": $seasons_count,"collect_count": $collect_count,"comments_count": $comments_count,"photos_count": $photos_count,"ratings_count": $ratings_count,"reviews_count": $reviews_count,"wish_count": $wish_count,"has_schedule": $has_schedule,"has_ticket": $has_ticket,"has_video": $has_video,"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"douban_site": ${douban_site != null ? '${json.encode(douban_site)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"mainland_pubdate": ${mainland_pubdate != null ? '${json.encode(mainland_pubdate)}' : 'null'},"mobile_url": ${mobile_url != null ? '${json.encode(mobile_url)}' : 'null'},"original_title": ${original_title != null ? '${json.encode(original_title)}' : 'null'},"pubdate": ${pubdate != null ? '${json.encode(pubdate)}' : 'null'},"schedule_url": ${schedule_url != null ? '${json.encode(schedule_url)}' : 'null'},"share_url": ${share_url != null ? '${json.encode(share_url)}' : 'null'},"subtype": ${subtype != null ? '${json.encode(subtype)}' : 'null'},"summary": ${summary != null ? '${json.encode(summary)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"website": ${website != null ? '${json.encode(website)}' : 'null'},"year": ${year != null ? '${json.encode(year)}' : 'null'},"aka": $aka,"blooper_urls": $blooper_urls,"bloopers": $bloopers,"casts": $casts,"clip_urls": $clip_urls,"clips": $clips,"countries": $countries,"directors": $directors,"durations": $durations,"genres": $genres,"languages": $languages,"photos": $photos,"popular_comments": $popular_comments,"popular_reviews": $popular_reviews,"pubdates": $pubdates,"tags": $tags,"trailer_urls": $trailer_urls,"trailers": $trailers,"videos": $videos,"writers": $writers,"images": $images,"rating": $rating}';
//   }
// }

// class Rating {
//   var max;
//   var min;
//   var average;
//   String? stars;
//   RatingDetails? details;

//   Rating.fromParams(
//       {this.max, this.min, this.average, this.stars, this.details});

//   Rating.fromJson(jsonRes) {
//     max = jsonRes['max'];
//     min = jsonRes['min'];
//     average = jsonRes['average'];
//     stars = jsonRes['stars'];
//     details = jsonRes['details'] == null
//         ? null
//         : new RatingDetails.fromJson(jsonRes['details']);
//   }

//   @override
//   String toString() {
//     return '{"max": $max,"min": $min,"average": $average,"stars": ${stars != null ? '${json.encode(stars)}' : 'null'},"details": $details}';
//   }
// }

// class RatingDetails {
//   var d1;
//   var d2;
//   var d3;
//   var d4;
//   var d5;

//   RatingDetails.fromParams({this.d1, this.d2, this.d3, this.d4, this.d5});

//   RatingDetails.fromJson(jsonRes) {
//     d1 = jsonRes['1'];
//     d2 = jsonRes['2'];
//     d3 = jsonRes['3'];
//     d4 = jsonRes['4'];
//     d5 = jsonRes['5'];
//   }

//   @override
//   String toString() {
//     return '{"1": $d1,"2": $d2,"3": $d3,"4": $d4,"5": $d5}';
//   }
// }

// class _Image {
//   String? large;
//   String? medium;
//   String? small;

//   _Image.fromParams({this.large, this.medium, this.small});

//   _Image.fromJson(jsonRes) {
//     large = jsonRes['large'];
//     medium = jsonRes['medium'];
//     small = jsonRes['small'];
//   }

//   @override
//   String toString() {
//     return '{"large": ${large != null ? '${json.encode(large)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'}}';
//   }
// }

// class Writer {
//   String? alt;
//   String? id;
//   String? name;
//   String? name_en;
//   WriterAvatars? avatars;

//   Writer.fromParams({this.alt, this.id, this.name, this.name_en, this.avatars});

//   Writer.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     id = jsonRes['id'];
//     name = jsonRes['name'];
//     name_en = jsonRes['name_en'];
//     avatars = jsonRes['avatars'] == null
//         ? null
//         : new WriterAvatars.fromJson(jsonRes['avatars']);
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"name_en": ${name_en != null ? '${json.encode(name_en)}' : 'null'},"avatars": $avatars}';
//   }
// }

// class WriterAvatars {
//   String? large;
//   String? medium;
//   String? small;

//   WriterAvatars.fromParams({this.large, this.medium, this.small});

//   WriterAvatars.fromJson(jsonRes) {
//     large = jsonRes['large'];
//     medium = jsonRes['medium'];
//     small = jsonRes['small'];
//   }

//   @override
//   String toString() {
//     return '{"large": ${large != null ? '${json.encode(large)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'}}';
//   }
// }

// //class Trailer {
// //
// //  String alt;
// //  String id;
// //  String medium;
// //  String resource_url;
// //  String small;
// //  String subject_id;
// //  String title;
// //
// //  Trailer.fromParams({this.alt, this.id, this.medium, this.resource_url, this.small, this.subject_id, this.title});
// //
// //  Trailer.fromJson(jsonRes) {
// //    alt = jsonRes['alt'];
// //    id = jsonRes['id'];
// //    medium = jsonRes['medium'];
// //    resource_url = jsonRes['resource_url'];
// //    small = jsonRes['small'];
// //    subject_id = jsonRes['subject_id'];
// //    title = jsonRes['title'];
// //  }
// //
// //  @override
// //  String toString() {
// //    return '{"alt": ${alt != null?'${json.encode(alt)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"medium": ${medium != null?'${json.encode(medium)}':'null'},"resource_url": ${resource_url != null?'${json.encode(resource_url)}':'null'},"small": ${small != null?'${json.encode(small)}':'null'},"subject_id": ${subject_id != null?'${json.encode(subject_id)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
// //  }
// //}

// class PopularReview {
//   String? alt;
//   String? id;
//   String? subject_id;
//   String? summary;
//   String? title;
//   PopularReviewAuthor? author;
//   PopularReviewRating? rating;

//   PopularReview.fromParams(
//       {this.alt,
//       this.id,
//       this.subject_id,
//       this.summary,
//       this.title,
//       this.author,
//       this.rating});

//   PopularReview.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     id = jsonRes['id'];
//     subject_id = jsonRes['subject_id'];
//     summary = jsonRes['summary'];
//     title = jsonRes['title'];
//     author = jsonRes['author'] == null
//         ? null
//         : new PopularReviewAuthor.fromJson(jsonRes['author']);
//     rating = jsonRes['rating'] == null
//         ? null
//         : new PopularReviewRating.fromJson(jsonRes['rating']);
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"subject_id": ${subject_id != null ? '${json.encode(subject_id)}' : 'null'},"summary": ${summary != null ? '${json.encode(summary)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'},"author": $author,"rating": $rating}';
//   }
// }

// class PopularReviewRating {
//   var max;
//   var min;
//   var value;

//   PopularReviewRating.fromParams({this.max, this.min, this.value});

//   PopularReviewRating.fromJson(jsonRes) {
//     max = jsonRes['max'];
//     min = jsonRes['min'];
//     value = jsonRes['value'];
//   }

//   @override
//   String toString() {
//     return '{"max": $max,"min": $min,"value": $value}';
//   }
// }

// class PopularReviewAuthor {
//   String? alt;
//   String? avatar;
//   String? id;
//   String? name;
//   String? signature;
//   String? uid;

//   PopularReviewAuthor.fromParams(
//       {this.alt, this.avatar, this.id, this.name, this.signature, this.uid});

//   PopularReviewAuthor.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     avatar = jsonRes['avatar'];
//     id = jsonRes['id'];
//     name = jsonRes['name'];
//     signature = jsonRes['signature'];
//     uid = jsonRes['uid'];
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"signature": ${signature != null ? '${json.encode(signature)}' : 'null'},"uid": ${uid != null ? '${json.encode(uid)}' : 'null'}}';
//   }
// }

// class PopularComment {
//   var useful_count;
//   String? content;
//   String? created_at;
//   String? id;
//   String? subject_id;
//   PopularCommentAuthor? author;
//   PopularCommentRating? rating;

//   PopularComment.fromParams(
//       {this.useful_count,
//       this.content,
//       this.created_at,
//       this.id,
//       this.subject_id,
//       this.author,
//       this.rating});

//   PopularComment.fromJson(jsonRes) {
//     useful_count = jsonRes['useful_count'];
//     content = jsonRes['content'];
//     created_at = jsonRes['created_at'];
//     id = jsonRes['id'];
//     subject_id = jsonRes['subject_id'];
//     author = jsonRes['author'] == null
//         ? null
//         : new PopularCommentAuthor.fromJson(jsonRes['author']);
//     rating = jsonRes['rating'] == null
//         ? null
//         : new PopularCommentRating.fromJson(jsonRes['rating']);
//   }

//   @override
//   String toString() {
//     return '{"useful_count": $useful_count,"content": ${content != null ? '${json.encode(content)}' : 'null'},"created_at": ${created_at != null ? '${json.encode(created_at)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"subject_id": ${subject_id != null ? '${json.encode(subject_id)}' : 'null'},"author": $author,"rating": $rating}';
//   }
// }

// class PopularCommentRating {
//   var max;
//   var min;
//   var value;

//   PopularCommentRating.fromParams({this.max, this.min, this.value});

//   PopularCommentRating.fromJson(jsonRes) {
//     max = jsonRes['max'];
//     min = jsonRes['min'];
//     value = jsonRes['value'];
//   }

//   @override
//   String toString() {
//     return '{"max": $max,"min": $min,"value": $value}';
//   }
// }

// class PopularCommentAuthor {
//   String? alt;
//   String? avatar;
//   String? id;
//   String? name;
//   String? signature;
//   String? uid;

//   PopularCommentAuthor.fromParams(
//       {this.alt, this.avatar, this.id, this.name, this.signature, this.uid});

//   PopularCommentAuthor.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     avatar = jsonRes['avatar'];
//     id = jsonRes['id'];
//     name = jsonRes['name'];
//     signature = jsonRes['signature'];
//     uid = jsonRes['uid'];
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"avatar": ${avatar != null ? '${json.encode(avatar)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"signature": ${signature != null ? '${json.encode(signature)}' : 'null'},"uid": ${uid != null ? '${json.encode(uid)}' : 'null'}}';
//   }
// }

// class Photo {
//   String? alt;
//   String? cover;
//   String? icon;
//   String? id;
//   String? image;
//   String? thumb;

//   Photo.fromParams(
//       {this.alt, this.cover, this.icon, this.id, this.image, this.thumb});

//   Photo.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     cover = jsonRes['cover'];
//     icon = jsonRes['icon'];
//     id = jsonRes['id'];
//     image = jsonRes['image'];
//     thumb = jsonRes['thumb'];
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"cover": ${cover != null ? '${json.encode(cover)}' : 'null'},"icon": ${icon != null ? '${json.encode(icon)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"image": ${image != null ? '${json.encode(image)}' : 'null'},"thumb": ${thumb != null ? '${json.encode(thumb)}' : 'null'}}';
//   }
// }

// class Director {
//   String? alt;
//   String? id;
//   String? name;
//   String? name_en;
//   DirectorAvatars? avatars;

//   Director.fromParams(
//       {this.alt, this.id, this.name, this.name_en, this.avatars});

//   Director.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     id = jsonRes['id'];
//     name = jsonRes['name'];
//     name_en = jsonRes['name_en'];
//     avatars = jsonRes['avatars'] == null
//         ? null
//         : new DirectorAvatars.fromJson(jsonRes['avatars']);
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"name_en": ${name_en != null ? '${json.encode(name_en)}' : 'null'},"avatars": $avatars}';
//   }
// }

// class DirectorAvatars {
//   String? large;
//   String? medium;
//   String? small;

//   DirectorAvatars.fromParams({this.large, this.medium, this.small});

//   DirectorAvatars.fromJson(jsonRes) {
//     large = jsonRes['large'];
//     medium = jsonRes['medium'];
//     small = jsonRes['small'];
//   }

//   @override
//   String toString() {
//     return '{"large": ${large != null ? '${json.encode(large)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'}}';
//   }
// }

// class Cast {
//   String? alt;
//   String? id;
//   String? name;
//   String? name_en;
//   CastAvatars? avatars;

//   Cast.fromParams({this.alt, this.id, this.name, this.name_en, this.avatars});

//   Cast.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     id = jsonRes['id'];
//     name = jsonRes['name'];
//     name_en = jsonRes['name_en'];
//     avatars = jsonRes['avatars'] == null
//         ? null
//         : new CastAvatars.fromJson(jsonRes['avatars']);
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"name": ${name != null ? '${json.encode(name)}' : 'null'},"name_en": ${name_en != null ? '${json.encode(name_en)}' : 'null'},"avatars": $avatars}';
//   }
// }

// class CastAvatars {
//   String? large;
//   String? medium;
//   String? small;

//   CastAvatars.fromParams({this.large, this.medium, this.small});

//   CastAvatars.fromJson(jsonRes) {
//     large = jsonRes['large'];
//     medium = jsonRes['medium'];
//     small = jsonRes['small'];
//   }

//   @override
//   String toString() {
//     return '{"large": ${large != null ? '${json.encode(large)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'}}';
//   }
// }

// class Blooper {
//   String? alt;
//   String? id;
//   String? medium;
//   String? resource_url;
//   String? small;
//   String? subject_id;
//   String? title;

//   Blooper.fromParams(
//       {this.alt,
//       this.id,
//       this.medium,
//       this.resource_url,
//       this.small,
//       this.subject_id,
//       this.title});

//   Blooper.fromJson(jsonRes) {
//     alt = jsonRes['alt'];
//     id = jsonRes['id'];
//     medium = jsonRes['medium'];
//     resource_url = jsonRes['resource_url'];
//     small = jsonRes['small'];
//     subject_id = jsonRes['subject_id'];
//     title = jsonRes['title'];
//   }

//   @override
//   String toString() {
//     return '{"alt": ${alt != null ? '${json.encode(alt)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"medium": ${medium != null ? '${json.encode(medium)}' : 'null'},"resource_url": ${resource_url != null ? '${json.encode(resource_url)}' : 'null'},"small": ${small != null ? '${json.encode(small)}' : 'null'},"subject_id": ${subject_id != null ? '${json.encode(subject_id)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
//   }
// }




// //{
// //"rating":{
// //"max":10,
// //"average":8,
// //"details":{
// //"1":906,
// //"2":1806,
// //"3":8678,
// //"4":17211,
// //"5":14792
// //},
// //"stars":"40",
// //"min":0
// //},
// //"reviews_count":6975,
// //"videos":[
// //
// //],
// //"wish_count":209889,
// //"original_title":"流浪地球",
// //"blooper_urls":[
// //"http://vt1.doubanio.com/201902090910/dd9181df828eebda0ee938828c156240/view/movie/M/302420843.mp4",
// //"http://vt1.doubanio.com/201902090910/6b6a39c748dcc07231237b3417ee82d9/view/movie/M/302420770.mp4",
// //"http://vt1.doubanio.com/201902090910/c1fe01d95232489f1ae86f16ff49e2dc/view/movie/M/302420500.mp4",
// //"http://vt1.doubanio.com/201902090910/2adbf280ef6592e5e226c01a8dcef08c/view/movie/M/302410728.mp4"
// //],
// //"collect_count":405054,
// //"images":{
// //"small":"http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2545472803.webp",
// //"large":"http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2545472803.webp",
// //"medium":"http://img1.doubanio.com/view/photo/s_ratio_poster/public/p2545472803.webp"
// //},
// //"douban_site":"",
// //"year":"2019",
// //"popular_comments":[
// //{
// //"rating":{
// //"max":5,
// //"value":2,
// //"min":0
// //},
// //"useful_count":3587,
// //"author":{
// //"uid":"168391468",
// //"avatar":"http://img1.doubanio.com/icon/u168391468-1.jpg",
// //"signature":"",
// //"alt":"https://www.douban.com/people/168391468/",
// //"id":"168391468",
// //"name":"gus"
// //},
// //"subject_id":"26266893",
// //"content":"台词做作剧情薄弱没一个演员在线 无时无刻的尬笑走心台词还以为编剧是激素泛滥的中年少女 感觉看了一部战狼3 最后小女生用一篇激情澎湃的即兴小学生作文感动了全球救援队 中国梦实现了！",
// //"created_at":"2019-02-05 01:33:03",
// //"id":"1655565916"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":2,
// //"min":0
// //},
// //"useful_count":4398,
// //"author":{
// //"uid":"cheer.o",
// //"avatar":"http://img3.doubanio.com/icon/u2986042-477.jpg",
// //"signature":"如果我有仙女棒 变酷！",
// //"alt":"https://www.douban.com/people/cheer.o/",
// //"id":"2986042",
// //"name":"我是王大鹏啊！"
// //},
// //"subject_id":"26266893",
// //"content":"失望 一群聒噪的角色让人忍不住觉得地球还是毁灭了比较好",
// //"created_at":"2019-01-28 22:15:04",
// //"id":"1646667826"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":4,
// //"min":0
// //},
// //"useful_count":27973,
// //"author":{
// //"uid":"tjz230",
// //"avatar":"http://img3.doubanio.com/icon/u1005928-127.jpg",
// //"signature":"",
// //"alt":"https://www.douban.com/people/tjz230/",
// //"id":"1005928",
// //"name":"影志"
// //},
// //"subject_id":"26266893",
// //"content":"电影比预期要更恢弘磅礴，晨昏线过后的永夜、火种计划、让地球流浪、木星推动地球…等等大小设定，没想到中国也能拍这么大架构、大格局的科幻片了，而且是第一部，了不得。以前看国外科幻感觉离我们很远，这一次看到熟悉的北京大裤衩、上海东方明珠都变成零下89°冰天冻地的末世场景，既猎奇又唏嘘。虽然在剧情上有套路，对于这部中国文化背景下的科幻新生儿，鼓励多于挑剔。导演说美国人拍科幻是放弃地球、去挖掘新的人类居住地，而中国人是不放弃地球、守住家土的情怀…“希望是我们回家的唯一方向”",
// //"created_at":"2019-02-04 15:56:16",
// //"id":"1655179164"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":5,
// //"min":0
// //},
// //"useful_count":20912,
// //"author":{
// //"uid":"luzhiyu",
// //"avatar":"http://img1.doubanio.com/icon/u2866549-132.jpg",
// //"signature":"死前看大海，是每个灵魂的夙愿。",
// //"alt":"https://www.douban.com/people/luzhiyu/",
// //"id":"2866549",
// //"name":"陆支羽"
// //},
// //"subject_id":"26266893",
// //"content":"1.终于，轮到我们仰望星空。2.后启示录死亡废墟，赛博朋克地下城，以及烟波浩渺的末日想象，缔造了真正意义上的第一部国产硬科幻。3.拖着地球逃离太阳系的惊艳设定，本身便是对“家国情怀”的宏大投射，正应了刘慈欣那句“太阳死了，人还活着”。4.绝不仅仅只是电影工业巨壳下的类型尝试，始终荡涤其间的悲壮气息已然具备了史诗级质感，这是大刘的脑洞宇宙与电影创作团队精益求精造就的惊喜。5.屈楚萧很带感，演活了一个勇敢、中二又不失温情的英雄少年。6.期待能成爆款吧，这样才有机会等到更多的国产科幻电影；或许以后会出现更好的，但至今这无疑是最好的。",
// //"created_at":"2019-01-29 20:10:48",
// //"id":"1635458275"
// //}
// //],
// //"alt":"https://movie.douban.com/subject/26266893/",
// //"id":"26266893",
// //"mobile_url":"https://movie.douban.com/subject/26266893/mobile",
// //"photos_count":503,
// //"pubdate":"2019-02-05",
// //"title":"流浪地球",
// //"do_count":null,
// //"has_video":false,
// //"share_url":"http://m.douban.com/movie/subject/26266893",
// //"seasons_count":null,
// //"languages":[
// //"汉语普通话",
// //"英语",
// //"俄语",
// //"法语",
// //"日语",
// //"韩语"
// //],
// //"schedule_url":"https://movie.douban.com/subject/26266893/cinema/",
// //"writers":[
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1540714533.61.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1540714533.61.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1540714533.61.webp"
// //},
// //"name_en":"Geer Gong",
// //"name":"龚格尔",
// //"alt":"https://movie.douban.com/celebrity/1331536/",
// //"id":"1331536"
// //},
// //{
// //"avatars":{
// //"small":"http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
// //"large":"http://img1.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
// //"medium":"http://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
// //},
// //"name_en":"Dongxu Yan",
// //"name":"严东旭",
// //"alt":"https://movie.douban.com/celebrity/1395285/",
// //"id":"1395285"
// //},
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1536678787.83.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1536678787.83.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1536678787.83.webp"
// //},
// //"name_en":"Frant Gwo",
// //"name":"郭帆",
// //"alt":"https://movie.douban.com/celebrity/1276086/",
// //"id":"1276086"
// //},
// //{
// //"avatars":{
// //"small":"http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
// //"large":"http://img1.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
// //"medium":"http://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
// //},
// //"name_en":"Junce Ye",
// //"name":"叶俊策",
// //"alt":"https://movie.douban.com/celebrity/1395286/",
// //"id":"1395286"
// //},
// //{
// //"avatars":{
// //"small":"http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
// //"large":"http://img1.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
// //"medium":"http://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
// //},
// //"name_en":"Zhixue Yang",
// //"name":"杨治学",
// //"alt":"https://movie.douban.com/celebrity/1395287/",
// //"id":"1395287"
// //},
// //{
// //"avatars":{
// //"small":"http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
// //"large":"http://img1.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
// //"medium":"http://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
// //},
// //"name_en":"Ti Wu",
// //"name":"吴荑",
// //"alt":"https://movie.douban.com/celebrity/1395288/",
// //"id":"1395288"
// //},
// //{
// //"avatars":{
// //"small":"http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
// //"large":"http://img1.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
// //"medium":"http://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
// //},
// //"name_en":"Ruchang Ye",
// //"name":"叶濡畅",
// //"alt":"https://movie.douban.com/celebrity/1395289/",
// //"id":"1395289"
// //},
// //{
// //"avatars":{
// //"small":"http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png",
// //"large":"http://img1.doubanio.com/f/movie/63acc16ca6309ef191f0378faf793d1096a3e606/pics/movie/celebrity-default-large.png",
// //"medium":"http://img3.doubanio.com/f/movie/8dd0c794499fe925ae2ae89ee30cd225750457b4/pics/movie/celebrity-default-medium.png"
// //},
// //"name_en":"Jingjing Shen",
// //"name":"沈晶晶",
// //"alt":"https://movie.douban.com/celebrity/1410430/",
// //"id":"1410430"
// //},
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1545700569.12.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1545700569.12.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1545700569.12.webp"
// //},
// //"name_en":"Cixin Liu",
// //"name":"刘慈欣",
// //"alt":"https://movie.douban.com/celebrity/1326565/",
// //"id":"1326565"
// //}
// //],
// //"pubdates":[
// //"2019-02-05(中国大陆)"
// //],
// //"website":"",
// //"tags":[
// //"科幻",
// //"中国大陆",
// //"太空",
// //"灾难",
// //"小说改编",
// //"2019",
// //"人性",
// //"行星发动机",
// //"冒险",
// //"奇幻"
// //],
// //"has_schedule":true,
// //"durations":[
// //"125分钟"
// //],
// //"genres":[
// //"科幻",
// //"灾难"
// //],
// //"collection":null,
// //"trailers":[
// //{
// //"medium":"http://img1.doubanio.com/img/trailer/medium/2546089641.jpg?1548146239",
// //"title":"预告片：终极版 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/242330/",
// //"small":"http://img1.doubanio.com/img/trailer/small/2546089641.jpg?1548146239",
// //"resource_url":"http://vt1.doubanio.com/201902090910/183cf5d5ad4fe8e47af1a105739ff212/view/movie/M/302420330.mp4",
// //"id":"242330"
// //},
// //{
// //"medium":"http://img1.doubanio.com/img/trailer/medium/2547497815.jpg?",
// //"title":"预告片：希望版 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/243004/",
// //"small":"http://img1.doubanio.com/img/trailer/small/2547497815.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/b66baefd889c7469920a50c9038b7cf0/view/movie/M/302430004.mp4",
// //"id":"243004"
// //},
// //{
// //"medium":"http://img1.doubanio.com/img/trailer/medium/2545491564.jpg?",
// //"title":"预告片：父与子版 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/242036/",
// //"small":"http://img1.doubanio.com/img/trailer/small/2545491564.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/32c7149abe26ab663bfae4521d3e0b24/view/movie/M/302420036.mp4",
// //"id":"242036"
// //},
// //{
// //"medium":"http://img1.doubanio.com/img/trailer/medium/2541575783.jpg?",
// //"title":"预告片：行星发动机版 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/240174/",
// //"small":"http://img1.doubanio.com/img/trailer/small/2541575783.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/167419e47d57eb052524bc5b4a4455f8/view/movie/M/302400174.mp4",
// //"id":"240174"
// //}
// //],
// //"episodes_count":null,
// //"trailer_urls":[
// //"http://vt1.doubanio.com/201902090910/183cf5d5ad4fe8e47af1a105739ff212/view/movie/M/302420330.mp4",
// //"http://vt1.doubanio.com/201902090910/b66baefd889c7469920a50c9038b7cf0/view/movie/M/302430004.mp4",
// //"http://vt1.doubanio.com/201902090910/32c7149abe26ab663bfae4521d3e0b24/view/movie/M/302420036.mp4",
// //"http://vt1.doubanio.com/201902090910/167419e47d57eb052524bc5b4a4455f8/view/movie/M/302400174.mp4"
// //],
// //"has_ticket":true,
// //"bloopers":[
// //{
// //"medium":"http://img3.doubanio.com/img/trailer/medium/2547131348.jpg?",
// //"title":"花絮：想象力特辑 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/242843/",
// //"small":"http://img3.doubanio.com/img/trailer/small/2547131348.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/dd9181df828eebda0ee938828c156240/view/movie/M/302420843.mp4",
// //"id":"242843"
// //},
// //{
// //"medium":"http://img1.doubanio.com/img/trailer/medium/2546939991.jpg?",
// //"title":"花絮：父子特辑 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/242770/",
// //"small":"http://img1.doubanio.com/img/trailer/small/2546939991.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/6b6a39c748dcc07231237b3417ee82d9/view/movie/M/302420770.mp4",
// //"id":"242770"
// //},
// //{
// //"medium":"http://img3.doubanio.com/img/trailer/medium/2546350637.jpg?",
// //"title":"花絮 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/242500/",
// //"small":"http://img3.doubanio.com/img/trailer/small/2546350637.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/c1fe01d95232489f1ae86f16ff49e2dc/view/movie/M/302420500.mp4",
// //"id":"242500"
// //},
// //{
// //"medium":"http://img3.doubanio.com/img/trailer/medium/2544889367.jpg?",
// //"title":"花絮：意义特辑 (中文字幕)",
// //"subject_id":"26266893",
// //"alt":"https://movie.douban.com/trailer/241728/",
// //"small":"http://img3.doubanio.com/img/trailer/small/2544889367.jpg?",
// //"resource_url":"http://vt1.doubanio.com/201902090910/2adbf280ef6592e5e226c01a8dcef08c/view/movie/M/302410728.mp4",
// //"id":"241728"
// //}
// //],
// //"clip_urls":[
// //
// //],
// //"current_season":null,
// //"casts":[
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1533348792.03.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1533348792.03.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1533348792.03.webp"
// //},
// //"name_en":"Chuxiao Qu",
// //"name":"屈楚萧",
// //"alt":"https://movie.douban.com/celebrity/1359081/",
// //"id":"1359081"
// //},
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1501738155.24.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1501738155.24.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1501738155.24.webp"
// //},
// //"name_en":"Jing Wu",
// //"name":"吴京",
// //"alt":"https://movie.douban.com/celebrity/1000525/",
// //"id":"1000525"
// //},
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1540619056.43.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1540619056.43.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1540619056.43.webp"
// //},
// //"name_en":"Guangjie Li",
// //"name":"李光洁",
// //"alt":"https://movie.douban.com/celebrity/1275178/",
// //"id":"1275178"
// //},
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p45481.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p45481.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p45481.webp"
// //},
// //"name_en":"Man Tat Ng",
// //"name":"吴孟达",
// //"alt":"https://movie.douban.com/celebrity/1016771/",
// //"id":"1016771"
// //}
// //],
// //"countries":[
// //"中国大陆"
// //],
// //"mainland_pubdate":"2019-02-05",
// //"photos":[
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2546873800.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2546873800.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2546873800.webp",
// //"alt":"https://movie.douban.com/photos/photo/2546873800/",
// //"id":"2546873800",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2546873800.webp"
// //},
// //{
// //"thumb":"https://img1.doubanio.com/view/photo/m/public/p2542069917.webp",
// //"image":"https://img1.doubanio.com/view/photo/l/public/p2542069917.webp",
// //"cover":"https://img1.doubanio.com/view/photo/sqs/public/p2542069917.webp",
// //"alt":"https://movie.douban.com/photos/photo/2542069917/",
// //"id":"2542069917",
// //"icon":"https://img1.doubanio.com/view/photo/s/public/p2542069917.webp"
// //},
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2546087066.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2546087066.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2546087066.webp",
// //"alt":"https://movie.douban.com/photos/photo/2546087066/",
// //"id":"2546087066",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2546087066.webp"
// //},
// //{
// //"thumb":"https://img1.doubanio.com/view/photo/m/public/p2547382848.webp",
// //"image":"https://img1.doubanio.com/view/photo/l/public/p2547382848.webp",
// //"cover":"https://img1.doubanio.com/view/photo/sqs/public/p2547382848.webp",
// //"alt":"https://movie.douban.com/photos/photo/2547382848/",
// //"id":"2547382848",
// //"icon":"https://img1.doubanio.com/view/photo/s/public/p2547382848.webp"
// //},
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2546873891.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2546873891.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2546873891.webp",
// //"alt":"https://movie.douban.com/photos/photo/2546873891/",
// //"id":"2546873891",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2546873891.webp"
// //},
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2546085344.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2546085344.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2546085344.webp",
// //"alt":"https://movie.douban.com/photos/photo/2546085344/",
// //"id":"2546085344",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2546085344.webp"
// //},
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2547477366.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2547477366.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2547477366.webp",
// //"alt":"https://movie.douban.com/photos/photo/2547477366/",
// //"id":"2547477366",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2547477366.webp"
// //},
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2547405693.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2547405693.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2547405693.webp",
// //"alt":"https://movie.douban.com/photos/photo/2547405693/",
// //"id":"2547405693",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2547405693.webp"
// //},
// //{
// //"thumb":"https://img1.doubanio.com/view/photo/m/public/p2547382847.webp",
// //"image":"https://img1.doubanio.com/view/photo/l/public/p2547382847.webp",
// //"cover":"https://img1.doubanio.com/view/photo/sqs/public/p2547382847.webp",
// //"alt":"https://movie.douban.com/photos/photo/2547382847/",
// //"id":"2547382847",
// //"icon":"https://img1.doubanio.com/view/photo/s/public/p2547382847.webp"
// //},
// //{
// //"thumb":"https://img3.doubanio.com/view/photo/m/public/p2547345262.webp",
// //"image":"https://img3.doubanio.com/view/photo/l/public/p2547345262.webp",
// //"cover":"https://img3.doubanio.com/view/photo/sqs/public/p2547345262.webp",
// //"alt":"https://movie.douban.com/photos/photo/2547345262/",
// //"id":"2547345262",
// //"icon":"https://img3.doubanio.com/view/photo/s/public/p2547345262.webp"
// //}
// //],
// //"summary":"太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新家园。然而宇宙之路危机四伏，为了拯救地球，为了人类能在漫长的2500年后抵达新的家园，流浪地球时代的年轻人挺身而出，展开争分夺秒的生死之战。",
// //"clips":[
// //
// //],
// //"subtype":"movie",
// //"directors":[
// //{
// //"avatars":{
// //"small":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1536678787.83.webp",
// //"large":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1536678787.83.webp",
// //"medium":"http://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1536678787.83.webp"
// //},
// //"name_en":"Frant Gwo",
// //"name":"郭帆",
// //"alt":"https://movie.douban.com/celebrity/1276086/",
// //"id":"1276086"
// //}
// //],
// //"comments_count":172145,
// //"popular_reviews":[
// //{
// //"rating":{
// //"max":5,
// //"value":1,
// //"min":0
// //},
// //"title":"流浪地球，不及格。",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"2129082",
// //"avatar":"http://img1.doubanio.com/icon/u2129082-3.jpg",
// //"signature":"红猪是我的自传体电影",
// //"alt":"https://www.douban.com/people/2129082/",
// //"id":"2129082",
// //"name":"左丘失明"
// //},
// //"summary":"流浪地球是一部不及格的电影。对这部不及格电影的普遍吹捧，那些看了提前点映纷纷较好的写手和大V，只能让我怀疑他们的人品与审美。 一、科学设定不及格 作为一部科幻片，一部被吹得很厉害的科幻片，流浪地球在科...",
// //"alt":"https://movie.douban.com/review/9936402/",
// //"id":"9936402"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":5,
// //"min":0
// //},
// //"title":"带上地球跟我走！5大问题+10大科普，看懂《流浪地球》",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"dreamfox",
// //"avatar":"http://img1.doubanio.com/icon/u2297669-12.jpg",
// //"signature":"公众号：dreamcrowfilm",
// //"alt":"https://www.douban.com/people/dreamfox/",
// //"id":"2297669",
// //"name":"乌鸦火堂"
// //},
// //"summary":"开门见山，《流浪地球》的长文，因为涉及到剧透，所以要等到上映之后再发出，最好看完电影再读本文。 这几年，每当大特效、大制作电影出炉时，“电影工业化”、“比肩好莱坞”等等字眼便会充斥于各版头条，对了，...",
// //"alt":"https://movie.douban.com/review/9936199/",
// //"id":"9936199"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":5,
// //"min":0
// //},
// //"title":"《流浪地球》有哪些精彩看点？",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"68423364",
// //"avatar":"http://img3.doubanio.com/icon/u68423364-7.jpg",
// //"signature":"",
// //"alt":"https://www.douban.com/people/68423364/",
// //"id":"68423364",
// //"name":"青木刺猬"
// //},
// //"summary":"1、 刘培强给木星画形状是为了记录离木星的距离，他从休眠舱出来之后发现窗口的木星不见了，立刻意识到空间站已经“叛逃”。在那个窗口旁，挂着一个《盗梦空间》里的陀螺，而盗梦空间的结局是，主角终于回到家见...",
// //"alt":"https://movie.douban.com/review/9936778/",
// //"id":"9936778"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":3,
// //"min":0
// //},
// //"title":"希望你因浩瀚宇宙流泪，而不是刻意煽情",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"42927631",
// //"avatar":"http://img1.doubanio.com/icon/u42927631-34.jpg",
// //"signature":"都是小人物，别说什么大话。",
// //"alt":"https://www.douban.com/people/42927631/",
// //"id":"42927631",
// //"name":"所有团的团长"
// //},
// //"summary":"在看片之前，我在朋友圈被轰炸过大概三四轮，电影圈的人都毫不吝惜赞美之词，“中国科幻电影之光”之类的赞美词已经是最谦虚的表达了，像极了《我不是药神》上映前圈内的那种大规模集体感慨。 不得不说，观影前我...",
// //"alt":"https://movie.douban.com/review/9938491/",
// //"id":"9938491"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":4,
// //"min":0
// //},
// //"title":"你以为是“太空战狼”，其实这是地球人的精神脊梁",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"48369193",
// //"avatar":"http://img3.doubanio.com/icon/u48369193-9.jpg",
// //"signature":"桃花影落飞胶片，光影潮生按玉箫",
// //"alt":"https://www.douban.com/people/48369193/",
// //"id":"48369193",
// //"name":"二十二岛主"
// //},
// //"summary":"本文首发于公众号：浮岛掠影（movie-bigbang） 文/二十二岛主、卢森、药风 说实话，在知悉《流浪地球》这个项目之初，岛主对这部电影是不看好的。因为我和很多观众一样，有着一种惯性思维：中国现在根本还不具备...",
// //"alt":"https://movie.douban.com/review/9936205/",
// //"id":"9936205"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":5,
// //"min":0
// //},
// //"title":"流浪地球细节与彩蛋整理",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"52502740",
// //"avatar":"http://img1.doubanio.com/icon/u52502740-2.jpg",
// //"signature":"",
// //"alt":"https://www.douban.com/people/52502740/",
// //"id":"52502740",
// //"name":"Neo"
// //},
// //"summary":"大家如果觉得有用请用力点赞，我将会有更多动力寻找细节(๑>؂<๑） 微博上有朋友摘抄了我的彩蛋被导演点了赞， 我这辛辛苦苦地为别人做了嫁衣，虽然挺郁闷的，但是现在想通了，既然都是为了让小破球...",
// //"alt":"https://movie.douban.com/review/9924531/",
// //"id":"9924531"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":2,
// //"min":0
// //},
// //"title":"《流浪地球》是华语科幻之光吗？是！它烂吗？烂！",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"summersunshine2",
// //"avatar":"http://img1.doubanio.com/icon/u51384127-12.jpg",
// //"signature":"梦里不知身是客，一晌贪欢。",
// //"alt":"https://www.douban.com/people/summersunshine2/",
// //"id":"51384127",
// //"name":"嘟角獣"
// //},
// //"summary":"乔治·梅里爱在1902年就拍出了《月球旅行记》，打开了科幻电影的大门，可能这才是《登月第一人》最早的版本。据说梅里爱拿着这部14分钟的电影准备到美国大赚一笔，却被那个发明电灯的爱迪生盗了版，在全美大卖，...",
// //"alt":"https://movie.douban.com/review/9932439/",
// //"id":"9932439"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":5,
// //"min":0
// //},
// //"title":"中国科幻电影有了希望，是因为它在为你开路",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"sfrabbit",
// //"avatar":"http://img3.doubanio.com/icon/u1032418-17.jpg",
// //"signature":"",
// //"alt":"https://www.douban.com/people/sfrabbit/",
// //"id":"1032418",
// //"name":"兔子等着瞧"
// //},
// //"summary":"这一段和下一段，写于20日提前专场结束当天： 泣不成声。这不是看完电影之后我的反应。看完的时候我只想起立鼓掌。起立这个念头也不是结束时出现的。看了半小时我就按捺不住想要站起来鼓掌高喊“太他妈了不起了！...",
// //"alt":"https://movie.douban.com/review/9936474/",
// //"id":"9936474"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":5,
// //"min":0
// //},
// //"title":"刘慈欣流泪的一天",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"jishaoting",
// //"avatar":"http://img1.doubanio.com/icon/u1828063-71.jpg",
// //"signature":"￣(エ)￣",
// //"alt":"https://www.douban.com/people/jishaoting/",
// //"id":"1828063",
// //"name":"小姬"
// //},
// //"summary":"2019年1月20日，我要永远记住这一天，因为这一天，未来局邀请了300名各行各业的科幻迷和大刘一起首次观看了他的首部改编电影《流浪地球》。 看电影的全程我的心脏砰砰直跳，一开始是因为紧张，不知道中国第一部科...",
// //"alt":"https://movie.douban.com/review/9907921/",
// //"id":"9907921"
// //},
// //{
// //"rating":{
// //"max":5,
// //"value":4,
// //"min":0
// //},
// //"title":"“人类一思考，上帝就发笑”：《流浪地球》原著小说与电影解析",
// //"subject_id":"26266893",
// //"author":{
// //"uid":"N.B.",
// //"avatar":"http://img3.doubanio.com/icon/u1473794-226.jpg",
// //"signature":"",
// //"alt":"https://www.douban.com/people/N.B./",
// //"id":"1473794",
// //"name":"无非🏳️🌈"
// //},
// //"summary":"看完《流浪地球》最直观的感受是：太空真美，人类真渺小。 刘慈欣的科幻作品，核心特质是将极致空灵的想象力与厚重的现实结合，对人类发展和未来命运始终饱含着深沉的关切。而《流浪地球》是一部关于死亡与希望的...",
// //"alt":"https://movie.douban.com/review/9938875/",
// //"id":"9938875"
// //}
// //],
// //"ratings_count":355951,
// //"aka":[
// //"The Wandering Earth"
// //]
// //}
// //
