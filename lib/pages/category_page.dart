import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';
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
  Rent lastRent = Rent(
      title: '',
      startDate: DateTime.now(),
      dueDate: DateTime.now(),
      reminderDate: DateTime.now(),
      state: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLastRent();
  }

  Future<void> loadLastRent() async {
    try {
      Rent? rent = await DatabaseHelper().getLastRent();
      setState(() {
        lastRent = rent!;
      });
    } catch (e) {
      print('Error loading last rent: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Cancelar Registro'),
                content: const Text('¿Desea cancelar el registro de la renta?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'No'),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context, 'Si');
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                      try {
                        provider.deleteAllItemFromSelectedList();
                      } catch (e) {
                        print('Hubo un problema al limpiar el carrito: $e');
                      }
                      // Eliminar registro de renta
                      await DatabaseHelper().deleteRent(lastRent.id!);
                    },
                    child: const Text('Si'),
                  ),
                ],
              ),
            ).then((value) {
              if (value != null && value == 'Si') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: const Text('Registro cancelado'),
                    action: SnackBarAction(
                        textColor: Theme.of(context).primaryColor,
                        label: 'OK',
                        onPressed: () {}),
                  ),
                );
              }
            });
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
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
