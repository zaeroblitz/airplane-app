part of 'models.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final String id;
  final int amountOfTraveler;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int totalPrice;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOfTraveler = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.totalPrice = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      destination: DestinationModel.fromJson(
        json['destination']['id'],
        json['destination'],
      ),
      id: id,
      amountOfTraveler: json['amountOfTraveler'],
      selectedSeats: json['selectedSeats'],
      insurance: json['insurance'],
      refundable: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      totalPrice: json['total_price'],
    );
  }

  @override
  List<Object?> get props => [
        destination,
        amountOfTraveler,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        totalPrice,
      ];
}
