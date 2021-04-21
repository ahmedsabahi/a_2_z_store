// To parse this JSON data, do
//
//     final productDetails = productDetailsFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) =>
    ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
    this.id,
    this.name,
    this.description,
    this.alternateNames,
    this.localisedData,
    this.gender,
    this.productCode,
    this.pdpLayout,
    this.brand,
    this.sizeGuide,
    this.sizeGuideApiUrl,
    this.isNoSize,
    this.isOneSize,
    this.isInStock,
    this.countryOfManufacture,
    this.hasVariantsWithProp65Risk,
    this.webCategories,
    this.variants,
    this.media,
    this.badges,
    this.info,
    this.shippingRestriction,
    this.price,
    this.isDeadProduct,
    this.rating,
    this.productType,
    this.baseUrl,
  });

  int id;
  String name;
  String description;
  List<AlternateName> alternateNames;
  dynamic localisedData;
  String gender;
  String productCode;
  String pdpLayout;
  Brand brand;
  dynamic sizeGuide;
  dynamic sizeGuideApiUrl;
  bool isNoSize;
  bool isOneSize;
  bool isInStock;
  dynamic countryOfManufacture;
  bool hasVariantsWithProp65Risk;
  List<WebCategory> webCategories;
  List<Variant> variants;
  Media media;
  List<dynamic> badges;
  Info info;
  dynamic shippingRestriction;
  Price price;
  bool isDeadProduct;
  dynamic rating;
  ProductType productType;
  String baseUrl;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        alternateNames: List<AlternateName>.from(
            json["alternateNames"].map((x) => AlternateName.fromJson(x))),
        localisedData: json["localisedData"],
        gender: json["gender"],
        productCode: json["productCode"],
        pdpLayout: json["pdpLayout"],
        brand: Brand.fromJson(json["brand"]),
        sizeGuide: json["sizeGuide"],
        sizeGuideApiUrl: json["sizeGuideApiUrl"],
        isNoSize: json["isNoSize"],
        isOneSize: json["isOneSize"],
        isInStock: json["isInStock"],
        countryOfManufacture: json["countryOfManufacture"],
        hasVariantsWithProp65Risk: json["hasVariantsWithProp65Risk"],
        webCategories: List<WebCategory>.from(
            json["webCategories"].map((x) => WebCategory.fromJson(x))),
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        media: Media.fromJson(json["media"]),
        badges: List<dynamic>.from(json["badges"].map((x) => x)),
        info: Info.fromJson(json["info"]),
        shippingRestriction: json["shippingRestriction"],
        price: Price.fromJson(json["price"]),
        isDeadProduct: json["isDeadProduct"],
        rating: json["rating"],
        productType: ProductType.fromJson(json["productType"]),
        baseUrl: json["baseUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "alternateNames":
            List<dynamic>.from(alternateNames.map((x) => x.toJson())),
        "localisedData": localisedData,
        "gender": gender,
        "productCode": productCode,
        "pdpLayout": pdpLayout,
        "brand": brand.toJson(),
        "sizeGuide": sizeGuide,
        "sizeGuideApiUrl": sizeGuideApiUrl,
        "isNoSize": isNoSize,
        "isOneSize": isOneSize,
        "isInStock": isInStock,
        "countryOfManufacture": countryOfManufacture,
        "hasVariantsWithProp65Risk": hasVariantsWithProp65Risk,
        "webCategories":
            List<dynamic>.from(webCategories.map((x) => x.toJson())),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "media": media.toJson(),
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "info": info.toJson(),
        "shippingRestriction": shippingRestriction,
        "price": price.toJson(),
        "isDeadProduct": isDeadProduct,
        "rating": rating,
        "productType": productType.toJson(),
        "baseUrl": baseUrl,
      };
}

class AlternateName {
  AlternateName({
    this.locale,
    this.title,
  });

  String locale;
  String title;

  factory AlternateName.fromJson(Map<String, dynamic> json) => AlternateName(
        locale: json["locale"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "locale": locale,
        "title": title,
      };
}

class Brand {
  Brand({
    this.brandId,
    this.name,
    this.description,
  });

  int brandId;
  String name;
  dynamic description;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandId: json["brandId"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "brandId": brandId,
        "name": name,
        "description": description,
      };
}

class Info {
  Info({
    this.aboutMe,
    this.sizeAndFit,
    this.careInfo,
  });

  String aboutMe;
  String sizeAndFit;
  String careInfo;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        aboutMe: json["aboutMe"],
        sizeAndFit: json["sizeAndFit"],
        careInfo: json["careInfo"],
      );

  Map<String, dynamic> toJson() => {
        "aboutMe": aboutMe,
        "sizeAndFit": sizeAndFit,
        "careInfo": careInfo,
      };
}

class Media {
  Media({
    this.images,
    this.catwalk,
    this.spinset,
    this.swatchSprite,
  });

  List<Image> images;
  List<Catwalk> catwalk;
  List<dynamic> spinset;
  List<dynamic> swatchSprite;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        catwalk:
            List<Catwalk>.from(json["catwalk"].map((x) => Catwalk.fromJson(x))),
        spinset: List<dynamic>.from(json["spinset"].map((x) => x)),
        swatchSprite: List<dynamic>.from(json["swatchSprite"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "catwalk": List<dynamic>.from(catwalk.map((x) => x.toJson())),
        "spinset": List<dynamic>.from(spinset.map((x) => x)),
        "swatchSprite": List<dynamic>.from(swatchSprite.map((x) => x)),
      };
}

class Catwalk {
  Catwalk({
    this.url,
    this.colourWayId,
    this.colourCode,
  });

  String url;
  int colourWayId;
  String colourCode;

  factory Catwalk.fromJson(Map<String, dynamic> json) => Catwalk(
        url: json["url"],
        colourWayId: json["colourWayId"],
        colourCode: json["colourCode"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "colourWayId": colourWayId,
        "colourCode": colourCode,
      };
}

class Image {
  Image({
    this.url,
    this.type,
    this.colourWayId,
    this.colourCode,
    this.colour,
    this.isPrimary,
  });

  String url;
  String type;
  int colourWayId;
  String colourCode;
  String colour;
  bool isPrimary;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        type: json["type"],
        colourWayId: json["colourWayId"] == null ? null : json["colourWayId"],
        colourCode: json["colourCode"],
        colour: json["colour"],
        isPrimary: json["isPrimary"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
        "colourWayId": colourWayId == null ? null : colourWayId,
        "colourCode": colourCode,
        "colour": colour,
        "isPrimary": isPrimary,
      };
}

class Price {
  Price({
    this.current,
    this.previous,
    this.rrp,
    this.xrp,
    this.currency,
    this.isMarkedDown,
    this.isOutletPrice,
    this.startDateTime,
  });

  Current current;
  Current previous;
  Current rrp;
  Current xrp;
  String currency;
  bool isMarkedDown;
  bool isOutletPrice;
  DateTime startDateTime;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: Current.fromJson(json["current"]),
        previous: Current.fromJson(json["previous"]),
        rrp: Current.fromJson(json["rrp"]),
        xrp: Current.fromJson(json["xrp"]),
        currency: json["currency"],
        isMarkedDown: json["isMarkedDown"],
        isOutletPrice: json["isOutletPrice"],
        startDateTime: DateTime.parse(json["startDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "current": current.toJson(),
        "previous": previous.toJson(),
        "rrp": rrp.toJson(),
        "xrp": xrp.toJson(),
        "currency": currency,
        "isMarkedDown": isMarkedDown,
        "isOutletPrice": isOutletPrice,
        "startDateTime": startDateTime.toIso8601String(),
      };
}

class Current {
  Current({
    this.value,
    this.text,
    this.versionId,
    this.conversionId,
  });

  double value;
  Text text;
  VersionId versionId;
  String conversionId;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json["value"],
        text: textValues.map[json["text"]],
        versionId: versionIdValues.map[json["versionId"]],
        conversionId: json["conversionId"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": textValues.reverse[text],
        "versionId": versionIdValues.reverse[versionId],
        "conversionId": conversionId,
      };
}

enum Text { THE_1040, THE_2600, THE_5900, THE_659 }

final textValues = EnumValues({
  "\u002410.40": Text.THE_1040,
  "\u002426.00": Text.THE_2600,
  "\u002459.00": Text.THE_5900,
  "\u00246.59": Text.THE_659
});

enum VersionId { CLRP0000020009000000165869369 }

final versionIdValues = EnumValues(
    {"CLRP0000020009000000165869369": VersionId.CLRP0000020009000000165869369});

class ProductType {
  ProductType({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Variant {
  Variant({
    this.id,
    this.name,
    this.sizeId,
    this.brandSize,
    this.sizeDescription,
    this.displaySizeText,
    this.sizeOrder,
    this.sku,
    this.isLowInStock,
    this.isInStock,
    this.isAvailable,
    this.colourWayId,
    this.colourCode,
    this.colour,
    this.price,
    this.isPrimary,
    this.isProp65Risk,
    this.ean,
  });

  int id;
  String name;
  int sizeId;
  String brandSize;
  String sizeDescription;
  String displaySizeText;
  int sizeOrder;
  String sku;
  bool isLowInStock;
  bool isInStock;
  bool isAvailable;
  int colourWayId;
  String colourCode;
  String colour;
  Price price;
  bool isPrimary;
  bool isProp65Risk;
  dynamic ean;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        name: json["name"],
        sizeId: json["sizeId"],
        brandSize: json["brandSize"],
        sizeDescription: json["sizeDescription"],
        displaySizeText: json["displaySizeText"],
        sizeOrder: json["sizeOrder"],
        sku: json["sku"],
        isLowInStock: json["isLowInStock"],
        isInStock: json["isInStock"],
        isAvailable: json["isAvailable"],
        colourWayId: json["colourWayId"],
        colourCode: json["colourCode"],
        colour: json["colour"],
        price: Price.fromJson(json["price"]),
        isPrimary: json["isPrimary"],
        isProp65Risk: json["isProp65Risk"],
        ean: json["ean"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sizeId": sizeId,
        "brandSize": brandSize,
        "sizeDescription": sizeDescription,
        "displaySizeText": displaySizeText,
        "sizeOrder": sizeOrder,
        "sku": sku,
        "isLowInStock": isLowInStock,
        "isInStock": isInStock,
        "isAvailable": isAvailable,
        "colourWayId": colourWayId,
        "colourCode": colourCode,
        "colour": colour,
        "price": price.toJson(),
        "isPrimary": isPrimary,
        "isProp65Risk": isProp65Risk,
        "ean": ean,
      };
}

class WebCategory {
  WebCategory({
    this.id,
  });

  int id;

  factory WebCategory.fromJson(Map<String, dynamic> json) => WebCategory(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
