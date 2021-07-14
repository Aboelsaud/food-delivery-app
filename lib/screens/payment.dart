import '../app.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with TickerProviderStateMixin {
  TabController controller;

  void makeFalse() {
    setState(() {
      for (int i = 0; i < checkbox.length; i++) {
        checkbox[i] = false;
      }
    });
  }

  void initState() {
    super.initState();

    controller = new TabController(vsync: this, length: 3);
  }

  void opendialog() {
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        elevation: 10,
        backgroundColor: Colors.orange[700],
        title: new Text(
          "Check order",
          style: TextStyle(color: Colors.white),
        ),
        content: new Text(
          "order has been placed successfuly.",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Close', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var button = InkWell(
      onTap: () {
        cartList.removeRange(0, cartList.length);
        cartCount = 0;
        subtotal = 0;
        total = 0;
        opendialog();
      },
      child: Container(
        width: size.width - 40,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 10),
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
    var title = Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shipping to",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Icon(Icons.menu),
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
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            title,
            PaymentCell(0, makeFalse),
            PaymentCell(1, makeFalse),
            button,
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
                  "Payment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    padding: EdgeInsets.fromLTRB(10, 1, 20, 1),
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
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
