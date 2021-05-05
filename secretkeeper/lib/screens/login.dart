import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'images/logoBG.png',
                              height: 240,
                            ),
                            Image.asset(
                              'images/logoFG.png',
                              height: 200,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Text(
                          "Hello, Friend!",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Text(
                          "tell me your secrets\nand i shall keep it safe for you",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.1,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
