part of 'services.dart';

class TransactionService {
  CollectionReference _transactionRef =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionRef.add({
        'destination': transaction.destination.toJson(),
        'amountOfTraveler': transaction.amountOfTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'total_price': transaction.totalPrice,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await _transactionRef.get();

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
