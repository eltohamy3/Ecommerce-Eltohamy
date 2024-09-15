class CartModel {
  int? cartId;
  int? cartUserid;
  int? cartItemid;
  int? noOFItemsInCart;
  int? itemsPriceSum;
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
  double? priceAfterDiscount;

  CartModel(
      {this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.noOFItemsInCart,
      this.itemsPriceSum,
      this.itemsId,
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
      this.categoriesDateTime , 
      this.priceAfterDiscount
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    noOFItemsInCart = json['NoOFItemsInCart'];
    itemsPriceSum = json['itemsPriceSum'];
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
        priceAfterDiscount = 1.0 * json['priceAfterDiscount'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemid'] = this.cartItemid;
    data['NoOFItemsInCart'] = this.noOFItemsInCart;
    data['itemsPriceSum'] = this.itemsPriceSum;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_date'] = this.itemsDate;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_categories'] = this.itemsCategories;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_dateTime'] = this.categoriesDateTime;
        data['priceAfterDiscount']= priceAfterDiscount; 

    return data;
  }
}
