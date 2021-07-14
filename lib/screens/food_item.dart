import '../app.dart';

class FoodItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  FoodItem(this.title, this.subtitle, this.price);
  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  double quantity = 1.0;
  double totall;
  double price;
  bool setPrice = false;
  @override
  Widget build(BuildContext context) {
    (!setPrice)
        // ignore: unnecessary_statements
        ? {
            totall = double.parse(widget.price),
            price = double.parse(widget.price),
            setPrice = true
          }
        : setPrice = true;
    Size size = MediaQuery.of(context).size;
    bool smallScreen = size.width <= 350;
    Widget count(IconData icon, int index) {
      return InkWell(
        onTap: () {
          setState(() {
            (index == 0)
                ? (quantity == 1)
                    ? quantity = 1
                    // ignore: unnecessary_statements
                    : {quantity--, totall -= price}
                // ignore: unnecessary_statements
                : {quantity++, totall += price};
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 14,
          ),
        ),
      );
    }

    var image = Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/burgerImg.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(color: Colors.black),
          ),
        ],
      ),
    );

    var countPrice = Expanded(
      flex: 1,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                count(Icons.exposure_minus_1, 0),
                SizedBox(width: 10),
                Text(quantity.toString()),
                SizedBox(width: 10),
                count(Icons.add, 1),
              ],
            ),
            Text(
              "\$" + totall.toStringAsFixed(2).toString(),
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
    var button = Expanded(
      flex: 2,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: () {
          cartCount += quantity;
          subtotal += double.parse(widget.price) * quantity;
          total += double.parse(widget.price) * quantity;
          for (double i = 0; i < quantity; i++)
            cartList.add(Item(title: widget.title, price: widget.price));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        },
        child: Container(
          alignment: Alignment.center,
          height: 47,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withOpacity(0.82),
          ),
          child: Text(
            "ADD TO CART",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );

    var details = Padding(
      padding: EdgeInsets.all((smallScreen) ? 10 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: (smallScreen) ? 20 : 25,
                ),
              ),
              Text(
                widget.price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: (smallScreen) ? 15 : 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            widget.subtitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: (smallScreen) ? 12 : 14,
            ),
          ),
          SizedBox(height: (smallScreen) ? 10 : 15),
          Text(
            "Loaded Summer Veg Burger with Fried Egg Naturally Packed summer veg burger beaturing ascvay grilled pepper and union refish, grilled rucchini.",
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: (smallScreen) ? 11 : 13,
            ),
          ),
          SizedBox(height: (smallScreen) ? 15 : 20),
          Row(
            children: [
              countPrice,
              SizedBox(width: 10),
              button,
            ],
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          image,
          details,
        ],
      ),
    );
  }
}
