import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/providers/count_provider.dart';
import 'package:rentaroo/widgets/shopping_cart_item.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
        centerTitle: true,
      ),
      body: Consumer<CountModel>(
        builder: (context, countModel, _) {
          List<SelectedFurnitureItem> selectedFurnitureList =
              countModel.getSelectedFurnitureList();

          return ListView.builder(
            itemCount: selectedFurnitureList.length,
            itemBuilder: (context, index) {
              SelectedFurnitureItem item = selectedFurnitureList[index];
              return ShoppingCartItem(
                  description: item.furniture.description,
                  price: item.furniture.price,
                  imageFurniture: item.furniture.image,
                  quantity: item.count);
            },
          );
        },
      ),
    );
  }
}
