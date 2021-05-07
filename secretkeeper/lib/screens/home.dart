import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/widgets/sidebar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool selected = false;
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    offset = Tween<Offset>(
      begin: Offset(-1.5, 0.0),
      end: Offset(0, 0.0),
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (Breakpoints().isMobile(constraints)) {
              return Stack(
                children: [
                  Container(
                    height: constraints.maxHeight,
                    padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                    child: mainSection(context, constraints, 24, 16),
                  ),
                  SlideTransition(
                    position: offset,
                    child: SideBar(constraints, 32, 24, controller),
                  ),
                ],
              );
            } else if (Breakpoints().isTablet(constraints)) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SideBar(constraints, 32, 16),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: constraints.maxHeight,
                      padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                      child: mainSection(context, constraints, 32, 16),
                    ),
                  ),
                ],
              );
            }
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SideBar(constraints, 36, 20),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: constraints.maxHeight,
                    padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                    child: mainSection(context, constraints, 36, 20),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget mainSection(BuildContext context, BoxConstraints constraints,
      double headingTextSize, double plainTextSize) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Breakpoints().isMobile(constraints)
                ? IconButton(
                    iconSize: 24,
                    icon:
                        Icon(Icons.menu, color: Theme.of(context).primaryColor),
                    onPressed: () {
                      controller.forward();
                    },
                  )
                : SizedBox(
                    width: 0,
                  ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Breakpoints().isMobile(constraints) ? 8 : 32,
                    vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(36.0),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      ),
                    ),
                    filled: false,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: plainTextSize,
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                  enableSuggestions: true,
                  style: TextStyle(
                    fontSize: plainTextSize,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Breakpoints().isMobile(constraints)
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 24,
                    child: IconButton(
                      iconSize: 24,
                      icon: Icon(Icons.add,
                          color: Theme.of(context).backgroundColor),
                      onPressed: () {},
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: plainTextSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: constraints.maxHeight * 0.05,
                decoration: BoxDecoration(
                  color: Color(0xFFE5E5E5),
                  borderRadius: BorderRadius.circular(36.0),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05, vertical: 16),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.security_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Expanded(
                      flex: Breakpoints().isMobile(constraints) ? 3 : 5,
                      child: Breakpoints().isMobile(constraints)
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: plainTextSize,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "username",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: plainTextSize,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Title",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: plainTextSize,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "username",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: plainTextSize,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Show",
                          style: TextStyle(
                            color: Theme.of(context).backgroundColor,
                            fontSize: plainTextSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 25,
          ),
        )
      ],
    );
  }
}
