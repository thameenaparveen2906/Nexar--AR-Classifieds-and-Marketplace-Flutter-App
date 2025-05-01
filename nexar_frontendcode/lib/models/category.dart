class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "All",
    image: "images/all.jpg",
  ),
  Category(
    title: "Furniture",
    image: "images/furniture.jpg",
  ),
  Category(
    title: "Home \nDecor",
    image: "images/homedecor.jpg",
  ),
  Category(
    title: "Electronics \n& Gadgets",
    image: "images/electronics.jpg",
  ),
  Category(
    title: "Automotive",
    image: "images/automotive.jpg",
  ),
  Category(
    title: "Toys &\nGames",
    image: "images/toy.jpg",
  ),
];
