import 'package:flutter/material.dart';

import 'filter_alert_dialog.dart';

class ApisViewAppBar extends StatelessWidget {
  const ApisViewAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(title),
      actions: <Widget>[
        const SizedBox(
          width: 10,
        ),
        Tooltip(
          message: 'Filter',
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return FilterAlertDialog(text: title,);
                },
              );
            },
            icon: const Icon(
              Icons.filter_list,
            ),
          ),
        )
      ],
    );
  }
}
