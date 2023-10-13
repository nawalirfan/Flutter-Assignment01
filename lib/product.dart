class Products {
  int? id;
  String? brand;
  String? name;
  String? price;
  String? image_link;
  String? description;
  double? rating;
  String? product_type;
  List<ProductColors>? product_colors;

  Products(
      {this.id,
      this.brand,
      this.name,
      this.price,
      this.image_link,
      this.description,
      this.rating,
      this.product_type,
      this.product_colors});

  Products.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = json['price'];
    image_link = json['image_link'];
    description = json['description'];
    rating = json['rating'];
    product_type = json['product_type'];

    if (json['product_colors'] != null) {
      product_colors = (json['product_colors'] as List<dynamic>)
          .map((color) => ProductColors.fromJson(color))
          .toList();
    } else {
      product_colors = null;
    }

    // product_colors = json['product_colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['brand'] = brand;
    data['name'] = name;
    data['price'] = price;
    data['image_link'] = image_link;
    data['desription'] = description;
    data['rating'] = rating;
    data['product_type'] = product_type;
    data['product_colors'] = product_colors;
    return data;
  }
}

class ProductColors {
  String? hex_value;
  String? colour_name;

  ProductColors({this.hex_value, this.colour_name});

  ProductColors.fromJson(Map<String, dynamic> json) {
    hex_value = json['hex_value'];
    colour_name = json['colour_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hex_value'] = hex_value;
    data['colour_name'] = colour_name;
    return data;
  }
}


// class Products {
//   int? id;
//   String? brand;
//   String? name;
//   String? price;
//   String? imageLink;
//   String? productLink;
//   String? websiteLink;
//   String? description;
//   int? rating;  
//   String? productType;
//   List<Null>? tagList;
//   String? createdAt;
//   String? updatedAt;
//   String? productApiUrl;
//   String? apiFeaturedImage;
//   List<ProductColors>? productColors;

//   Products(
//       {this.id,
//       this.brand,
//       this.name,
//       this.price,
//       this.priceSign,
//       this.currency,
//       this.imageLink,
//       this.productLink,
//       this.websiteLink,
//       this.description,
//       this.rating,
//       this.category,
//       this.productType,
//       this.tagList,
//       this.createdAt,
//       this.updatedAt,
//       this.productApiUrl,
//       this.apiFeaturedImage,
//       this.productColors});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     brand = json['brand'];
//     name = json['name'];
//     price = json['price'];
//     priceSign = json['price_sign'];
//     currency = json['currency'];
//     imageLink = json['image_link'];
//     productLink = json['product_link'];
//     websiteLink = json['website_link'];
//     description = json['description'];
//     rating = json['rating'];
//     category = json['category'];
//     productType = json['product_type'];
//     if (json['tag_list'] != null) {
//       tagList = <Null>[];
//       json['tag_list'].forEach((v) {
//         tagList!.add(new Null.fromJson(v));
//       });
//     }
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     productApiUrl = json['product_api_url'];
//     apiFeaturedImage = json['api_featured_image'];
//     if (json['product_colors'] != null) {
//       productColors = <ProductColors>[];
//       json['product_colors'].forEach((v) {
//         productColors!.add(new ProductColors.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['brand'] = this.brand;
//     data['name'] = this.name;
//     data['price'] = this.price;
//     data['price_sign'] = this.priceSign;
//     data['currency'] = this.currency;
//     data['image_link'] = this.imageLink;
//     data['product_link'] = this.productLink;
//     data['website_link'] = this.websiteLink;
//     data['description'] = this.description;
//     data['rating'] = this.rating;
//     data['category'] = this.category;
//     data['product_type'] = this.productType;
//     if (this.tagList != null) {
//       data['tag_list'] = this.tagList!.map((v) => v.toJson()).toList();
//     }
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['product_api_url'] = this.productApiUrl;
//     data['api_featured_image'] = this.apiFeaturedImage;
//     if (this.productColors != null) {
//       data['product_colors'] =
//           this.productColors!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ProductColors {
//   String? hexValue;
//   String? colourName;

//   ProductColors({this.hexValue, this.colourName});

//   ProductColors.fromJson(Map<String, dynamic> json) {
//     hexValue = json['hex_value'];
//     colourName = json['colour_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['hex_value'] = this.hexValue;
//     data['colour_name'] = this.colourName;
//     return data;
//   }
// }
