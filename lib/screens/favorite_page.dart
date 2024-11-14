import 'package:delivery/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finaList = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          height: 40,
          width: 102,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "images/flowerdark.jpeg",
                  width: 30,
                  isAntiAlias: true,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "favorite",
                style: GoogleFonts.dancingScript(
                    color: Colors.black, fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finaList.length,
              itemBuilder: (context, index) {
                final favoriteItems = finaList[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(favoriteItems.image),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoriteItems.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  favoriteItems.type,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.grey.shade400),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "\$${favoriteItems.price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                finaList.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 22,
                                color: Colors.red,
                              )),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
