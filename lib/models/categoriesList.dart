// To parse this JSON data, do
//
//     final categoriesList = categoriesListFromJson(jsonString);

import 'dart:convert';

CategoriesList categoriesListFromJson(String str) =>
    CategoriesList.fromJson(json.decode(str));

String categoriesListToJson(CategoriesList data) => json.encode(data.toJson());

class CategoriesList {
  CategoriesList({
    this.navigation,
    this.brands,
    this.footer,
  });

  List<Brand> navigation;
  List<Brand> brands;
  List<Brand> footer;

  factory CategoriesList.fromJson(Map<String, dynamic> json) => CategoriesList(
        navigation:
            List<Brand>.from(json["navigation"].map((x) => Brand.fromJson(x))),
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        footer: List<Brand>.from(json["footer"].map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "navigation": List<dynamic>.from(navigation.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "footer": List<dynamic>.from(footer.map((x) => x.toJson())),
      };
}

class Brand {
  Brand({
    this.id,
    this.alias,
    this.type,
    this.channelExclusions,
    this.webLargePriority,
    this.content,
    this.display,
    this.style,
    this.link,
    this.children,
  });

  String id;
  String alias;
  Type type;
  List<ChannelExclusion> channelExclusions;
  int webLargePriority;
  Content content;
  Display display;
  Style style;
  Link link;
  List<Brand> children;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        alias: json["alias"] == null ? null : json["alias"],
        type: typeValues.map[json["type"]],
        channelExclusions: List<ChannelExclusion>.from(json["channelExclusions"]
            .map((x) => channelExclusionValues.map[x])),
        webLargePriority: json["webLargePriority"],
        content: Content.fromJson(json["content"]),
        display:
            json["display"] == null ? null : Display.fromJson(json["display"]),
        style: Style.fromJson(json["style"]),
        link: json["link"] == null ? null : Link.fromJson(json["link"]),
        children:
            List<Brand>.from(json["children"].map((x) => Brand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias == null ? null : alias,
        "type": typeValues.reverse[type],
        "channelExclusions": List<dynamic>.from(
            channelExclusions.map((x) => channelExclusionValues.reverse[x])),
        "webLargePriority": webLargePriority,
        "content": content.toJson(),
        "display": display == null ? null : display.toJson(),
        "style": style.toJson(),
        "link": link == null ? null : link.toJson(),
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
      };
}

enum ChannelExclusion { APPS, WEB_LARGE, WEB_SMALL }

final channelExclusionValues = EnumValues({
  "apps": ChannelExclusion.APPS,
  "webLarge": ChannelExclusion.WEB_LARGE,
  "webSmall": ChannelExclusion.WEB_SMALL
});

class Content {
  Content({
    this.title,
    this.subTitle,
    this.webLargeImageUrl,
    this.mobileImageUrl,
  });

  String title;
  String subTitle;
  String webLargeImageUrl;
  String mobileImageUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        subTitle: json["subTitle"] == null ? null : json["subTitle"],
        webLargeImageUrl:
            json["webLargeImageUrl"] == null ? null : json["webLargeImageUrl"],
        mobileImageUrl:
            json["mobileImageUrl"] == null ? null : json["mobileImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle == null ? null : subTitle,
        "webLargeImageUrl": webLargeImageUrl == null ? null : webLargeImageUrl,
        "mobileImageUrl": mobileImageUrl == null ? null : mobileImageUrl,
      };
}

class Display {
  Display({
    this.webLargeTemplateId,
    this.webLargeTemplateName,
    this.webLargeColumnSpan,
    this.mobileTemplateId,
    this.mobileTemplateName,
    this.mobileDisplayLayout,
  });

  int webLargeTemplateId;
  WebLargeTemplateName webLargeTemplateName;
  int webLargeColumnSpan;
  int mobileTemplateId;
  MobileTemplateName mobileTemplateName;
  MobileDisplayLayout mobileDisplayLayout;

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        webLargeTemplateId: json["webLargeTemplateId"],
        webLargeTemplateName:
            webLargeTemplateNameValues.map[json["webLargeTemplateName"]],
        webLargeColumnSpan: json["webLargeColumnSpan"],
        mobileTemplateId: json["mobileTemplateId"],
        mobileTemplateName:
            mobileTemplateNameValues.map[json["mobileTemplateName"]],
        mobileDisplayLayout:
            mobileDisplayLayoutValues.map[json["mobileDisplayLayout"]],
      );

  Map<String, dynamic> toJson() => {
        "webLargeTemplateId": webLargeTemplateId,
        "webLargeTemplateName":
            webLargeTemplateNameValues.reverse[webLargeTemplateName],
        "webLargeColumnSpan": webLargeColumnSpan,
        "mobileTemplateId": mobileTemplateId,
        "mobileTemplateName":
            mobileTemplateNameValues.reverse[mobileTemplateName],
        "mobileDisplayLayout":
            mobileDisplayLayoutValues.reverse[mobileDisplayLayout],
      };
}

enum MobileDisplayLayout { LIST, CAROUSEL }

final mobileDisplayLayoutValues = EnumValues({
  "carousel": MobileDisplayLayout.CAROUSEL,
  "list": MobileDisplayLayout.LIST
});

enum MobileTemplateName {
  EMPTY,
  IMAGE_BACKGROUND,
  CIRCLE_IMAGE_LIST,
  CIRCLE_IMAGE_RIGHT,
  IMAGE_CARDS_WITH_DESCRIPTION,
  HOMEPAGE_LINKS,
  IMAGE_TILE_WITH_TITLE
}

final mobileTemplateNameValues = EnumValues({
  "circleImageList": MobileTemplateName.CIRCLE_IMAGE_LIST,
  "circleImageRight": MobileTemplateName.CIRCLE_IMAGE_RIGHT,
  "": MobileTemplateName.EMPTY,
  "homepageLinks": MobileTemplateName.HOMEPAGE_LINKS,
  "imageBackground": MobileTemplateName.IMAGE_BACKGROUND,
  "imageCardsWithDescription": MobileTemplateName.IMAGE_CARDS_WITH_DESCRIPTION,
  "imageTileWithTitle": MobileTemplateName.IMAGE_TILE_WITH_TITLE
});

enum WebLargeTemplateName {
  EMPTY,
  CIRCLE_IMAGE_LIST_LARGE,
  TEXT_LIST,
  GRID_CIRCLE_IMAGE_LARGE,
  FULL_MARKETING_IMAGE,
  THIRD_MARKETING_IMAGE,
  HALF_MARKETING_IMAGE,
  IMAGE_CARDS_WITH_DESCRIPTION_LARGE
}

final webLargeTemplateNameValues = EnumValues({
  "circleImageListLarge": WebLargeTemplateName.CIRCLE_IMAGE_LIST_LARGE,
  "": WebLargeTemplateName.EMPTY,
  "fullMarketingImage": WebLargeTemplateName.FULL_MARKETING_IMAGE,
  "gridCircleImageLarge": WebLargeTemplateName.GRID_CIRCLE_IMAGE_LARGE,
  "halfMarketingImage": WebLargeTemplateName.HALF_MARKETING_IMAGE,
  "imageCardsWithDescriptionLarge":
      WebLargeTemplateName.IMAGE_CARDS_WITH_DESCRIPTION_LARGE,
  "textList": WebLargeTemplateName.TEXT_LIST,
  "thirdMarketingImage": WebLargeTemplateName.THIRD_MARKETING_IMAGE
});

class Link {
  Link({
    this.linkType,
    this.brandSectionAlias,
    this.categoryId,
    this.webUrl,
    this.appUrl,
  });

  LinkType linkType;
  String brandSectionAlias;
  int categoryId;
  String webUrl;
  String appUrl;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        linkType: json["linkType"] == null
            ? null
            : linkTypeValues.map[json["linkType"]],
        brandSectionAlias: json["brandSectionAlias"] == null
            ? null
            : json["brandSectionAlias"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        webUrl: json["webUrl"] == null ? null : json["webUrl"],
        appUrl: json["appUrl"] == null ? null : json["appUrl"],
      );

  Map<String, dynamic> toJson() => {
        "linkType": linkType == null ? null : linkTypeValues.reverse[linkType],
        "brandSectionAlias":
            brandSectionAlias == null ? null : brandSectionAlias,
        "categoryId": categoryId == null ? null : categoryId,
        "webUrl": webUrl == null ? null : webUrl,
        "appUrl": appUrl == null ? null : appUrl,
      };
}

enum LinkType { CATEGORY, INTERNAL, EXTERNAL, A_TO_Z_BRANDS }

final linkTypeValues = EnumValues({
  "aToZBrands": LinkType.A_TO_Z_BRANDS,
  "category": LinkType.CATEGORY,
  "external": LinkType.EXTERNAL,
  "internal": LinkType.INTERNAL
});

class Style {
  Style({
    this.webLargeStyleType,
    this.mobileStyleType,
  });

  EStyleType webLargeStyleType;
  EStyleType mobileStyleType;

  factory Style.fromJson(Map<String, dynamic> json) => Style(
        webLargeStyleType: json["webLargeStyleType"] == null
            ? null
            : eStyleTypeValues.map[json["webLargeStyleType"]],
        mobileStyleType: json["mobileStyleType"] == null
            ? null
            : eStyleTypeValues.map[json["mobileStyleType"]],
      );

  Map<String, dynamic> toJson() => {
        "webLargeStyleType": webLargeStyleType == null
            ? null
            : eStyleTypeValues.reverse[webLargeStyleType],
        "mobileStyleType": mobileStyleType == null
            ? null
            : eStyleTypeValues.reverse[mobileStyleType],
      };
}

enum EStyleType { DARK, SALE, LIGHT, NO_TITLE, PREMIUM }

final eStyleTypeValues = EnumValues({
  "dark": EStyleType.DARK,
  "light": EStyleType.LIGHT,
  "noTitle": EStyleType.NO_TITLE,
  "premium": EStyleType.PREMIUM,
  "sale": EStyleType.SALE
});

enum Type { CONTAINER, LINK, A_TO_Z_BRANDS }

final typeValues = EnumValues({
  "aToZBrands": Type.A_TO_Z_BRANDS,
  "container": Type.CONTAINER,
  "link": Type.LINK
});

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
