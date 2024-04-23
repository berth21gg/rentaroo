import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentaroo/pages/furniture_page.dart';
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
        title: Text('Categories'),
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
        ],
      ),
    );
  }
}
