import 'package:flutter/material.dart';

class RetryManuallyWidget extends StatelessWidget {
  final double height;
  final void Function() onTap;
  final bool isSliver;

  const RetryManuallyWidget({
    super.key,
    required this.height,
    required this.onTap,
    this.isSliver = true,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return !isSliver
        ? GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.replay,
                    color: primary,
                  ),
                ),
                const Text("Retry"),
              ],
            ),
          )
        : SliverToBoxAdapter(
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
                        color: primary,
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
