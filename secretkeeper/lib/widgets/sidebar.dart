import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final BoxConstraints constraints;
  SideBar(this.constraints);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: constraints.maxWidth * 0.2,
          child: Text(
            "SecretKeeper",
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.1,
        ),
        Text(
          "All",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.025,
        ),
        Text(
          "Passwords",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.025,
        ),
        Text(
          "Notes",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.025,
        ),
        Text(
          "Cards",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.025,
        ),
        Text(
          "Bank Accounts",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.025,
        ),
        Text(
          "Account Settings",
          style: TextStyle(
            color: Theme.of(context).backgroundColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.3,
        ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).backgroundColor,
              ),
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: Text(
              "Log out",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
