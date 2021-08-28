part of 'widgets.dart';

class SeatSelectItem extends StatelessWidget {
  final bool isAvailable;
  final String id;

  const SeatSelectItem({
    Key? key,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _isSelected = context.watch<SeatCubit>().isSelected(id);
    return isAvailable
        ? GestureDetector(
            onTap: () {
              context.read<SeatCubit>().selectSeat(id);
            },
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: _isSelected ? kPrimaryColor : kUnavailableColor,
                border: Border.all(
                  width: 2,
                  color: _isSelected ? kPrimaryColor : kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _isSelected
                  ? Center(
                      child: Text(
                        'YOU',
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          )
        : Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: kUnavailableColor,
              border: Border.all(
                width: 2,
                color: kUnavailableColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          );
  }
}
