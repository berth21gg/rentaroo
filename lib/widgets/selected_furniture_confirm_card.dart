import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/providers/count_provider.dart';
import 'package:rentaroo/widgets/shopping_cart_item.dart';

class SelectedFurnitureConfirmCard extends StatelessWidget {
  const SelectedFurnitureConfirmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<CountModel>(
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
        ),
      ),
    );
  }
}
