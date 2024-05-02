import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/models/furniture_model.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/pages/shopping_cart_page.dart';
import 'package:rentaroo/providers/count_provider.dart';
import 'package:rentaroo/widgets/furniture_card.dart';
import 'package:badges/badges.dart' as badges;

class FurniturePage extends StatefulWidget {
  final String categoryName;
  const FurniturePage({super.key, required this.categoryName});

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  List<Furniture> _selectedFurniture = [];
  int _cartBadgeAmount = 0;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: _shoppingCartBadge(),
          ),
        ],
      ),
      body: FutureBuilder<List<Furniture>>(
        future: DatabaseHelper().getAllFurnitureByCategory(widget.categoryName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No hay mobiliario disponible en esta categoria');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Furniture furniture = snapshot.data![index];
                return FurnitureCard(
                  id: furniture.id,
                  category: furniture.category,
                  name: furniture.description,
                  stock: furniture.stock,
                  price: furniture.price,
                  imageFurniture:
                      'assets/images/${removeDiacritics(furniture.category.toLowerCase().replaceAll(" ", "_"))}/${furniture.image}',
                  //isSelected: _selectedFurniture.contains(
                  //    furniture), // Verifica si el mueble está en la lista de muebles seleccionados
                  // onSelectionChanged: (isSelected) {
                  //   setState(() {
                  //     if (isSelected) {
                  //       _selectedFurniture.add(furniture);
                  //       print(_selectedFurniture.toList());
                  //     } else {
                  //       _selectedFurniture.remove(furniture);
                  //     }
                  //   });
                  // },
                );
              },
            );
          }
        },
      ),
    );
  }

  _shoppingCartBadge() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShoppingCartPage(),
            ));
      },
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -10, end: -12),
        badgeAnimation: badges.BadgeAnimation.slide(),
        //showBadge: _selectedFurniture.isEmpty,
        badgeStyle: badges.BadgeStyle(badgeColor: color),
        badgeContent: Consumer<CountModel>(
          builder: (context, countModel, _) => Text(
              countModel.totalSelectedfurnitureCount().toString(),
              style: TextStyle(color: Colors.white)),
        ),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
