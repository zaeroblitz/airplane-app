part of 'pages.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
              child: SpinKitWanderingCubes(
            size: 50,
            color: kPrimaryColor,
            duration: Duration(seconds: 3),
          ));
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text(
                'Kamu belum melakukan transaksi',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.transactions.length,
              padding: EdgeInsets.all(defaultMargin),
              itemBuilder: (_, index) {
                return Container(
                  margin: (index == state.transactions.length - 1)
                      ? EdgeInsets.only(bottom: 70)
                      : EdgeInsets.only(bottom: 30),
                  padding: EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NewDestinationItem(state.transactions[index].destination),
                      TransactionCard(state.transactions[index]),
                    ],
                  ),
                );
              },
            );
          }
        }

        if (state is TransactionFailed) {
          return Center(child: Text(state.error));
        }

        return Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
