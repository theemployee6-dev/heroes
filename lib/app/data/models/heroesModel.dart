// To parse this JSON data, do
//
//     final heroesModel = heroesModelFromMap(jsonString);

import 'dart:convert';

List<HeroesModel> heroesModelFromMap(String str) => List<HeroesModel>.from(json.decode(str).map((x) => HeroesModel.fromMap(x)));

String heroesModelToMap(List<HeroesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class HeroesModel {
    HeroesModel({
        this.id,
        this.name,
        this.slug,
        this.powerstats,
        this.appearance,
        this.biography,
        this.work,
        this.connections,
        this.images,
    });

    final int id;
    final String name;
    final String slug;
    final Powerstats powerstats;
    final Appearance appearance;
    final Biography biography;
    final Work work;
    final Connections connections;
    final Images images;

    factory HeroesModel.fromMap(Map<String, dynamic> json) => HeroesModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        powerstats: Powerstats.fromMap(json["powerstats"]),
        appearance: Appearance.fromMap(json["appearance"]),
        biography: Biography.fromMap(json["biography"]),
        work: Work.fromMap(json["work"]),
        connections: Connections.fromMap(json["connections"]),
        images: Images.fromMap(json["images"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "powerstats": powerstats.toMap(),
        "appearance": appearance.toMap(),
        "biography": biography.toMap(),
        "work": work.toMap(),
        "connections": connections.toMap(),
        "images": images.toMap(),
    };
}

class Appearance {
    Appearance({
        this.gender,
        this.race,
        this.height,
        this.weight,
        this.eyeColor,
        this.hairColor,
    });

    final Gender gender;
    final String race;
    final List<String> height;
    final List<String> weight;
    final String eyeColor;
    final String hairColor;

    factory Appearance.fromMap(Map<String, dynamic> json) => Appearance(
        gender: genderValues.map[json["gender"]],
        race: json["race"] == null ? null : json["race"],
        height: List<String>.from(json["height"].map((x) => x)),
        weight: List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eyeColor"],
        hairColor: json["hairColor"],
    );

    Map<String, dynamic> toMap() => {
        "gender": genderValues.reverse[gender],
        "race": race == null ? null : race,
        "height": List<dynamic>.from(height.map((x) => x)),
        "weight": List<dynamic>.from(weight.map((x) => x)),
        "eyeColor": eyeColor,
        "hairColor": hairColor,
    };
}

enum Gender { MALE, FEMALE, EMPTY }

final genderValues = EnumValues({
    "-": Gender.EMPTY,
    "Female": Gender.FEMALE,
    "Male": Gender.MALE
});

class Biography {
    Biography({
        this.fullName,
        this.alterEgos,
        this.aliases,
        this.placeOfBirth,
        this.firstAppearance,
        this.publisher,
        this.alignment,
    });

    final String fullName;
    final String alterEgos;
    final List<String> aliases;
    final String placeOfBirth;
    final String firstAppearance;
    final String publisher;
    final Alignment alignment;

    factory Biography.fromMap(Map<String, dynamic> json) => Biography(
        fullName: json["fullName"],
        alterEgos: json["alterEgos"],
        aliases: List<String>.from(json["aliases"].map((x) => x)),
        placeOfBirth: json["placeOfBirth"],
        firstAppearance: json["firstAppearance"],
        publisher: json["publisher"] == null ? null : json["publisher"],
        alignment: alignmentValues.map[json["alignment"]],
    );

    Map<String, dynamic> toMap() => {
        "fullName": fullName,
        "alterEgos": alterEgos,
        "aliases": List<dynamic>.from(aliases.map((x) => x)),
        "placeOfBirth": placeOfBirth,
        "firstAppearance": firstAppearance,
        "publisher": publisher == null ? null : publisher,
        "alignment": alignmentValues.reverse[alignment],
    };
}

enum Alignment { GOOD, BAD, EMPTY, NEUTRAL }

final alignmentValues = EnumValues({
    "bad": Alignment.BAD,
    "-": Alignment.EMPTY,
    "good": Alignment.GOOD,
    "neutral": Alignment.NEUTRAL
});

class Connections {
    Connections({
        this.groupAffiliation,
        this.relatives,
    });

    final String groupAffiliation;
    final String relatives;

    factory Connections.fromMap(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["groupAffiliation"],
        relatives: json["relatives"],
    );

    Map<String, dynamic> toMap() => {
        "groupAffiliation": groupAffiliation,
        "relatives": relatives,
    };
}

class Images {
    Images({
        this.xs,
        this.sm,
        this.md,
        this.lg,
    });

    final String xs;
    final String sm;
    final String md;
    final String lg;

    factory Images.fromMap(Map<String, dynamic> json) => Images(
        xs: json["xs"],
        sm: json["sm"],
        md: json["md"],
        lg: json["lg"],
    );

    Map<String, dynamic> toMap() => {
        "xs": xs,
        "sm": sm,
        "md": md,
        "lg": lg,
    };
}

class Powerstats {
    Powerstats({
        this.intelligence,
        this.strength,
        this.speed,
        this.durability,
        this.power,
        this.combat,
    });

    final int intelligence;
    final int strength;
    final int speed;
    final int durability;
    final int power;
    final int combat;

    factory Powerstats.fromMap(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"],
        strength: json["strength"],
        speed: json["speed"],
        durability: json["durability"],
        power: json["power"],
        combat: json["combat"],
    );

    Map<String, dynamic> toMap() => {
        "intelligence": intelligence,
        "strength": strength,
        "speed": speed,
        "durability": durability,
        "power": power,
        "combat": combat,
    };
}

class Work {
    Work({
        this.occupation,
        this.base,
    });

    final String occupation;
    final String base;

    factory Work.fromMap(Map<String, dynamic> json) => Work(
        occupation: json["occupation"],
        base: json["base"],
    );

    Map<String, dynamic> toMap() => {
        "occupation": occupation,
        "base": base,
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
