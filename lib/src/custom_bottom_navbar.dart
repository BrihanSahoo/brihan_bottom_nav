
import 'package:flutter/material.dart';

class CommonNavbar extends StatelessWidget {
  const CommonNavbar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.iconSize = 24,
    this.itemSize = 48,
    this.duration = const Duration(milliseconds: 250),
    this.elevation = 8,
  }) : assert(selectedIndex >= 0);

  final List<IconData> icons;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double iconSize;
  final double itemSize;
  final Duration duration;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    if (icons.isEmpty) {
      return const SizedBox.shrink();
    }

    final safeIndex =
        selectedIndex < icons.length ? selectedIndex : 0;

    return Material(
      color: backgroundColor,
      elevation: elevation,
      child: SafeArea(
        top: false,
        child: Row(
          children: List.generate(icons.length, (index) {
            final isSelected = index == safeIndex;

            return Expanded(
              child: Semantics(
                button: true,
                selected: isSelected,
                label: 'Navigation item ${index + 1}',
                child: InkWell(
                  onTap: () => onTap(index),
                  child: SizedBox(
                    height: itemSize,
                    child: Center(
                      child: AnimatedContainer(
                        duration: duration,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? selectedColor.withValues(alpha: 0.12)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          icons[index],
                          size: iconSize,
                          color: isSelected
                              ? selectedColor
                              : unselectedColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
