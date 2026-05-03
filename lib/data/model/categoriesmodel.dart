class CategoryModel {
  final int? id;
  final String? name;
  final String? nameAr;
  final String? image;
  final String? datetime;

  CategoryModel({
    this.id,
    this.name,
    this.nameAr,
    this.image,
    this.datetime,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['categories_id'],
      name: json['categories_name'],
      nameAr: json['categories_ar_name'],
      image: json['categories_image'],
      datetime: json['categories_datetima'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories_id': id,
      'categories_name': name,
      'categories_ar_name': nameAr,
      'categories_image': image,
      'categories_datetima': datetime,
    };
  }
}