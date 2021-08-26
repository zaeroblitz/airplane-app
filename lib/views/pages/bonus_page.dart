part of 'pages.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
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
                              'IDR 280.000.000',
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
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget _bigBonus() {
      return Column(
        children: [
          Text(
            'Big Bonus 🎉',
            style: bigTitleTextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'We give you early credit so that \nyou can buy a flight ticket',
            style: regularSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    Widget _button() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.25),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ]),
        child: PrimaryButton(
          text: 'Start Fly Now',
          width: 225,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.mainPage, (route) => false);
          },
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _bonusCard(),
            _bigBonus(),
            _button(),
          ],
        ),
      ),
    );
  }
}
