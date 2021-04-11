// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    this.searchTerm,
    this.categoryName,
    this.itemCount,
    this.redirectUrl,
    this.products,
    this.facets,
    this.diagnostics,
    this.searchPassMeta,
    this.queryId,
    this.discoverSearchProductTypes,
    this.campaigns,
  });

  String searchTerm;
  String categoryName;
  int itemCount;
  String redirectUrl;
  List<Product> products;
  List<Facet> facets;
  Diagnostics diagnostics;
  SearchPassMeta searchPassMeta;
  dynamic queryId;
  List<dynamic> discoverSearchProductTypes;
  Campaigns campaigns;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        searchTerm: json["searchTerm"],
        categoryName: json["categoryName"],
        itemCount: json["itemCount"],
        redirectUrl: json["redirectUrl"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        facets: List<Facet>.from(json["facets"].map((x) => Facet.fromJson(x))),
        diagnostics: Diagnostics.fromJson(json["diagnostics"]),
        searchPassMeta: SearchPassMeta.fromJson(json["searchPassMeta"]),
        queryId: json["queryId"],
        discoverSearchProductTypes: List<dynamic>.from(
            json["discoverSearchProductTypes"].map((x) => x)),
        campaigns: Campaigns.fromJson(json["campaigns"]),
      );

  Map<String, dynamic> toJson() => {
        "searchTerm": searchTerm,
        "categoryName": categoryName,
        "itemCount": itemCount,
        "redirectUrl": redirectUrl,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "facets": List<dynamic>.from(facets.map((x) => x.toJson())),
        "diagnostics": diagnostics.toJson(),
        "searchPassMeta": searchPassMeta.toJson(),
        "queryId": queryId,
        "discoverSearchProductTypes":
            List<dynamic>.from(discoverSearchProductTypes.map((x) => x)),
        "campaigns": campaigns.toJson(),
      };
}

class Campaigns {
  Campaigns({
    this.promoBanners,
  });

  List<dynamic> promoBanners;

  factory Campaigns.fromJson(Map<String, dynamic> json) => Campaigns(
        promoBanners: List<dynamic>.from(json["promoBanners"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "promoBanners": List<dynamic>.from(promoBanners.map((x) => x)),
      };
}

class Diagnostics {
  Diagnostics({
    this.requestId,
    this.processingTime,
    this.queryTime,
    this.recommendationsEnabled,
    this.recommendationsAnalytics,
  });

  String requestId;
  int processingTime;
  int queryTime;
  bool recommendationsEnabled;
  RecommendationsAnalytics recommendationsAnalytics;

  factory Diagnostics.fromJson(Map<String, dynamic> json) => Diagnostics(
        requestId: json["requestId"],
        processingTime: json["processingTime"],
        queryTime: json["queryTime"],
        recommendationsEnabled: json["recommendationsEnabled"],
        recommendationsAnalytics:
            RecommendationsAnalytics.fromJson(json["recommendationsAnalytics"]),
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "processingTime": processingTime,
        "queryTime": queryTime,
        "recommendationsEnabled": recommendationsEnabled,
        "recommendationsAnalytics": recommendationsAnalytics.toJson(),
      };
}

class RecommendationsAnalytics {
  RecommendationsAnalytics({
    this.personalisationStatus,
    this.numberOfItems,
    this.numberOfRecs,
    this.personalisationType,
    this.items,
  });

  int personalisationStatus;
  int numberOfItems;
  int numberOfRecs;
  String personalisationType;
  List<dynamic> items;

  factory RecommendationsAnalytics.fromJson(Map<String, dynamic> json) =>
      RecommendationsAnalytics(
        personalisationStatus: json["personalisationStatus"],
        numberOfItems: json["numberOfItems"],
        numberOfRecs: json["numberOfRecs"],
        personalisationType: json["personalisationType"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "personalisationStatus": personalisationStatus,
        "numberOfItems": numberOfItems,
        "numberOfRecs": numberOfRecs,
        "personalisationType": personalisationType,
        "items": List<dynamic>.from(items.map((x) => x)),
      };
}

class Facet {
  Facet({
    this.id,
    this.name,
    this.facetValues,
    this.displayStyle,
    this.facetType,
    this.hasSelectedValues,
  });

  String id;
  String name;
  List<FacetValue> facetValues;
  DisplayStyle displayStyle;
  FacetType facetType;
  bool hasSelectedValues;

  factory Facet.fromJson(Map<String, dynamic> json) => Facet(
        id: json["id"],
        name: json["name"],
        facetValues: List<FacetValue>.from(
            json["facetValues"].map((x) => FacetValue.fromJson(x))),
        displayStyle: displayStyleValues.map[json["displayStyle"]],
        facetType: facetTypeValues.map[json["facetType"]],
        hasSelectedValues: json["hasSelectedValues"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "facetValues": List<dynamic>.from(facetValues.map((x) => x.toJson())),
        "displayStyle": displayStyleValues.reverse[displayStyle],
        "facetType": facetTypeValues.reverse[facetType],
        "hasSelectedValues": hasSelectedValues,
      };
}

enum DisplayStyle { SINGLE_COLUMN, PRICE_SLIDER }

final displayStyleValues = EnumValues({
  "Price-Slider": DisplayStyle.PRICE_SLIDER,
  "Single-Column": DisplayStyle.SINGLE_COLUMN
});

enum FacetType { TEXT_MULTI_SELECT, RANGE }

final facetTypeValues = EnumValues(
    {"Range": FacetType.RANGE, "TextMultiSelect": FacetType.TEXT_MULTI_SELECT});

class FacetValue {
  FacetValue({
    this.count,
    this.id,
    this.name,
    this.isSelected,
  });

  int count;
  String id;
  String name;
  bool isSelected;

  factory FacetValue.fromJson(Map<String, dynamic> json) => FacetValue(
        count: json["count"],
        id: json["id"],
        name: json["name"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "id": id,
        "name": name,
        "isSelected": isSelected,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.colour,
    this.colourWayId,
    this.brandName,
    this.hasVariantColours,
    this.hasMultiplePrices,
    this.groupId,
    this.productCode,
    this.productType,
    this.url,
    this.imageUrl,
    this.videoUrl,
    this.isSellingFast,
  });

  int id;
  String name;
  Price price;
  String colour;
  int colourWayId;
  String brandName;
  bool hasVariantColours;
  bool hasMultiplePrices;
  dynamic groupId;
  int productCode;
  ProductType productType;
  String url;
  String imageUrl;
  dynamic videoUrl;
  bool isSellingFast;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: Price.fromJson(json["price"]),
        colour: json["colour"],
        colourWayId: json["colourWayId"],
        brandName: json["brandName"],
        hasVariantColours: json["hasVariantColours"],
        hasMultiplePrices: json["hasMultiplePrices"],
        groupId: json["groupId"],
        productCode: json["productCode"],
        productType: productTypeValues.map[json["productType"]],
        url: json["url"],
        imageUrl: json["imageUrl"],
        videoUrl: json["videoUrl"],
        isSellingFast: json["isSellingFast"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price.toJson(),
        "colour": colour,
        "colourWayId": colourWayId,
        "brandName": brandName,
        "hasVariantColours": hasVariantColours,
        "hasMultiplePrices": hasMultiplePrices,
        "groupId": groupId,
        "productCode": productCode,
        "productType": productTypeValues.reverse[productType],
        "url": url,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
        "isSellingFast": isSellingFast,
      };
}

class Price {
  Price({
    this.current,
    this.previous,
    this.rrp,
    this.isMarkedDown,
    this.isOutletPrice,
    this.currency,
  });

  Current current;
  Current previous;
  Current rrp;
  bool isMarkedDown;
  bool isOutletPrice;
  Currency currency;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: Current.fromJson(json["current"]),
        previous: Current.fromJson(json["previous"]),
        rrp: Current.fromJson(json["rrp"]),
        isMarkedDown: json["isMarkedDown"],
        isOutletPrice: json["isOutletPrice"],
        currency: currencyValues.map[json["currency"]],
      );

  Map<String, dynamic> toJson() => {
        "current": current.toJson(),
        "previous": previous.toJson(),
        "rrp": rrp.toJson(),
        "isMarkedDown": isMarkedDown,
        "isOutletPrice": isOutletPrice,
        "currency": currencyValues.reverse[currency],
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

class Current {
  Current({
    this.value,
    this.text,
  });

  double value;
  String text;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json["value"] == null ? null : json["value"].toDouble(),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "text": text,
      };
}

enum ProductType { PRODUCT }

final productTypeValues = EnumValues({"Product": ProductType.PRODUCT});

class SearchPassMeta {
  SearchPassMeta({
    this.isPartial,
    this.isSpellcheck,
    this.searchPass,
    this.alternateSearchTerms,
  });

  bool isPartial;
  bool isSpellcheck;
  List<dynamic> searchPass;
  List<dynamic> alternateSearchTerms;

  factory SearchPassMeta.fromJson(Map<String, dynamic> json) => SearchPassMeta(
        isPartial: json["isPartial"],
        isSpellcheck: json["isSpellcheck"],
        searchPass: List<dynamic>.from(json["searchPass"].map((x) => x)),
        alternateSearchTerms:
            List<dynamic>.from(json["alternateSearchTerms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isPartial": isPartial,
        "isSpellcheck": isSpellcheck,
        "searchPass": List<dynamic>.from(searchPass.map((x) => x)),
        "alternateSearchTerms":
            List<dynamic>.from(alternateSearchTerms.map((x) => x)),
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
