import 'package:flutter/material.dart';
import 'package:polyapp/pages/market/boutique_items.dart';
import 'package:polyapp/pages/market/boutique_wrap.dart';
import 'package:polyapp/pages/market/collection.dart';
import 'package:polyapp/util/constante.dart';
import 'package:polyapp/util/ept_button.dart';

class Market extends StatefulWidget {
  const Market({super.key});

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  final List<String> carouselImages = [
    'assets/images/market/photo_2024-05-24_12-27-39.jpg',
    'assets/images/market/photo_2024-05-24_12-27-53.jpg',
    'assets/images/market/photo_2024-05-24_12-27-08.jpg',
    'assets/images/market/photo_2024-05-24_12-28-09.jpg',
  ];

  String selectedCategory = 'Tous';
  List<String> categories = [
    'Tous',
    'Tasse',
    'Bloc-Notes',
    'Porte-Clé',
    'Gourde'
  ];
  String searchQuery = '';

  List<Map<String, dynamic>> getFilteredProducts() {
    List<Map<String, dynamic>> filteredProducts = List.from(products);

    // Trier les produits commandés en premier
    filteredProducts.sort((a, b) {
      if (a['commande'] == b['commande']) return 0;
      if (a['commande']) return -1;
      return 1;
    });

    return filteredProducts.where((product) {
      bool categoryMatch = selectedCategory == 'Tous' ||
          product['categorie'] == selectedCategory;
      bool searchMatch =
          product['produit'].toLowerCase().contains(searchQuery.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList();
  }

  void _showProductDetails(Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(product['image_path'] ?? '', height: 200),
              const SizedBox(height: 10),
              Text(product['produit'] ?? '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Catégorie: ${product['categorie'] ?? ''}'),
              Text('Prix: ${product['prix'] ?? ''} CFA'),
              const SizedBox(height: 10),
              Text(product['description'] ?? ''),
              const SizedBox(height: 20),
              ElevatedButton(
                child:
                    Text(product['commande'] == true ? 'Retirer' : 'Commander'),
                onPressed: () {
                  setState(() {
                    product['commande'] = !(product['commande'] ?? false);
                  });
                  Navigator.of(context).pop();
                  _showOrderConfirmation(product['commande'] ?? false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showOrderConfirmation(bool isOrdered) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/checked.png', height: 100),
              const SizedBox(height: 20),
              Text(
                isOrdered
                    ? 'Commande passée avec succès'
                    : 'Commande retirée avec succès',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 600,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  "assets/market/photo2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 130,
                    decoration: BoxDecoration(
                        color: eptLightOrange,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nouvelle Collection",
                          style: TextStyle(
                              fontFamily: "League Gothic",
                              fontWeight: FontWeight.w600,
                              fontSize: 30),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/market/tupperware.png",
                              scale: 5,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "4 pièces",
                              style:
                                  TextStyle(fontFamily: "Inter", fontSize: 12),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Image.asset(
                              "assets/market/revendeur.png",
                              scale: 5,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "BDE",
                              style:
                                  TextStyle(fontFamily: "Inter", fontSize: 12),
                            )
                          ],
                        ),
                        const Spacer(),
                        Center(
                            child: EptButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Collection(
                                          title: "Blousons 2024",
                                          subtitle: "Classe Polytechnicienne",
                                        )));
                          },
                          title: "Voir tout",
                          width: MediaQuery.of(context).size.width / 1.3,
                          height: 30,
                          color: Colors.black,
                          icon: Image.asset(
                            "assets/market/jouer.png",
                            scale: 7,
                          ),
                          borderRadius: 5,
                        ))
                      ],
                    ),
                  ))
            ]),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Boutique-Polytech",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Nouveauté",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: Icon(Icons.search,
                            color: Color(0xff777777), size: 20),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Chercher',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xff777777),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return categories.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: [
                        const Text(
                          'Catégories',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/categorie.png",
                          scale: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                List<Map<String, dynamic>> filteredProducts =
                    getFilteredProducts();

                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 30,
                      childAspectRatio: 190/260
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () => _showProductDetails(product),
                        child: BoutiqueItems(
                          imagePath: product['image_path'],
                          title: product['produit'],
                          price: product['prix'],
                          isOrdered: product['commande'],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    ));
  }
}

final List<Map<String, dynamic>> products = [
  {
    'produit': 'Tasse en Céramique',
    'categorie': 'Tasse',
    'prix': '3000',
    'image_path': 'assets/images/market/tasse_50aire.png',
    'description':
        'Une tasse en céramique élégante et durable, parfaite pour vos boissons chaudes préférées.',
    'commande': false,
  },
  {
    'produit': 'Bloc-Notes Écologique',
    'categorie': 'Bloc-Notes',
    'prix': '2000',
    'image_path': 'assets/images/market/bloc_note.png',
    'description':
        'Un bloc-notes fabriqué à partir de matériaux recyclés, idéal pour prendre des notes tout en respectant l\'environnement.',
    'commande': false,
  },
  {
    'produit': 'Porte-Clé en Bois',
    'categorie': 'Porte-Clé',
    'prix': '1500',
    'image_path': 'assets/images/market/porte_cle.png',
    'description':
        'Un porte-clé élégant en bois naturel, léger et résistant pour garder vos clés organisées.',
    'commande': false,
  },
  {
    'produit': 'Gourde Isotherme',
    'categorie': 'Gourde',
    'prix': '5000',
    'image_path': 'assets/images/market/gourde.png',
    'description':
        'Une gourde isotherme de haute qualité qui maintient vos boissons chaudes ou froides pendant des heures.',
    'commande': false,
  },
  {
    'produit': 'Tasse à Café Vintage',
    'categorie': 'Tasse',
    'prix': '3500',
    'image_path': 'assets/images/market/tasse_50aire_2.png',
    'description':
        'Une tasse à café au design rétro, parfaite pour ajouter une touche de nostalgie à votre pause café.',
    'commande': false,
  },
  {
    'produit': 'Carnet de Voyage',
    'categorie': 'Bloc-Notes',
    'prix': '2500',
    'image_path': 'assets/images/market/bloc_note.png',
    'description':
        'Un carnet élégant pour consigner vos aventures et souvenirs de voyage.',
    'commande': false,
  },
];
