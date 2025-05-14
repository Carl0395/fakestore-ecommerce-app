import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:ecommerce_system_design/foundation/app_typography.dart';
import 'package:fake_e_commerce/main.dart';
import 'package:fake_e_commerce/shared/slide_in_down.dart';
import 'package:flutter/material.dart';

enum DialogAction { accept, cancel, retry }

class Dialogs {
  static bool _snackbarVisible = false;
  Dialogs._();

  static void showModalLoading({bool visible = true}) {
    try {
      if (modalLoadingOverlay != null) {
        if (modalLoadingOverlay?.mounted == true && visible) return;
        if (visible) {
          overlayState?.insert(modalLoadingOverlay!);
        } else {
          modalLoadingOverlay?.remove();
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static OverlayEntry getModalLoadingOverlay(BuildContext context) {
    return OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withValues(alpha: 0.6),
          child: Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  // backgroundColor: Colors.white,
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1378FF)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void showTopSnackBar(String message, {bool isError = true}) {
    if (_snackbarVisible) return;
    if (overlayState == null) return;

    _snackbarVisible = true;
    AnimationController? controller;

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 20,
          right: 20,
          child: SlideInDown(
            onInitController: (ctrl) => controller = ctrl,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 0.1, color: Colors.black),
              ),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(8),
                color:
                    isError ? AppColors.inputError : AppColors.secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isError ? Icons.warning_rounded : Icons.info_outline,
                        size: 28,
                        color:
                            isError ? AppColors.error : AppColors.primaryColor,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          message,
                          style: AppTypography.title.copyWith(
                            color:
                                isError
                                    ? AppColors.textError
                                    : AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            height: 1.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState?.insert(overlayEntry);

    // Remover después de 3 segundos
    Future.delayed(const Duration(seconds: 4), () {
      controller?.reverse().whenComplete(() {
        overlayEntry.remove();
        _snackbarVisible = false;
      });
    });
  }
}

class LoadingDialog extends StatelessWidget {
  final String? message;
  const LoadingDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 80,
          minWidth: 80,
          maxWidth: 150,
          maxHeight: 120,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (message != null)
              Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              ),
            const CircularProgressIndicator(
              // backgroundColor: Colors.white,
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1378FF)),
            ),
            if (message != null) const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
