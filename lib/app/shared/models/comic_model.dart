// To parse this JSON data, do
//
//     final comic = comicFromJson(jsonString);

import 'dart:convert';

Comic comicFromJson(String str) => Comic.fromJson(json.decode(str));

String comicToJson(Comic data) => json.encode(data.toJson());

class Comic {
  Comic({
    this.error,
    this.limit,
    this.offset,
    this.numberOfPageResults,
    this.numberOfTotalResults,
    this.statusCode,
    this.results,
    this.version,
  });

  final String? error;
  final int? limit;
  final int? offset;
  final int? numberOfPageResults;
  final int? numberOfTotalResults;
  final int? statusCode;
  final Results? results;
  final String? version;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        error: json["error"],
        limit: json["limit"],
        offset: json["offset"],
        numberOfPageResults: json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"],
        statusCode: json["status_code"],
        results: Results.fromJson(json["results"]),
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "limit": limit,
        "offset": offset,
        "number_of_page_results": numberOfPageResults,
        "number_of_total_results": numberOfTotalResults,
        "status_code": statusCode,
        "results": results!.toJson(),
        "version": version,
      };
}

class Results {
  Results({
    this.aliases,
    this.apiDetailUrl,
    this.countOfIsssueAppearances,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.firstAppearedInIssue,
    this.id,
    this.imageUrl,
    this.issueCredits,
    this.movies,
    this.name,
    this.siteDetailUrl,
    this.startYear,
    this.volumeCredits,
  });

  final String? aliases;
  final String? apiDetailUrl;
  final int? countOfIsssueAppearances;
  final DateTime? dateAdded;
  final DateTime? dateLastUpdated;
  final String? deck;
  final String? description;
  final FirstAppearedInIssue? firstAppearedInIssue;
  final int? id;
  final ImageUrl? imageUrl;
  final List<FirstAppearedInIssue>? issueCredits;
  final List<dynamic>? movies;
  final String? name;
  final String? siteDetailUrl;
  final String? startYear;
  final List<FirstAppearedInIssue>? volumeCredits;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        aliases: json["aliases"],
        apiDetailUrl: json["api_detail_url"],
        countOfIsssueAppearances: json["count_of_isssue_appearances"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"],
        firstAppearedInIssue:
            FirstAppearedInIssue.fromJson(json["first_appeared_in_issue"]),
        id: json["id"],
        imageUrl: ImageUrl.fromJson(json["image_url"]),
        issueCredits: List<FirstAppearedInIssue>.from(
            json["issue_credits"].map((x) => FirstAppearedInIssue.fromJson(x))),
        movies: List<dynamic>.from(json["movies"].map((x) => x)),
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
        startYear: json["start_year"],
        volumeCredits: List<FirstAppearedInIssue>.from(json["volume_credits"]
            .map((x) => FirstAppearedInIssue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl,
        "count_of_isssue_appearances": countOfIsssueAppearances,
        "date_added": dateAdded?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "deck": deck,
        "description": description,
        "first_appeared_in_issue": firstAppearedInIssue?.toJson(),
        "id": id,
        "image_url": imageUrl?.toJson(),
        "issue_credits":
            List<dynamic>.from(issueCredits!.map((x) => x.toJson())),
        "movies": List<dynamic>.from(movies!.map((x) => x)),
        "name": name,
        "site_detail_url": siteDetailUrl,
        "start_year": startYear,
        "volume_credits":
            List<dynamic>.from(volumeCredits!.map((x) => x.toJson())),
      };
}

class FirstAppearedInIssue {
  FirstAppearedInIssue({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.issueNumber,
    this.siteDetailUrl,
  });

  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? issueNumber;
  final String? siteDetailUrl;

  factory FirstAppearedInIssue.fromJson(Map<String, dynamic> json) =>
      FirstAppearedInIssue(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"] == null ? null : json["name"],
        issueNumber: json["issue_number"] == null ? null : json["issue_number"],
        siteDetailUrl:
            json["site_detail_url"] == null ? null : json["site_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name == null ? null : name,
        "issue_number": issueNumber == null ? null : issueNumber,
        "site_detail_url": siteDetailUrl == null ? null : siteDetailUrl,
      };
}

class ImageUrl {
  ImageUrl({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  final String? iconUrl;
  final String? mediumUrl;
  final String? screenUrl;
  final String? screenLargeUrl;
  final String? smallUrl;
  final String? superUrl;
  final String? thumbUrl;
  final String? tinyUrl;
  final String? originalUrl;
  final String? imageTags;

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
