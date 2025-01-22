import 'package:flutter/material.dart';
import '../../../utils/paths/colors_paths.dart';
import '../../../utils/paths/fonts_paths.dart';

class LabeledIconRowWid extends StatelessWidget {
  final String labelText;
  final String subText;
  final String? containerText;
  final bool showEditButton;
  final IconData icon;
  final VoidCallback? onEdit;

  const LabeledIconRowWid({
    super.key,
    required this.labelText,
    required this.subText,
    this.containerText,
    this.showEditButton = false,
    required this.icon,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.kGreyED,
              ),
              padding: const EdgeInsets.all(7),
              child: Icon(
                icon,
                size: 24,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    labelText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.inter500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.kGrey4B,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.inter500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            if (showEditButton)
              InkWell(
                onTap: onEdit,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.kBlue5053),
                    color: AppColors.kLavBlueF3,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    containerText ?? 'Edit',
                    style: const TextStyle(
                      color: AppColors.kBlue5053,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(
          color: AppColors.kGreyED,
          thickness: 1,
        ),
      ],
    );
  }
}
