class ClinicModel {
    final bool? success;
    final Content? content;
    final String? message;
    final int? status;

    ClinicModel({
        this.success,
        this.content,
        this.message,
        this.status,
    });

    factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        success: json["success"],
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
        message: json["message"],
        status: json["status"],
    );

}

class Content {
    final List<Venue>? venues;
    final int? currentPage;
    final int? perPage;
    final int? lastPage;
    final int? total;

    Content({
        this.venues,
        this.currentPage,
        this.perPage,
        this.lastPage,
        this.total,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        venues: json["venues"] == null ? [] : List<Venue>.from(json["venues"]!.map((x) => Venue.fromJson(x))),
        currentPage: json["currentPage"],
        perPage: json["perPage"],
        lastPage: json["lastPage"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "venues": venues == null ? [] : List<dynamic>.from(venues!.map((x) => x.toJson())),
        "currentPage": currentPage,
        "perPage": perPage,
        "lastPage": lastPage,
        "total": total,
    };
}

class Venue {
    final int? id;
    final String? name;
    final String? description;
    final String? bio;
    final User? user;
    final City? city;
    final String? type;
    final String? specializationType;
    final String? gender;
    final int? teamNum;
    final DateTime? foundedIn;
    final String? location;
    final String? address;
    final String? latLocation;
    final String? longLocation;
    final String? phoneNumber;
    final String? facebookLink;
    final String? whatsappNumber;
    final String? instagramLink;
    final String? status;
    final int? isAvailable;
    final int? isOpen;
    final dynamic venueCode;
    final int? likes;
    final int? reviews;
    final int? rate;
    final String? profileImage;

    Venue({
        this.id,
        this.name,
        this.description,
        this.bio,
        this.user,
        this.city,
        this.type,
        this.specializationType,
        this.gender,
        this.teamNum,
        this.foundedIn,
        this.location,
        this.address,
        this.latLocation,
        this.longLocation,
        this.phoneNumber,
        this.facebookLink,
        this.whatsappNumber,
        this.instagramLink,
        this.status,
        this.isAvailable,
        this.isOpen,
        this.venueCode,
        this.likes,
        this.reviews,
        this.rate,
        this.profileImage,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        bio: json["bio"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        type: json["type"],
        specializationType: json["specializationType"],
        gender: json["gender"],
        teamNum: json["teamNum"],
        foundedIn: json["foundedIn"] == null ? null : DateTime.parse(json["foundedIn"]),
        location: json["location"],
        address: json["address"],
        latLocation: json["latLocation"],
        longLocation: json["longLocation"],
        phoneNumber: json["phoneNumber"],
        facebookLink: json["facebookLink"],
        whatsappNumber: json["whatsappNumber"],
        instagramLink: json["instagramLink"],
        status: json["status"],
        isAvailable: json["isAvailable"],
        isOpen: json["isOpen"],
        venueCode: json["venueCode"],
        likes: json["likes"],
        reviews: json["reviews"],
        rate: json["rate"],
        profileImage: json["profileImage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "bio": bio,
        "user": user?.toJson(),
        "city": city?.toJson(),
        "type": type,
        "specializationType": specializationType,
        "gender": gender,
        "teamNum": teamNum,
        "foundedIn": "${foundedIn!.year.toString().padLeft(4, '0')}-${foundedIn!.month.toString().padLeft(2, '0')}-${foundedIn!.day.toString().padLeft(2, '0')}",
        "location": location,
        "address": address,
        "latLocation": latLocation,
        "longLocation": longLocation,
        "phoneNumber": phoneNumber,
        "facebookLink": facebookLink,
        "whatsappNumber": whatsappNumber,
        "instagramLink": instagramLink,
        "status": status,
        "isAvailable": isAvailable,
        "isOpen": isOpen,
        "venueCode": venueCode,
        "likes": likes,
        "reviews": reviews,
        "rate": rate,
        "profileImage": profileImage,
    };
}

class City {
    final int? id;
    final String? name;

    City({
        this.id,
        this.name,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class User {
    final int? id;
    final String? name;
    final String? lastName;
    final String? email;
    final String? phone;
    final String? image;
    final City? city;

    User({
        this.id,
        this.name,
        this.lastName,
        this.email,
        this.phone,
        this.image,
        this.city,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        city: json["city"] == null ? null : City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "image": image,
        "city": city?.toJson(),
    };
}
