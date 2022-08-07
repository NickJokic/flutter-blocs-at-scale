import 'package:blocs_at_scale/src/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreenHeading extends StatelessWidget {
  const HomeScreenHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 24),
        Text('Nice to see you back Nick!', style: AppTextStyles.h2),
        SizedBox(height: 4),
        Text('Take time and explore.', style: AppTextStyles.sh2),
        SizedBox(height: 24),
      ],
    );
  }
}
