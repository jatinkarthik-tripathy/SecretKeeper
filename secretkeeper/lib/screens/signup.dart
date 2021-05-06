import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/widgets/animatedLogo.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (Breakpoints().isMobile(constraints)) {
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.all(8),
                      child: splashMessageSection(context, constraints, 24, 12),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: constraints.maxHeight,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, -3),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(constraints.maxWidth * 0.025),
                      child: signupSection(context, constraints, 28, 12),
                    ),
                  )
                ],
              );
            } else if (Breakpoints().isTablet(constraints)) {
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.all(24),
                      child: splashMessageSection(context, constraints, 32, 16),
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
                      padding: EdgeInsets.all(constraints.maxWidth * 0.025),
                      child: signupSection(context, constraints, 32, 16),
                    ),
                  )
                ],
              );
            }
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    padding: EdgeInsets.all(32),
                    child: splashMessageSection(context, constraints, 44, 20),
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
                    padding: EdgeInsets.all(constraints.maxWidth * 0.025),
                    child: signupSection(context, constraints, 44, 20),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget signupSection(BuildContext context, BoxConstraints constraints,
      double headingTextSize, double plainTextSize) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: headingTextSize,
                fontWeight: FontWeight.w700,
              ),
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
              fontSize: plainTextSize,
            ),
          ),
          enableSuggestions: true,
          style: TextStyle(
            fontSize: plainTextSize,
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
              fontSize: plainTextSize,
            ),
          ),
          obscureText: true,
          style: TextStyle(
            fontSize: plainTextSize,
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
              fontSize: plainTextSize,
            ),
          ),
          obscureText: true,
          style: TextStyle(
            fontSize: plainTextSize,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  fontSize: plainTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: Breakpoints().isMobile(constraints) ? 8 : 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "or connect with",
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: plainTextSize,
                  ),
                ),
                SizedBox(
                  width: Breakpoints().isMobile(constraints) ? 8 : 32,
                ),
                IconButton(
                  iconSize: headingTextSize,
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
          ],
        ),
        SizedBox(
          height: constraints.maxHeight * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account ?",
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: plainTextSize,
              ),
            ),
            SizedBox(width: 36),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).backgroundColor,
                ),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/login'),
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: plainTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget splashMessageSection(BuildContext context, BoxConstraints constraints,
      double headingTextSize, double plainTextSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedLogo(),
        SizedBox(
          height: constraints.maxHeight * 0.01,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Welcome to SecretKeeper",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: headingTextSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.005,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Free. Open Source. Cross Platform.",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: headingTextSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
