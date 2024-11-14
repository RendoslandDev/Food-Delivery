import 'package:delivery/data/categories.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final FoodCategory foodCategory;
  const FoodCard({super.key, required this.foodCategory});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            // height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 1),
              Center(
                child: Hero(
                  tag: foodCategory.image,
                  child: Image.asset(
                    foodCategory.image,
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    foodCategory.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    foodCategory.type,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const Icon(Icons.notifications_none, color: Colors.grey)
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${foodCategory.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ]),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
