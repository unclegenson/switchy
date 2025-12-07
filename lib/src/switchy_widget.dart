library switchy;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Switchy extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final dynamic activeIcon;
  final dynamic inactiveIcon;
  final double iconSize;
  final List<Color> activeColors;
  final List<Color> inactiveColors;
  final Duration duration;
  final double height;
  final double width;
  final double circlePadding;
  final double circleMargin;
  final double circleSizeRatio;

  const Switchy({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeIcon,
    required this.inactiveIcon,
    this.iconSize = 20,
    this.activeColors = const [Color(0xFF27AE60), Color(0xFF2ECC71)],
    this.inactiveColors = const [Color(0xFF95A5A6), Color(0xFF7F8C8D)],
    this.duration = const Duration(milliseconds: 400),
    this.height = 36,
    this.width = 70,
    this.circlePadding = 6,
    this.circleMargin = 6,
    this.circleSizeRatio = 0.7,
  });

  @override
  State<Switchy> createState() => _SwitchyState();
}

class _SwitchyState extends State<Switchy> {
  Widget _buildIcon(dynamic icon) {
    if (icon is IconData) {
      return Icon(
        icon,
        color: Colors.white,
        size: widget.iconSize,
      );
    }

    if (icon is String && icon.endsWith('.svg')) {
      return SvgPicture.asset(
        icon,
        width: widget.iconSize,
        height: widget.iconSize,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      );
    }

    throw FlutterError(
        "Switchy: activeIcon and inactiveIcon must be IconData or SVG path.");
  }

  @override
  Widget build(BuildContext context) {
    final circleSize = widget.height * widget.circleSizeRatio;
    final circleTop = (widget.height - circleSize) / 2;
    final iconLeftMargin = widget.circleMargin + 2;
    final iconRightMargin =
        widget.width - widget.iconSize - widget.circleMargin - 2;

    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeInOut,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          gradient: LinearGradient(
            colors: widget.value ? widget.activeColors : widget.inactiveColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: (widget.value
                      ? widget.activeColors.first
                      : widget.inactiveColors.first)
                  .withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: widget.duration,
              curve: Curves.easeInOut,
              left: widget.value ? iconLeftMargin : iconRightMargin,
              top: (widget.height - widget.iconSize) / 2,
              child: AnimatedSwitcher(
                duration: widget.duration,
                child: widget.value
                    ? _buildIcon(widget.activeIcon)
                    : _buildIcon(widget.inactiveIcon),
              ),
            ),
            AnimatedPositioned(
              duration: widget.duration,
              curve: Curves.easeInOut,
              left: widget.value
                  ? widget.width - circleSize - widget.circleMargin
                  : widget.circleMargin,
              top: circleTop,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
