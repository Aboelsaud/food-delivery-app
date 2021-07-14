import '../app.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> buttons = List.generate(4, (index) => false);
  String buttonClicked = "";
  void makeFalse(int index) {
    for (int i = 0; i < buttons.length; i++) {
      (i != index) ? buttons[i] = false : Text("");
    }
  }

  void countCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool smallScreen = (size.height <= 750);

    var cart = Stack(
      children: [
        Icon(
          Icons.shopping_cart,
          size: 30,
          color: Colors.black,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            alignment: Alignment.center,
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.orangeAccent,
            ),
            child: Text(
              cartCount.round().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ),
      ],
    );
    var appBar =
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Icon(
        Icons.menu,
        size: 30,
        color: Colors.black,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        },
        child: cart,
      ),
    ]);

    var title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What would you",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: (smallScreen) ? 20 : 22,
          ),
        ),
        Text(
          "like to eat?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: (smallScreen) ? 20 : 22,
          ),
        ),
      ],
    );

    var categories = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                clipBehavior: Clip.antiAlias,
                elevation: (buttons[0]) ? 5 : 0,
                borderRadius: BorderRadius.circular(30),
                color: (buttons[0]) ? Colors.orangeAccent : Colors.white,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      makeFalse(0);
                      buttons[0] = !buttons[0];
                      (buttons[0])
                          ? buttonClicked = "Burger"
                          : buttonClicked = "";
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/burgerIcon.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Burger",
                          style: TextStyle(
                            color: (buttons[0]) ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: (smallScreen) ? 15 : 20),
              Material(
                clipBehavior: Clip.antiAlias,
                elevation: (buttons[1]) ? 5 : 0,
                borderRadius: BorderRadius.circular(30),
                color: (buttons[1]) ? Colors.orangeAccent : Colors.white,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      makeFalse(1);
                      buttons[1] = !buttons[1];
                      (buttons[1])
                          ? buttonClicked = "Subway"
                          : buttonClicked = "";
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/sandwitch.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Subway",
                          style: TextStyle(
                            color: (buttons[1]) ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                clipBehavior: Clip.antiAlias,
                elevation: (buttons[2]) ? 5 : 0,
                borderRadius: BorderRadius.circular(30),
                color: (buttons[2]) ? Colors.orangeAccent : Colors.white,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      makeFalse(2);
                      buttons[2] = !buttons[2];
                      (buttons[2])
                          ? buttonClicked = "Bakery"
                          : buttonClicked = "";
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/baker.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Bakery item",
                          style: TextStyle(
                            color: (buttons[2]) ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: (smallScreen) ? 15 : 20),
              Material(
                clipBehavior: Clip.antiAlias,
                elevation: (buttons[3]) ? 5 : 0,
                borderRadius: BorderRadius.circular(30),
                color: (buttons[3]) ? Colors.orangeAccent : Colors.white,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      makeFalse(3);
                      buttons[3] = !buttons[3];
                      (buttons[3])
                          ? buttonClicked = "Fruit"
                          : buttonClicked = "";
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/fruit.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Fruit item",
                          style: TextStyle(
                            color: (buttons[3]) ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    var popular = Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "see all",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );

    var rowContainer = Container(
      height: size.height / 3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: home
            .map((e) => FoodCell(countCart, e.title, e.subtitle, e.price))
            .toList(),
      ),
    );

    var topOfWekk = Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        "Top of the week",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );

    var topWeekList = Container(
      child: TopOfWeekCell(
        countCart,
        "Beef Hot Steak",
        "Hot beef steak with fry",
        "20-40 min",
        "9.65",
        "assets/burgerIcon.png",
      ),
    );
    return Container(
      color: Colors.white.withOpacity(0.98),
      padding: EdgeInsets.all(20),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar,
              SizedBox(height: 20),
              title,
              SizedBox(height: 20),
              categories,
              (buttonClicked != "")
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Divider(
                              thickness: 0.3,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        Column(
                          children: (buttonClicked == "Burger")
                              ? burgers
                                  .map((e) => TopOfWeekCell(countCart, e.title,
                                      e.subtitle, e.time, e.price, e.image))
                                  .toList()
                              : (buttonClicked == "Subway")
                                  ? subway
                                      .map((e) => TopOfWeekCell(
                                          countCart,
                                          e.title,
                                          e.subtitle,
                                          e.time,
                                          e.price,
                                          e.image))
                                      .toList()
                                  : (buttonClicked == "Bakery")
                                      ? baker
                                          .map((e) => TopOfWeekCell(
                                              countCart,
                                              e.title,
                                              e.subtitle,
                                              e.time,
                                              e.price,
                                              e.image))
                                          .toList()
                                      : (buttonClicked == "Fruit")
                                          ? fruit
                                              .map((e) => TopOfWeekCell(
                                                  countCart,
                                                  e.title,
                                                  e.subtitle,
                                                  e.time,
                                                  e.price,
                                                  e.image))
                                              .toList()
                                          : Text(""),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        popular,
                        rowContainer,
                        topOfWekk,
                        topWeekList,
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
