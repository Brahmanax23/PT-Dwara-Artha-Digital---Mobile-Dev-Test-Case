part of '../extension.dart';

extension ContextExtension on BuildContext? {
  Future<void> toastWithBarrier({
    required String text,
    bool? backgroundInteraction,
    bool? isDismissible,
    double? routeBlur,
    Color? color,
    IconData? icons,
    Duration? duration,
  }) async {
    await Flushbar(
      animationDuration: duration ?? const Duration(seconds: 1),
      routeBlur: routeBlur ?? 2.5,
      isDismissible: isDismissible ?? false,
      message: text,
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: color ?? Colors.amber,
      icon: Icon(
        icons ?? Icons.check_rounded,
        color: Colors.white,
        size: 20.sp,
      ),
      blockBackgroundInteraction: backgroundInteraction ?? false,
    ).show(this!);
  }
}
