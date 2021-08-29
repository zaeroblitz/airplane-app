part of 'pages.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransactionModel transaction =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;

    Widget _header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 65,
              margin: EdgeInsets.only(
                left: 18,
                right: 18,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/illust_checkout_banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: regularTitleTextStyle,
                    ),
                    Text(
                      'Tangerang',
                      style: smallSubtitleTextStyle,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: regularTitleTextStyle,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      'Ciliwung',
                      style: smallSubtitleTextStyle,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget _checkoutDetails() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
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
            // Destination Cover, Location, Rating
            NewDestinationItem(transaction.destination),
            TransactionCard(transaction),
          ],
        ),
      );
    }

    Widget _paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(bottom: 30),
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
                  Text(
                    'Payment Details',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        margin: EdgeInsets.only(right: 16),
                        child: Stack(
                          children: [
                            Container(
                              width: 170,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/card_wallet.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: 6),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icon_airplane.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Pay',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                      locale: 'ID',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(state.user.balance),
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Current Wallet',
                              style: regularSubtitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget _payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            context.read<SeatCubit>().state.clear();
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.successCheckoutPage, (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kPinkColor,
            ));
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return SpinKitWanderingCubes(
              size: 50,
              color: kPrimaryColor,
              duration: Duration(seconds: 3),
            );
          }

          return Container(
            margin: EdgeInsets.only(bottom: 30),
            child: PrimaryButton(
              text: 'Pay Now',
              onPressed: () {
                context.read<TransactionCubit>().createTransaction(transaction);
              },
            ),
          );
        },
      );
    }

    Widget _termsAndCondition() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Center(
          child: Text(
            'Terms and Conditions',
            style: regularSubtitleTextStyle.copyWith(
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<SeatCubit>().state.clear();
        Navigator.pushNamed(context, AppRoutes.detailPage);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(
              top: 30,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  _checkoutDetails(),
                  _paymentDetails(),
                  _payButton(),
                  _termsAndCondition(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
