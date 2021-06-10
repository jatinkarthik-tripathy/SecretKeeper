import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/widgets/addSecret/addSecret.dart';

class CustomAppBar extends StatelessWidget {
  final AnimationController controller;

  const CustomAppBar({Key? key, required this.controller}) : super(key: key);

  static Route<Object?> _addDialogBuilder(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SimpleDialog(
          title: Text(
            "Add a Secret",
            style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          children: [
            Container(
              width: Breakpoints.isTablet(constraints)
                  ? constraints.maxWidth * 0.75
                  : constraints.maxWidth * 0.5,
              height: constraints.maxHeight * 0.6,
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.01,
              ),
              child: AddSecret(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double plainTextSize;
      if (Breakpoints.isMobile(constraints)) {
        plainTextSize = 16;
      } else if (Breakpoints.isTablet(constraints)) {
        plainTextSize = 16;
      } else {
        plainTextSize = 20;
      }

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Breakpoints.isMobile(constraints)
              ? IconButton(
                  iconSize: 24,
                  icon: Icon(Icons.menu, color: Theme.of(context).primaryColor),
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
                  horizontal: Breakpoints.isMobile(constraints) ? 8 : 32,
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
          Breakpoints.isMobile(constraints)
              ? CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 24,
                  child: IconButton(
                    iconSize: 24,
                    icon: Icon(Icons.add,
                        color: Theme.of(context).backgroundColor),
                    onPressed: () => showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      isDismissible: true,
                      builder: (context) => Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.8,
                        padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth * 0.01,
                        ),
                        color: Theme.of(context).backgroundColor,
                        child: AddSecret(),
                      ),
                    ),
                  ),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () =>
                      Navigator.of(context).restorablePush(_addDialogBuilder),
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
      );
    });
  }
}
