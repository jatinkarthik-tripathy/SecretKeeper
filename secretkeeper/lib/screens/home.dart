import 'package:flutter/material.dart';
import 'package:secretkeeper/widgets/sidebar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).accentColor,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(3, 0),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(constraints.maxWidth * 0.025),
                    child: SideBar(constraints),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: constraints.maxHeight,
                    padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.5,
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
                                    fontSize: 16,
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
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Placeholder()),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
