import 'package:flutter/material.dart';
import 'package:secretkeeper/widgets/animatedLogo.dart';

class Signup extends StatelessWidget {
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
                    height: double.infinity,
                    padding: EdgeInsets.all(36),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedLogo(),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Text(
                          "Welcome to SecretKeeper",
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
                          "Free. Open Source. Cross Platform.",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(-3, 0),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.35,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.03,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(36.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          enableSuggestions: true,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.015,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(36.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.015,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(36.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.03,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).backgroundColor,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "or connect with",
                              style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(width: 36),
                            IconButton(
                              iconSize: 48,
                              icon: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Image.asset('images/gLogo.png'),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(width: 36),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Theme.of(context).backgroundColor,
                                ),
                              ),
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, '/login'),
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
