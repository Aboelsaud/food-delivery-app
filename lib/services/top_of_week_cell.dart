import '../app.dart';

class TopOfWeekCell extends StatefulWidget {
  final Function cartCount;
  final String title;
  final String subtitle;
  final String time;
  final String price;
  final String image;
  TopOfWeekCell(
    this.cartCount,
    this.title,
    this.subtitle,
    this.time,
    this.price,
    this.image,
  );
  @override
  _TopOfWeekCellState createState() => _TopOfWeekCellState();
}

class _TopOfWeekCellState extends State<TopOfWeekCell> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool smallScreen = (size.height <= 750);

    var image = Image.asset(
      widget.image,
      fit: BoxFit.cover,
      width: size.width / 4,
      height: 100,
    );

    var details = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: (smallScreen) ? 18 : 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: (smallScreen) ? 3 : 5),
          Text(
            widget.subtitle,
            style: TextStyle(
              fontSize: (smallScreen) ? 12 : 13,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(height: (smallScreen) ? 3 : 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.lock_clock, size: 20),
              SizedBox(width: 2),
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: (smallScreen) ? 12 : 13,
                  color: Colors.black.withOpacity(0.78),
                ),
              ),
            ],
          ),
          SizedBox(height: (smallScreen) ? 5 : 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "\$ " + widget.price,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  (quantity > 0)
                      ? Container(
                          alignment: Alignment.center,
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.orangeAccent,
                          ),
                          child: Text(quantity.toString()),
                        )
                      : Text(""),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    quantity++;
                  });

                  widget.cartCount();
                  subtotal += double.parse(widget.price);
                  total += double.parse(widget.price);
                  cartList.add(Item(title: widget.title, price: widget.price));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.orangeAccent,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    FoodItem(widget.title, widget.subtitle, widget.price)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          children: [
            image,
            SizedBox(width: 20),
            details,
          ],
        ),
      ),
    );
  }
}
