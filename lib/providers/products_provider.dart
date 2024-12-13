import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shorts',
    price: 12,
    image: 'assets/products/shirt1.png',
    description:
        'These stylish Groovy Shorts are perfect for hot summer days. With a relaxed fit and breathable fabric, they keep you cool while maintaining a casual look. Ideal for casual outings or beach trips.',
  ),
  Product(
    id: '5',
    title: 'Drum & Sticks',
    price: 29,
    image: 'assets/products/top1.png',
    description:
        'Get ready to make some noise with this Drum & Sticks set. Perfect for beginners and intermediate drummers, this set provides all the essentials to start your drumming journey. Durable and great for practice!',
  ),
  Product(
    id: '9',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/kids1.png',
    description:
        'Start rocking with this high-quality Electric Guitar. Perfect for aspiring musicians, this guitar offers great sound quality and durability. Ideal for kids and beginners who are ready to explore their musical talent.',
  ),
  Product(
    id: '3',
    title: 'Denim Jeans',
    price: 54,
    image: 'assets/products/shirt3.png',
    description:
        'Classic Denim Jeans with a modern twist. Made with high-quality denim, these jeans provide a comfortable fit while maintaining a stylish look. Perfect for casual wear or dressing up for a night out.',
  ),
  Product(
    id: '6',
    title: 'Blue Suitcase',
    price: 44,
    image: 'assets/products/top2.png',
    description:
        'Travel in style with this durable Blue Suitcase. Designed for ease and convenience, it features spacious compartments and smooth wheels for easy transport. Ideal for short trips or long vacations.',
  ),
  Product(
    id: '2',
    title: 'Karati Kit',
    price: 34,
    image: 'assets/products/shirt2.png',
    description:
        'Everything you need to practice karate in one kit! This Karate Kit includes gloves, a belt, and other essentials to help you start your martial arts journey. Great for beginners looking to get into karate.',
  ),
  Product(
    id: '12',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/kids4.png',
    description:
        'A fantastic Electric Guitar for young musicians. Featuring high-quality construction and a sleek design, this guitar helps kids learn and play their favorite tunes with ease.',
  ),
  Product(
    id: '7',
    title: 'Roller Skates',
    price: 52,
    image: 'assets/products/top3.png',
    description:
        'Get rolling with these stylish and comfortable Roller Skates! With a smooth ride and adjustable fit, these skates are perfect for beginners and seasoned skaters alike. Ideal for outdoor fun and fitness.',
  ),
  Product(
    id: '4',
    title: 'Red Backpack',
    price: 14,
    image: 'assets/products/shirt4.png',
    description:
        'This vibrant Red Backpack is the perfect companion for school, work, or travel. With multiple pockets and a spacious interior, it offers plenty of room for all your essentials while adding a pop of color to your look.',
  ),
  Product(
    id: '10',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/kids2.png',
    description:
        'A kid-friendly Electric Guitar designed for aspiring musicians. With an easy-to-play design and durable materials, it’s perfect for children who want to learn and grow their musical skills.',
  ),
  Product(
    id: '11',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/kids3.png',
    description:
        'The Electric Guitar for kids who are ready to rock! This guitar features a child-friendly design with excellent sound quality, making it the perfect gift for young music lovers.',
  ),
  Product(
    id: '12',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top4.png',
    description:
        'This Electric Guitar combines great sound with an easy-to-play design, making it ideal for beginners and young players who want to learn and explore music.',
  ),
  Product(
    id: '13',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top6.png',
    description:
        'A great starter guitar for anyone looking to explore electric music. Featuring a smooth finish and great tone, this guitar makes playing easy and fun!',
  ),
  Product(
    id: '14',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top7.png',
    description:
        'Perfect for aspiring guitarists, this Electric Guitar is designed to provide a balanced sound and an easy-playing experience. Ideal for anyone starting their musical journey.',
  ),
  Product(
    id: '15',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top8.png',
    description:
        'Unleash your inner rockstar with this high-performance Electric Guitar. With a sleek design and top-notch sound, it’s perfect for players of all levels.',
  ),
  Product(
    id: '16',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top9.png',
    description:
        'An excellent choice for any musician, this Electric Guitar offers rich sound and exceptional playability. Its ergonomic design makes it easy to play for both beginners and experienced players.',
  ),
  Product(
    id: '17',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top5.png',
    description:
        'A versatile Electric Guitar designed for ultimate sound and style. Perfect for musicians looking to add a professional touch to their playing.',
  ),
  Product(
    id: '17',
    title: 'Electric Guitar',
    price: 79,
    image: 'assets/products/top10.png',
    description:
        'This Electric Guitar is built for performance. Featuring a unique design and exceptional sound, it’s ideal for musicians who want to stand out on stage.',
  ),
];

// Generated providers

@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> menShirtsProducts(ref) {
  return allProducts
      .where((p) => p.image.contains('shirt')) // Filter by image name pattern
      .toList();
}

List<Product> womenTopsProducts(ref) {
  return allProducts
      .where((p) => p.image.contains('top')) // Filter only "top" images
      .toList();
}

@riverpod
List<Product> kidsProducts(ref) {
  return allProducts
      .where((p) => p.image.contains('kids')) // Filter images for kids
      .toList();
}

@riverpod
List<Product> reducedProducts(ref) {
  return allProducts.where((p) => p.price < 50).toList();
}
