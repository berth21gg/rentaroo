// Modelo que contiene el estado del contador
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:rentaroo/models/furniture_model.dart';

class SelectedFurnitureItem {
  final Furniture furniture;
  int count;

  SelectedFurnitureItem(this.furniture, this.count);
}

class CountModel extends ChangeNotifier {
  final Map<String, int> _countMap = {};
  List<SelectedFurnitureItem> _selectedFurnitureList =
      []; // Lista para almacenar el mobiliario seleccionado

  int getCountForFurniture(String furnitureName) {
    return _countMap.containsKey(furnitureName) ? _countMap[furnitureName]! : 0;
  }

  void setCountForFurniture(
      String furnitureName, int value, Furniture furniture) {
    // Guarda el valor anterior del contador
    int oldValue = getCountForFurniture(furnitureName);

    // Actualiza el valor del contador
    _countMap[furnitureName] = value;

    // Si el valor del contador cambipó de 0 a un valor mayor que 0,
    // agrega el mueble correspondiente a la lista de muebles seleccionados
    if (value > 0) {
      // verificar si el mueble ya está en la lista
      SelectedFurnitureItem? existingItem =
          _selectedFurnitureList.firstWhereOrNull(
              (item) => item.furniture.description == furnitureName);

      // Si el mueble ya está en la lista, actualizar su valor
      if (existingItem != null) {
        existingItem.count = value.toInt();
      } else {
        SelectedFurnitureItem itemToAdd =
            SelectedFurnitureItem(furniture, value.toInt());
        _selectedFurnitureList.add(itemToAdd);
      }
    }

    // Si el valor del contador cambío de un valor mayor que 0 a 0,
    // elimina el mueble correspondiente de la lista de muebles seleccionados
    if (value == 0 && oldValue > 0) {
      _selectedFurnitureList
          .removeWhere((item) => item.furniture.description == furnitureName);
    }

    printSelectedFurnitureList();
    notifyListeners();
  }

  // Método para eliminar un item de la lista del carrito
  void deleteItemForSelectedList(String furnitureName) {
    SelectedFurnitureItem? furnitureSelected =
        _selectedFurnitureList.firstWhereOrNull(
            (item) => item.furniture.description == furnitureName);
    _selectedFurnitureList
        .removeWhere((item) => item.furniture.description == furnitureName);
    setCountForFurniture(furnitureName, 0, furnitureSelected!.furniture);
    notifyListeners();
  }

  // Método para eliminar todos los items de la lista de carrito
  void deleteAllItemFromSelectedList() {
    List<SelectedFurnitureItem> furnitureListCopy = List.from(
        _selectedFurnitureList); // Copia para iterar sobre esta y modificar la original
    for (var item in furnitureListCopy) {
      setCountForFurniture(item.furniture.description, 0, item.furniture);
      getSelectedFurnitureList().removeWhere((element) =>
          element.furniture.description == item.furniture.description);
    }
    notifyListeners();
  }

  int totalSelectedfurnitureCount() {
    int totalCount = 0;
    _countMap.forEach((key, value) {
      totalCount += value;
    });
    return totalCount;
  }

  // Método para imprimir la lista
  void printSelectedFurnitureList() {
    _selectedFurnitureList.forEach((item) {
      print("- ${item.furniture.description}: ${item.count}");
    });
    print("=========================");
  }

  // Getter para obtener la lista de muebles seleccionados
  List<SelectedFurnitureItem> getSelectedFurnitureList() {
    return _selectedFurnitureList;
  }
}
