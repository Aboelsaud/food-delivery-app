import '../app.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  TabController controller;
  int selectedIndex = 0;

  List<String> titles = [
        "Quick Start",
        "Quick delivery at your Doorstep",
        "Quick delivery at your Doorstep",
      ],
      desc = [
        "Home delivery and online reservation system for restaurants and cafe",
        "Home delivery and online reservation system for restaurants and cafe",
        "Home delivery and online reservation system for restaurants and cafe",
      ];

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: titles.length, vsync: this);

    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget buildTap(int index) => Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                "assets/welcome${index + 1}.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
                left: 40,
                right: 40,
              ),
              child: Text(
                titles[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40, left: 60, right: 60),
              child: Text(
                desc[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
            (index != 2)
                ? SizedBox()
                : InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width / 2.2,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withOpacity(0.82),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
          ],
        );

    var body = Expanded(
      child: TabBarView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: controller,
        children: List.generate(
          titles.length,
          (index) => buildTap(index),
        ),
      ),
    );

    var indicator = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        titles.length,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor:
                (selectedIndex == index) ? Colors.orangeAccent : Colors.grey,
            radius: 6,
          ),
        ),
      ),
    );

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            body,
            indicator,
          ],
        ),
      ),
    );
  }
}
