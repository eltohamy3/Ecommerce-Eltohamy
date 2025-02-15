class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  String? itemsDate;
  int? itemsPrice;
  int? itemsDiscount;
  int? itemsCategories;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDateTime;
  int? Favorite;
  int? noOfItemInInCart;
  double? priceAfterDiscount;
  int? setting_deliverytime;

  ItemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsDate,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCategories,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDateTime,
      this.Favorite,
      this.noOfItemInInCart,
      this.priceAfterDiscount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDate = json['items_date'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDateTime = json['categories_dateTime'];
    Favorite = json['Favorite'];
    noOfItemInInCart = json['NumberOfItems'];
    priceAfterDiscount = 1.0 * json['priceAfterDiscount'];
    setting_deliverytime = json['setting_deliverytime'];
  }


 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_date'] = itemsDate;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_categories'] = itemsCategories;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_dateTime'] = categoriesDateTime;
    data['Favorite'] = Favorite;
    data['noOfItemInInCart'] = noOfItemInInCart;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['setting_deliverytime'] = setting_deliverytime; 

    return data;
  }
}
