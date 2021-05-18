import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';

// ignore: must_be_immutable
class SideBar extends StatelessWidget {
  final BoxConstraints constraints;
  final double headingTextSize;
  final double plainTextSize;

  AnimationController? controller;
  SideBar(this.constraints, this.headingTextSize, this.plainTextSize,
      [this.controller]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: constraints.maxWidth * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(3, 0),
          )
        ],
      ),
      padding: EdgeInsets.all(constraints.maxWidth * 0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Breakpoints.isMobile(constraints)
                    ? constraints.maxWidth * 0.5
                    : constraints.maxWidth * 0.2,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "SecretKeeper",
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: headingTextSize,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Breakpoints.isMobile(constraints)
                  ? IconButton(
                      iconSize: 28,
                      icon: Icon(Icons.close,
                          color: Theme.of(context).backgroundColor),
                      onPressed: () {
                        controller?.reverse();
                      },
                    )
                  : SizedBox(width: 0),
            ],
          ),
          SizedBox(
            height: constraints.maxHeight * 0.06,
          ),
          Text(
            "All",
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: plainTextSize,
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
              fontSize: plainTextSize,
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
              fontSize: plainTextSize,
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
              fontSize: plainTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.025,
          ),
          // Text(
          //   "Bank Accounts",
          //   style: TextStyle(
          //     color: Theme.of(context).backgroundColor,
          //     fontSize: plainTextSize,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          // SizedBox(
          //   height: constraints.maxHeight * 0.025,
          // ),
          Text(
            "Account Settings",
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
              fontSize: plainTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.3,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).backgroundColor,
                    ),
                  ),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: plainTextSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
