import 'package:ecommerce_system_design/atoms/custom_label_button.dart';
import 'package:ecommerce_system_design/atoms/custom_text_button.dart';
import 'package:ecommerce_system_design/atoms/input.dart';
import 'package:ecommerce_system_design/foundation/app_spacing.dart';
import 'package:ecommerce_system_design/foundation/app_typography.dart';
import 'package:fake_e_commerce/core/route/routes.dart';
import 'package:fake_e_commerce/features/account/presentation/providers/account_provider.dart';
import 'package:fake_e_commerce/shared/dialogs.dart';
import 'package:fake_store_package/util/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final bottomOffset = mq.viewInsets.bottom + mq.padding.bottom;
    const curve = Curves.easeOutQuad;
    const durationMS = Duration(milliseconds: 50);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sidePadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: durationMS,
                        curve: curve,
                        height: 110 - bottomOffset * 0.2,
                      ),
                      Text(
                        'Welcome to \nFake Store',
                        textAlign: TextAlign.center,
                        style: AppTypography.title.copyWith(
                          height: 1.2,
                          fontSize: 32,
                        ),
                      ),
                      AnimatedContainer(
                        duration: durationMS,
                        curve: curve,
                        height: mq.size.height * 0.35 - bottomOffset * 0.7,
                      ),
                      Input(
                        hintText: 'Username',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: usernameController,
                      ),
                      SizedBox(height: 20),
                      Input(
                        hintText: 'Password',
                        controller: passwordController,
                        obscureText: true,
                      ),
                      SizedBox(height: 40),
                      CustomTextButton(text: 'Login', onTap: () => login(ref)),
                      SizedBox(height: 20),
                      CustomLabelButton(
                        label: "Don't have an account?",
                        onTap:
                            () => Navigator.pushNamed(context, Routes.signUp),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  child: Icon(Icons.close, size: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login(WidgetRef ref) async {
    final navigator = Navigator.of(context);
    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Dialogs.showTopSnackBar('Email and password are required');
      return;
    }
    try {
      Dialogs.showModalLoading(visible: true);
      final login = await ref.watch(
        signInProvider(usernameController.text, passwordController.text).future,
      );

      if (login.isNotEmpty) {
        Dialogs.showTopSnackBar('Autenticado con éxito', isError: false);
        navigator.pop();
      }
    } catch (e) {
      if (e is Failure) {
        Dialogs.showTopSnackBar(e.message);
      }
    }
    Dialogs.showModalLoading(visible: false);
  }
}
