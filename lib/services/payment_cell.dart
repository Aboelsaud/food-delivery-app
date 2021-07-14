import '../app.dart';

class PaymentCell extends StatefulWidget {
  final int index;
  final Function makeFalse;
  PaymentCell(this.index, this.makeFalse);
  @override
  _PaymentCellState createState() => _PaymentCellState();
}

class _PaymentCellState extends State<PaymentCell> {
  @override
  Widget build(BuildContext context) {
    var image = Checkbox(
        value: checkbox[widget.index],
        onChanged: (bool) {
          setState(() {
            widget.makeFalse();
            checkbox[widget.index] = !checkbox[widget.index];
          });
        });
    var detail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "2779 Church Street",
          style: TextStyle(
            fontSize: 13,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Text(
          "Brookyln, NY T1234",
          style: TextStyle(
            fontSize: 13,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.makeFalse();
            checkbox[widget.index] = !checkbox[widget.index];
          });
        },
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: (checkbox[widget.index]) ? 20 : 0,
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
            child: Row(
              children: [
                image,
                SizedBox(width: 30),
                detail,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
