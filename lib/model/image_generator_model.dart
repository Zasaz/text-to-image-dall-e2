class ImageGeneratorModel {
  int? created;
  List<ImageModel>? data;

  ImageGeneratorModel({this.created, this.data});

  ImageGeneratorModel.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    if (json['data'] != null) {
      data = <ImageModel>[];
      json['data'].forEach((v) {
        data!.add(ImageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created'] = created;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImageModel {
  String? url;

  ImageModel({this.url});

  ImageModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}
