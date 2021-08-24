part of 'pages.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 30,
        ),
        child: Text(
          'Select Your \nFavourite Seat',
          style: regularTitleTextStyle,
        ),
      );
    }

    Widget _seatStatus() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            SeatStatusItem(
              fillColor: kUnavailableColor,
              borderColor: kPrimaryColor,
              seatStatus: 'Available',
            ),
            SeatStatusItem(
              fillColor: kPrimaryColor,
              borderColor: kPrimaryColor,
              seatStatus: 'Selected',
            ),
            SeatStatusItem(),
          ],
        ),
      );
    }

    Widget _selectSeat() {
      Widget _seatAlphabet() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SeatIndicatorItem(indicator: 'A'),
            SeatIndicatorItem(indicator: 'B'),
            SeatIndicatorItem(),
            SeatIndicatorItem(indicator: 'C'),
            SeatIndicatorItem(indicator: 'D'),
          ],
        );
      }

      Widget _seatItem() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Line 1
            SeatLineItem(
              line: 1,
              widgets: [
                SeatSelectItem(isAvailable: false),
                SeatSelectItem(isAvailable: false),
                SeatIndicatorItem(indicator: '1'),
                SeatSelectItem(),
                SeatSelectItem(),
              ],
            ),

            // Line 2
            SeatLineItem(
              line: 2,
              widgets: [
                SeatSelectItem(),
                SeatSelectItem(),
                SeatIndicatorItem(indicator: '2'),
                SeatSelectItem(),
                SeatSelectItem(),
              ],
            ),

            // Line 3
            SeatLineItem(
              line: 3,
              widgets: [
                SeatSelectItem(),
                SeatSelectItem(),
                SeatIndicatorItem(indicator: '3'),
                SeatSelectItem(),
                SeatSelectItem(),
              ],
            ),

            // Line 4
            SeatLineItem(
              line: 4,
              widgets: [
                SeatSelectItem(),
                SeatSelectItem(),
                SeatIndicatorItem(indicator: '4'),
                SeatSelectItem(),
                SeatSelectItem(),
              ],
            ),

            // Line 5
            SeatLineItem(
              line: 5,
              widgets: [
                SeatSelectItem(),
                SeatSelectItem(),
                SeatIndicatorItem(indicator: '5'),
                SeatSelectItem(isAvailable: false),
                SeatSelectItem(isAvailable: false),
              ],
            ),
          ],
        );
      }

      Widget _selectedSeat() {
        return Container(
          margin: EdgeInsets.only(
            top: 30,
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Your Seat', style: smallSubtitleTextStyle),
              ),
              Container(
                width: (MediaQuery.of(context).size.width - (24 * 4)) / 1.75,
                child: Text(
                  'A3, B3',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        );
      }

      Widget _totalPrice() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: smallSubtitleTextStyle,
            ),
            Text(
              'IDR 540.000.000',
              style: purpleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            )
          ],
        );
      }

      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            _seatAlphabet(),
            _seatItem(),
            _selectedSeat(),
            _totalPrice(),
          ],
        ),
      );
    }

    Widget _continueCheckoutButton() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: PrimaryButton(
          text: 'Continue to Checkout',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.mainPage);
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _seatStatus(),
                _selectSeat(),
                _continueCheckoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
