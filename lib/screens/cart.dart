import '../app.dart';
import 'dart:async';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  bool promoDone = false;
  TabController controller;
  TextEditingController textController = new TextEditingController();

  void initState() {
    super.initState();

    controller = new TabController(vsync: this, length: 3);
  }

  void calculate(double price, int index) {
    setState(() {
      if (index == 0) {
        subtotal -= price;
        total -= price;
      } else {
        subtotal += price;
        total += price;
      }
    });
  }

  void removeItem(double price, double count) {
    setState(() {
      subtotal -= price * count;
      total -= price * count;
    });
  }

  void opendialog(bool check) {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        elevation: 10,
        backgroundColor: Colors.orange[700],
        title: new Text(
          "Check promo 15%",
          style: TextStyle(color: Colors.white),
        ),
        content: new Text(
          (check)
              ? "Promocode has been added successfuly."
              : "Enter the promocode!",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Close', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
    (check)
        ? setState(() {
            (!promoDone) ? total *= 15 / 100 : total = total;
            promoDone = true;
          })
        : Text("");
  }

  void welcomedialog() async {
    await showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        elevation: 10,
        backgroundColor: Colors.orange[700],
        title: new Text(
          "Note!",
          style: TextStyle(color: Colors.white),
        ),
        content: new Text(
          "You can swip left to remove the item",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Close', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    (!cartFirstVisit)
        ? Future.delayed(Duration(seconds: 2), () => welcomedialog())
        : cartFirstVisit = true;
    cartFirstVisit = true;
    Widget list(String title, String price, bool total) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: (total) ? 17 : 15,
              fontWeight: (total) ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.black,
              fontSize: (total) ? 17 : 15,
              fontWeight: (total) ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      );
    }

    var promoCode = Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                  size: 25,
                ),
                border: InputBorder.none,
                hintText: "PromoCode",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              (textController.text.isEmpty)
                  ? opendialog(false)
                  : opendialog(true);
            },
            child: Container(
              alignment: Alignment.center,
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orangeAccent,
              ),
              child: Text(
                "Apply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    var button = InkWell(
      splashColor: Colors.grey[200],
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Payment()));
      },
      child: Container(
        width: size.width - 40,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "CHECKOUT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    var container = Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          list("Subtotal", "\$" + subtotal.toStringAsFixed(2), false),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(thickness: 0.6),
          ),
          list("Delivery", "\$" + delivery.toStringAsFixed(2), false),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(thickness: 0.6),
          ),
          list("Total", "\$" + total.toStringAsFixed(2), true),
          SizedBox(height: 15),
          button,
        ],
      ),
    );
    var body = Padding(
      padding: EdgeInsets.symmetric(vertical: (size.width <= 400) ? 10 : 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: (size.width <= 400) ? 5 : 10),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            (cartCount > 0)
                ? Column(
                    children: [
                      Column(
                        children: List.generate(
                          cartList.length,
                          (index) => CartCell(calculate, cartList[index].title,
                              cartList[index].price, index, removeItem),
                        ),
                      ),
                      promoCode,
                      container,
                    ],
                  )
                : Center(
                    child: Text("No items have been added yet!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        )))
          ],
        ),
      ),
    );

    var appBar = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 6 - 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: BackButton(),
                title: Text(
                  "Cart",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            clipBehavior: Clip.antiAlias,
            elevation: 50,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.11),
              ),
              child: body,
            ),
          ),
        ),
      ],
    );

    var image = Column(
      children: [
        Image.asset(
          "assets/background.jpg",
          fit: BoxFit.cover,
          width: size.width,
          height: MediaQuery.of(context).size.height / 6,
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );

    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          image,
          appBar,
        ],
      ),
    );
  }
}
