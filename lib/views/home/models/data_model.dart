class DataModel {
  bool? success;
  String? message;
  FetchedData? data;

  DataModel({this.success, this.message, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? FetchedData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FetchedData {
  String? developer;
  bool? status;
  List<Data>? data;

  FetchedData({this.developer, this.status, this.data});

  FetchedData.fromJson(Map<String, dynamic> json) {
    developer = json['developer'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['developer'] = developer;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? thumbnail;
  String? url;

  Data({this.thumbnail, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumbnail'] = thumbnail;
    data['url'] = url;
    return data;
  }
}
