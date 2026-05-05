class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsArName;
  String? itemsDesc;
  String? itemsArDesc;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? categoriesId;
  String? categoriesName;
  String? categoriesArName;
  String? categoriesImage;
  String? categoriesDatetima;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsArName,
      this.itemsDesc,
      this.itemsArDesc,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.categoriesId,
      this.categoriesName,
      this.categoriesArName,
      this.categoriesImage,
      this.categoriesDatetima});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsArName = json['items_ar_name'];
    itemsDesc = json['items_desc'];
    itemsArDesc = json['items_ar_desc'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesArName = json['categories_ar_name'];
    categoriesImage = json['categories_image'];
    categoriesDatetima = json['categories_datetima'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_ar_name'] = this.itemsArName;
    data['items_desc'] = this.itemsDesc;
    data['items_ar_desc'] = this.itemsArDesc;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_ar_name'] = this.categoriesArName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetima'] = this.categoriesDatetima;
    return data;
  }
}