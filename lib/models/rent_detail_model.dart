class RentDetail {
  int? id;
  int rentId;
  int furnitureId;
  int quantity;

  RentDetail(
      {this.id,
      required this.rentId,
      required this.furnitureId,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'id_detail': id,
      'id_rent': rentId,
      'id_furniture': furnitureId,
      'quantity': quantity,
    };
  }

  factory RentDetail.fromMap(Map<String, dynamic> map) {
    return RentDetail(
        id: map['id'],
        rentId: map['rentId'],
        furnitureId: map['furnitureId'],
        quantity: map['quantity']);
  }
}
