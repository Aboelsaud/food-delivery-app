import '../app.dart';

class FoodCell extends StatefulWidget {
  final Function cartCount;
  final String title;
  final String subtitle;
  final String price;
  FoodCell(this.cartCount, this.title, this.subtitle, this.price);
  @override
  _FoodCellState createState() => _FoodCellState();
}

class _FoodCellState extends State<FoodCell> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    print("foodcell1");
    print(quantity);
    Size size = MediaQuery.of(context).size;
    bool smallScreen = (size.height <= 750);
    var title = Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: (smallScreen) ? 17 : 18,
          ),
        ),
        SizedBox(height: (smallScreen) ? 3 : 5),
        Text(
          widget.subtitle,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 13,
          ),
        ),
      ],
    );

    var image = Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Image.asset(
          "assets/burgerIcon.png",
          fit: BoxFit.cover,
        ),
      ),
    );

    var calories = Row(
      children: [
        Icon(
          Icons.fire_extinguisher,
          color: Colors.orangeAccent,
          size: 18,
        ),
        Text(
          "44 Calories",
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 13,
          ),
        )
      ],
    );
    var price = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "\$ " + widget.price,
              style: TextStyle(
                color: Colors.black,
                fontSize: (smallScreen) ? 16 : 17,
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
            quantity++;
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
        padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
        margin: EdgeInsets.only(right: 10),
        width: size.width / 2.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title,
            image,
            calories,
            SizedBox(height: (smallScreen) ? 3 : 5),
            price,
          ],
        ),
      ),
    );
  }
}
