import 'package:flutter/material.dart';
import 'package:secretkeeper/models/breakpoints.dart';
import 'package:secretkeeper/models/data.dart';
import 'package:secretkeeper/widgets/showSecret.dart';

Route<Object?> _showDialogBuilder(
  BuildContext context,
  Object? arguments,
) {
  return DialogRoute<void>(
    context: context,
    builder: (BuildContext context) => LayoutBuilder(
      builder: (context, constraints) => SimpleDialog(
        title: Text(
          "Your Secret",
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
            child: ShowSecret(),
          ),
        ],
      ),
    ),
  );
}

Widget pwdList(
  BoxConstraints constraints,
  BuildContext context,
  double plainTextSize,
  AsyncSnapshot<List<PasswordData>> snapshot,
) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          width: constraints.maxHeight * 0.05,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
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
                flex: Breakpoints.isMobile(constraints) ? 3 : 7,
                child: Breakpoints.isMobile(constraints)
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![index].title,
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
                              snapshot.data![index].title,
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
                  onPressed: () {
                    Breakpoints.isMobile(constraints)
                        ? showModalBottomSheet<void>(
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
                              child: ShowSecret(),
                            ),
                          )
                        : Navigator.of(context)
                            .restorablePush(_showDialogBuilder);
                  },
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
      childCount: snapshot.data?.length,
    ),
  );
}
