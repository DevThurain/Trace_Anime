class SearchResult {
  int? frameCount;
  String? error;
  List<Result>? result;

  SearchResult({this.frameCount, this.error, this.result});

  SearchResult.fromJson(Map<String, dynamic> json) {
    frameCount = json['frameCount'];
    error = json['error'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frameCount'] = this.frameCount;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? anilist;
  String? filename;
  int? episode;
  double? from;
  double? to;
  double? similarity;
  String? video;
  String? image;

  Result(
      {this.anilist,
      this.filename,
      this.episode,
      this.from,
      this.to,
      this.similarity,
      this.video,
      this.image});

  Result.fromJson(Map<String, dynamic> json) {
    anilist = json['anilist'];
    filename = json['filename'];
    episode = json['episode'];
    from = json['from'];
    to = json['to'];
    similarity = json['similarity'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['anilist'] = this.anilist;
    data['filename'] = this.filename;
    data['episode'] = this.episode;
    data['from'] = this.from;
    data['to'] = this.to;
    data['similarity'] = this.similarity;
    data['video'] = this.video;
    data['image'] = this.image;
    return data;
  }
}
