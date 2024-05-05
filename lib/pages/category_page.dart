import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/pages/furniture_page.dart';
import 'package:rentaroo/pages/shopping_cart_page.dart';
import 'package:rentaroo/providers/count_provider.dart';
import 'package:rentaroo/widgets/category_card.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CategoryCard(
            categoryName: 'Sillas',
            categoryImage: 'assets/images/categorias/sillas.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FurniturePage(
                    categoryName: 'Sillas',
                  ),
                ),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Mesas',
            categoryImage: 'assets/images/categorias/mesas.jpeg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FurniturePage(
                    categoryName: 'Mesas',
                  ),
                ),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Menaje Y Vajillas',
            categoryImage: 'assets/images/categorias/menaje_y_vajillas.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FurniturePage(
                    categoryName: 'Menaje Y Vajillas',
                  ),
                ),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Mantelería',
            categoryImage: 'assets/images/categorias/manteleria.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FurniturePage(
                    categoryName: 'Mantelería',
                  ),
                ),
              );
            },
          ),
          CategoryCard(
            categoryName: 'Cubertería',
            categoryImage: 'assets/images/categorias/cuberteria.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FurniturePage(
                    categoryName: 'Cubertería',
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          _navigatorToCart(),
        ],
      ),
    );
  }

  _navigatorToCart() {
    return Consumer<CountModel>(builder: (context, countModel, _) {
      List<SelectedFurnitureItem> selectedFurnitureItem =
          countModel.getSelectedFurnitureList();
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: selectedFurnitureItem.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShoppingCartPage(),
                        ),
                      );
                    }
                  : null,
              child: Text('Ir al carrito'),
            ),
          ],
        ),
      );
    });
  }
}
