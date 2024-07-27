class Food{

  final String name;              // Charcoal brisket
  final String description;       // slow cooked seadoned brisket
  final String imagePath;         // lib/images/brisket.png
  final double price;             // 17.99
  final FoodCategory category;    // brisket
  List<Addon> availableAddons;    // [extra sauce]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,

  });
}

//categories

enum FoodCategory{

  briskets,
  sandwiches,
  sides,
  desserts,
  drinks,
}

//food addons
class Addon{
  String name;
  double price;

  Addon({
    required this.name, 
    required this.price,
  });
}