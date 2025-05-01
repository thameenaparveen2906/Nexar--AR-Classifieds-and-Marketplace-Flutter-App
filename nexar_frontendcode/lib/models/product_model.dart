import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final List<Color> colors;
  final double price;
  final String category;
  final double rate;
  int quantity;

  Product(
      {required this.title,
      required this.review,
      required this.description,
      required this.image,
      required this.price,
      required this.seller,
      required this.colors,
      required this.category,
      required this.rate,
      required this.quantity});
}

final List<Product> all = [
  Product(
    title: "Flower Pot Set",
    description: "Three piece flower pot set",
    image: "images/homedecor/decor2.jpg",
    price: 600,
    seller: "Love Seller",
    colors: [],
    category: "Home Decor",
    review: "(99 Reviews)",
    rate: 4.7,
    quantity: 1,
  ),
  Product(
    title: "iPhone 15 Pro Max ",
    description: "iPhone 15 Pro Max 512gb",
    image: "images/electronics/iphone.jpg",
    price: 150899,
    seller: "Love Store",
    colors: [],
    category: "Electronics & Gadgets",
    review: "(20 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
  Product(
    title: "Clock",
    description: "Wall decor clock",
    image: "images/homedecor/decor4.jpg",
    price: 659,
    seller: "Love Seller",
    colors: [],
    category: "Home Decor",
    review: "(99 Reviews)",
    rate: 4.7,
    quantity: 1,
  ),
  Product(
    title: "Sofa",
    description: "Living room sofa set",
    image: "images/furniture/sofa.jpg",
    price: 10000,
    seller: "Mrs Store",
    colors:[

    ],
    category: "Furniture",
    review: "(200 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
];

final List<Product> furniture = [
  Product(
    title: "Chair",
    description: "Black chair",
    image: "images/furniture/chair.jpg",
    price: 799,
    seller: "The Seller",
    colors:[

    ],
    category: "Furniture",
    review: "(55 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
  Product(
    title: "Sofa",
    description: "Living room sofa set",
    image: "images/furniture/sofa.jpg",
    price: 10000,
    seller: "Mrs Store",
    colors:[

    ],
    category: "Furniture",
    review: "(200 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
];

final List<Product> homeDecor = [
  Product(
    title: "Bathroom Decor Set",
    description: "6 piece bathroom decor set",
    image: "images/homedecor/decor1.jpg",
    price: 2299,
    seller: "Yojana Seller",
    colors: [],
    category: "Home Decor",
    review: "(200 Reviews)",
    rate: 4.0,
    quantity: 1,
  ),
  Product(
    title: "Flower Pot Set",
    description: "Three piece flower pot set",
    image: "images/homedecor/decor2.jpg",
    price: 799,
    seller: "Love Seller",
    colors: [],
    category: "Home Decor",
    review: "(99 Reviews)",
    rate: 4.7,
    quantity: 1,
  ),
  Product(
    title: "Candle - set of 2",
    description: "Aesthetic candles set of two",
    image: "images/homedecor/decor3.jpg",
    price: 399,
    seller: "Love Seller",
    colors: [],
    category: "Home Decor",
    review: "(99 Reviews)",
    rate: 4.7,
    quantity: 1,
  ),
  Product(
    title: "Clock",
    description: "Wall decor clock",
    image: "images/homedecor/decor4.jpg",
    price: 659,
    seller: "Love Seller",
    colors: [],
    category: "Home Decor",
    review: "(99 Reviews)",
    rate: 4.7,
    quantity: 1,
  ),
];

final List<Product> electronicsAndGadgets = [
  Product(
    title: "Washing Machine",
    description: "Front load washing machine",
    image: "images/electronics/washingmachine.jpg",
    price: 29990,
    seller: "Sila Store",
    colors: [],
    category: "Electronics & Gadgets",
    review: "(25 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
  Product(
    title: "TV",
    description: "Android TV",
    image: "images/electronics/tv.jpg",
    price: 16990,
    seller: "My Store",
    colors: [],
    category: "Electronics & Gadgets",
    review: "(100 Reviews)",
    rate: 4.0,
    quantity: 1,
  ),
  Product(
    title: "iPhone 15 Pro Max ",
    description: "iPhone 15 Pro Max 512gb",
    image: "images/electronics/iphone.jpg",
    price: 150899,
    seller: "Love Store",
    colors: [],
    category: "Electronics & Gadgets",
    review: "(20 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
];

final List<Product> autoMotive = [
  Product(
    title: "Royal Enfield Himalayan 450",
    description: "Royal enfield himalayan 450",
    image: "images/automotive/bike.jpg",
    price: 285000,
    seller: "Gold Store",
    colors: [],
    category: "Automotive",
    review: "(320 Reviews)",
    rate: 4.5,
    quantity: 1,
  ),
  Product(
    title: "Audi Q5 40 TDI 2019",
    description: "Audi Q5 40 TDI 2019",
    image: "images/automotive/car.jpg",
    price: 3245000,
    seller: "Love Love",
    colors: [],
    category: "Automotive",
    review: "(100 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
];
final List<Product> toysAndGames = [
  Product(
    title: "Teddy Bear",
    description: "Cute brown teddy bear",
    image: "images/toys/teddy1.jpg",
    price: 520,
    seller: "Men Store",
    colors: [],
    category: "Toys & Games",
    review: "(90 Reviews)",
    rate: 5.0,
    quantity: 1,
  ),
  Product(
    title: "Bow Teddy Bear",
    description: "Cute brown teddy bear with a bow",
    image: "images/toys/teddy2.jpg",
    price: 659,
    seller: "My Store",
    colors: [],
    category: "Toys & Games",
    review: "(500 Reviews)",
    rate: 4.5,
    quantity: 1,
  ),
  Product(
    title: "Soft toys - set of 3",
    description: "Three cute soft toys",
    image: "images/toys/softtoys.jpg",
    price: 350,
    seller: "Roman Store",
    colors: [],
    category: "Toys & Games",
    review: "(200 Reviews)",
    rate: 3.0,
    quantity: 1,
  ),
];
