import 'dart:convert';

class CatalogueModel {
  

  static List<Item>? items;

  //Get Item by ID
  Item getById(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by Position
  Item getByPosition(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map["id"],
      map['name'],
      map['desc'],
      map["price"],
      map['color'],
      map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(dynamic source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}













































  // factory Items.fromMap(Map<dynamic, dynamic> map) {
  //   return Items(
  //     name: map["name"],
  //     id: map["id"],
  //     url: map["url"],
  //     price: map["price"],
  //     currency: map["currency"],
  //     image: map["image"],
  //   );
  // }

  // toMap() => {
  //       "name": name,
  //       "id": id,
  //       "url": url,
  //       "price": price,
  //       "currency": currency,
  //       "image": image,
  //     };

