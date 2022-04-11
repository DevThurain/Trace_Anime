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
  String? filename;
  double? similarity;
  String? image;

  Result(
      {
      this.filename,
      this.similarity,
      this.image});

  Result.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    similarity = json['similarity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['similarity'] = this.similarity;
    data['image'] = this.image;
    return data;
  }
}
