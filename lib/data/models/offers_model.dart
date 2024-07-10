

class OffersModel {
    final List<Offer>? offers;

    OffersModel({
        this.offers,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class Offer {
    final int? id;
    final String? title;
    final String? description;
    final int? likes;
    final int? reviews;
    final int? rate;
    final List<dynamic>? gallery;

    Offer({
        this.id,
        this.title,
        this.description,
        this.likes,
        this.reviews,
        this.rate,
        this.gallery,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        likes: json["likes"],
        reviews: json["reviews"],
        rate: json["rate"],
        gallery: json["gallery"] == null ? [] : List<dynamic>.from(json["gallery"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "likes": likes,
        "reviews": reviews,
        "rate": rate,
        "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x)),
    };
}
