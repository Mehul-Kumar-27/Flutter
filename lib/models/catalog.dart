class CatalogModel {
  static final products = [
    Items(
        name: "I phone 13th generation",
        id: "001",
        decs:
            "Apple's iPhone 13 features a ceramic shield front, Super Retina XDR display with True Tone and an A15 Bionic chip.",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRU5sKKFHBXe4VM6xNP3Badl3yrpwFTvvkVA&usqp=CAU")
  ];
}

class Items {
  final String name;
  final String id;
  final String decs;
  final num price;
  final String color;
  final String image;

  Items(
      {required this.name,
      required this.id,
      required this.decs,
      required this.price,
      required this.color,
      required this.image});
}
