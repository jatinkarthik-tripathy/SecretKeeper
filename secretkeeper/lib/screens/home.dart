import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/models/data.dart';
import 'package:secretkeeper/widgets/appBar.dart';
import 'package:secretkeeper/widgets/pwdList.dart';
import 'package:secretkeeper/widgets/sidebar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool selected = false;
  late AnimationController controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  late Animation<Offset> offset = Tween<Offset>(
    begin: Offset(-1.5, 0.0),
    end: Offset(0, 0.0),
  ).animate(controller);

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
            if (Breakpoints.isMobile(constraints)) {
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
            } else if (Breakpoints.isTablet(constraints)) {
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
    return CustomScrollView(
      slivers: [
        SliverFixedExtentList(
          delegate: SliverChildListDelegate([
            CustomAppBar(controller: controller),
          ]),
          itemExtent: constraints.maxHeight * 0.1,
        ),
        SliverFixedExtentList(
          itemExtent: constraints.maxHeight * 0.03,
          delegate: SliverChildListDelegate(
            [
              Container(
                width: constraints.maxWidth,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: Text(
                  "Cards",
                  style: TextStyle(
                    fontSize: plainTextSize,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(
            [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              )
            ],
          ),
          itemExtent: constraints.maxHeight * 0.25,
        ),
        SliverFixedExtentList(
          itemExtent: constraints.maxHeight * 0.03,
          delegate: SliverChildListDelegate(
            [
              Container(
                width: constraints.maxWidth,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: Text(
                  "Passwords",
                  style: TextStyle(
                    fontSize: plainTextSize,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<List<PasswordData>>(
          stream: pwdDatalist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return pwdList(constraints, context, plainTextSize, snapshot);
            }
            return SliverToBoxAdapter(child: CircularProgressIndicator());
          },
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate((context)),
        // ),
        SliverFixedExtentList(
          itemExtent: constraints.maxHeight * 0.03,
          delegate: SliverChildListDelegate(
            [
              Container(
                width: constraints.maxWidth,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                child: Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: plainTextSize,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate([
            Expanded(
                child: Container(
              color: Colors.blue,
            ))
          ]),
          itemExtent: constraints.maxHeight * 0.7,
        ),
      ],
    );
  }
}
