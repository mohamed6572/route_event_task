/// width : 23.17
/// height : 14.43
/// depth : 28.01

class Dimensions {
  Dimensions({
      this.width, 
      this.height, 
      this.depth,});

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  num? width;
  num? height;
  num? depth;
Dimensions copyWith({  num? width,
  num? height,
  num? depth,
}) => Dimensions(  width: width ?? this.width,
  height: height ?? this.height,
  depth: depth ?? this.depth,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

}