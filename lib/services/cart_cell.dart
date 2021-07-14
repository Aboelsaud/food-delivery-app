import '../app.dart';

class CartCell extends StatefulWidget {
  final Function calculate;
  final String title;
  final String price;
  final int index;
  final Function removeItem;
  CartCell(this.calculate, this.title, this.price, this.index, this.removeItem);
  @override
  _CartCellState createState() => _CartCellState();
}

class _CartCellState extends State<CartCell> {
  double total = 6.90;
  double quantity = 1.0;
  double price = 6.90;
  bool setPrice = false;

  @override
  Widget build(BuildContext context) {
    (!setPrice)
        // ignore: unnecessary_statements
        ? {
            total = double.parse(widget.price),
            price = double.parse(widget.price),
            setPrice = true
          }
        : setPrice = true;
    Widget count(IconData icon, int index) {
      return InkWell(
        onTap: () {
          setState(() {
            (index == 0)
                ? (quantity == 1)
                    // ignore: unnecessary_statements
                    ? {
                        cartList.removeAt(widget.index),
                        cartCount--,
                        widget.removeItem(double.parse(widget.price), quantity)
                      }
                    // ignore: unnecessary_statements
                    : {quantity--, total -= price, widget.calculate(price, 0)}
                // ignore: unnecessary_statements
                : {quantity++, total += price, widget.calculate(price, 1)};
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 13,
          ),
        ),
      );
    }

    var image = Image.asset(
      "assets/burgerIcon.png",
      width: 90,
      height: 90,
    );
    var detail = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "\$ " + widget.price,
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );

    var countPrice = Column(
      children: [
        Row(
          children: [
            count(Icons.remove, 0),
            SizedBox(width: 7),
            Text(quantity.toString()),
            SizedBox(width: 7),
            count(Icons.add, 1),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "\$" + total.toStringAsFixed(2),
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ],
    );
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.redAccent,
        ),
        child: Text(
          "DELETE",
          style: TextStyle(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
      onDismissed: (DismissDirection direction) {
        setState(() {
          cartList.removeAt(widget.index);
          cartCount--;
          widget.removeItem(double.parse(widget.price), quantity);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            image,
            SizedBox(width: 15),
            detail,
            countPrice,
          ],
        ),
      ),
    );
  }
}
