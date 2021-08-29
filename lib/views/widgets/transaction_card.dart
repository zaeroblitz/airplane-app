part of 'widgets.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Details',
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),

        // Traveler
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('Traveler'),
              Text(
                '${transaction.amountOfTraveler}',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),

        // Seat
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('Seat'),
              SizedBox(width: 70),
              Expanded(
                child: Text(
                  transaction.selectedSeats,
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),

        // Insurance
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('Insurance'),
              Text(
                transaction.insurance ? 'YES' : 'NO',
                style: transaction.insurance
                    ? greenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      )
                    : pinkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
              ),
            ],
          ),
        ),

        // Refundable
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('Refundable'),
              Text(
                transaction.refundable ? 'YES' : 'NO',
                style: transaction.refundable
                    ? greenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      )
                    : pinkTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
              ),
            ],
          ),
        ),

        // VAT
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('VAT'),
              Text(
                '${(transaction.vat * 100).toInt()}%',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),

        // Price
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('Price'),
              Text(
                NumberFormat.currency(
                        locale: 'ID', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.price),
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),

        // Grand Total
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InterestItem('Price'),
              Text(
                NumberFormat.currency(
                        locale: 'ID', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.totalPrice),
                style: purpleTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
