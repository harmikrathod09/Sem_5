import 'package:get/get.dart';
import 'animation_model.dart';

class AnimationControll extends GetxController {
  RxList<AnimationModel> items = [
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/617qpVq-PCL._SY695_.jpg",
          title: "Nike Air Shoes",
          subtitle: "Experience comfort and style with our premium shoes.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/71wXX5IRnzL._SX522_.jpg",
          title: "Smart Watch",
          subtitle: "Track your health and stay connected on the go.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/416e1B8V75L._SY300_SX300_QL70_FMwebp_.jpg ",
          title: "MacBook Pro",
          subtitle: "Powerful performance for developers and creators.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/31xdwGWyB6L._SY300_SX300_QL70_FMwebp_.jpg",
          title: "iPhone 17",
          subtitle: "Capture life’s moments with stunning clarity.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/61-8u1fXChL._SX522_.jpg",
          title: "Wireless Headphones",
          subtitle: "Immersive sound with noise cancellation.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/41po0Y8FRnL._SX300_SY300_QL70_FMwebp_.jpg",
          title: "DSLR Camera",
          subtitle: "Capture professional quality photos and videos.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/61fpW-74xTL._SX679_.jpg",
          title: "Graphic T-Shirt",
          subtitle: "Soft cotton with trendy design for daily wear.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/31XSvKf9VKL._SY300_SX300_QL70_FMwebp_.jpg",
          title: "Travel Backpack",
          subtitle: "Spacious and durable bag for all your adventures.",
        ),
        AnimationModel(
          image: "assets/images/glasses.json",
          title: "Sunglasses",
          subtitle: "Stylish UV protection eyewear for sunny days.",
        ),
        AnimationModel(
          image: "assets/images/perfume.json",
          title: "Luxury Perfume",
          subtitle: "A long-lasting fragrance to boost your confidence.",
        ),
        AnimationModel(
          image: "assets/images/sofa.json",
          title: "Leather Sofa",
          subtitle: "Elegant and comfortable furniture for your home.",
        ),
        AnimationModel(
          image: "assets/images/bike.json",
          title: "Mountain Bike",
          subtitle: "Durable design for rough terrains and adventures.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/51pdSwLbMCL._SY300_SX300_QL70_FMwebp_.jpgx",
          title: "Smart LED TV",
          subtitle: "Enjoy movies and shows in stunning 4K resolution.",
        ),
        AnimationModel(
          image: "https://m.media-amazon.com/images/I/61QPfVTmaqL.jpg",
          title: "Refrigerator",
          subtitle: "Energy-efficient cooling with large storage space.",
        ),
        AnimationModel(
          image: "assets/images/microwave.json",
          title: "Microwave Oven",
          subtitle: "Quick and easy cooking with multiple presets.",
        ),
      ].obs;

}
