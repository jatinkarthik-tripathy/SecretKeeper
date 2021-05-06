import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/widgets/animatedLogo.dart';

class Login extends StatelessWidget {
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
                      child: loginSection(context, constraints, 28, 12),
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
                      child: loginSection(context, constraints, 32, 16),
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
                    child: splashMessageSection(context, constraints, 44, 24),
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
                    child: loginSection(context, constraints, 44, 24),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget loginSection(BuildContext context, BoxConstraints constraints,
      double headingTextSize, double plainTextSize) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: constraints.maxWidth * 0.35,
          child: Text(
            "Log in",
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: headingTextSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.01,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
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
          height: constraints.maxHeight * 0.01,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
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
          height: constraints.maxHeight * 0.02,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot your Password ?",
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: plainTextSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.015,
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
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              child: Text(
                "Login",
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
              iconSize: Breakpoints().isMobile(constraints) ? 40 : 48,
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset('images/gLogo.png'),
              ),
              onPressed: () {},
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
              "Dont have an account ?",
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: plainTextSize,
              ),
            ),
            SizedBox(width: 32),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).backgroundColor,
                ),
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/signup'),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: plainTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget splashMessageSection(BuildContext context, BoxConstraints constraints,
      double headingTextSize, double plainTextSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "SecretKeeper",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: headingTextSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        AnimatedLogo(),
        Breakpoints().isMobile(constraints)
            ? SizedBox(
                height: 0,
              )
            : SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
        Breakpoints().isMobile(constraints)
            ? SizedBox(
                height: 0,
              )
            : Text(
                "Hello, Friend!\n\ntell me your secrets\nand i shall keep it safe",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: plainTextSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    );
  }
}
