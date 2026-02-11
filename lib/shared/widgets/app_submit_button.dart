import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final String? loadingText;
  final bool isLoading;
  final VoidCallback? onPressed;

  // Customization
  final double height;
  final double? width;
  final bool fullWidth;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double loaderSize;
  final Color? loaderColor;
  final Widget? icon;

  const SubmitButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onPressed,
    this.loadingText,

    // Defaults
    this.height = 50,
    this.width,
    this.fullWidth = true,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.borderRadius = 8,
    this.padding,
    this.loaderSize = 18,
    this.loaderColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: fullWidth ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: isLoading
              ? Row(
                  key: const ValueKey("loading"),
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(loadingText ?? text, style: textStyle),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: loaderSize,
                      height: loaderSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color:
                            loaderColor ??
                            foregroundColor ??
                            theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
              : Row(
                  key: const ValueKey("normal"),
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[icon!, const SizedBox(width: 8)],
                    Text(text, style: textStyle),
                  ],
                ),
        ),
      ),
    );
  }
}
