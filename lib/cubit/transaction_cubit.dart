import 'package:airplane/models/models.dart';
import 'package:airplane/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction, UserModel user) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction, user);
      await UserService().update(user, (user.balance - transaction.price));
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactions(String id) async {
    try {
      emit(TransactionLoading());

      List<TransactionModel> transactions =
          await TransactionService().fetchTransactions(id);

      emit(TransactionSuccess(List.from(transactions)));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
