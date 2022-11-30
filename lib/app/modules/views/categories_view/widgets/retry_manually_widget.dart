import 'package:flutter/material.dart';

class RetryManuallyWidget extends StatelessWidget {
  final double height;
  final void Function() onTap;

  const RetryManuallyWidget({
    super.key,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.replay,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Text("Retry"),
            ],
          ),
        ),
      ),
    );
  }
}
