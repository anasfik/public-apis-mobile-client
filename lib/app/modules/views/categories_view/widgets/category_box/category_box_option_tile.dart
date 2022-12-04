import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../../data/models/category_box_option.dart';

class CategoryBoxOptionTile extends StatelessWidget {
  final CategoryBoxOption option;
  final bool shouldHaveExtraVerticalPadding;

  const CategoryBoxOptionTile({
    super.key,
    required this.option,
    this.shouldHaveExtraVerticalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            option.icon,
            color: theme.colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(
            width: 20,
          ),
          AutoSizeText(
            option.title.capitalizeAllWordsFirstLetter(),
            style: theme.textTheme.button?.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
