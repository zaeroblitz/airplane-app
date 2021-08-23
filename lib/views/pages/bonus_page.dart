part of 'pages.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _bonusCard() {
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
                              'Zaero Blitz',
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
                                image: AssetImage('assets/icon_airplane.png'),
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
                        style:
                            smallSubtitleTextStyle.copyWith(color: kWhiteColor),
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
    }

    Widget _bigBonus() {
      return Column(
        children: [
          Text(
            'Big Bonus',
            style: bigTitleTextStyle,
          ),
          SizedBox(height: 10),
          Text(
            'We give you early credit so that \nyou can buy a flight ticket',
            style: regularSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          PrimaryButton(
            220,
            'Start Fly Now',
            AppRoutes.signInPage,
          ),
        ],
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bonusCard(),
              _bigBonus(),
            ],
          ),
        ),
      ),
    );
  }
}
