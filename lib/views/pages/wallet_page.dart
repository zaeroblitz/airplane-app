part of 'pages.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 38 * 2,
              height: 200,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/card_wallet.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Name
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: smallSubtitleTextStyle.copyWith(
                                      color: kWhiteColor,
                                    ),
                                  ),
                                  Text(
                                    state.user.name,
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: medium,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icon_airplane.png'),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                        // Balance
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Balance',
                              style: smallSubtitleTextStyle.copyWith(
                                  color: kWhiteColor),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'ID',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(state.user.balance),
                              style: whiteTextStyle.copyWith(
                                fontSize: 26,
                                fontWeight: medium,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
