import 'package:ecommerce_system_design/atoms/custom_label_button.dart';
import 'package:ecommerce_system_design/atoms/custom_text_button.dart';
import 'package:ecommerce_system_design/atoms/input.dart';
import 'package:ecommerce_system_design/foundation/app_spacing.dart';
import 'package:ecommerce_system_design/foundation/app_typography.dart';
import 'package:fake_e_commerce/features/account/presentation/providers/account_provider.dart';
import 'package:fake_e_commerce/shared/dialogs.dart';
import 'package:fake_store_package/util/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ConsumerState<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final bottomOffset = mq.viewInsets.bottom + mq.padding.bottom;
    const curve = Curves.easeOutQuad;
    const durationMS = Duration(milliseconds: 50);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
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
                        height: 110 - bottomOffset * 0.3,
                        curve: curve,
                      ),
                      AnimatedDefaultTextStyle(
                        duration: durationMS,
                        curve: curve,
                        style: AppTypography.title.copyWith(
                          fontSize: 32 - bottomOffset * 0.03,
                        ),
                        child: Text(
                          'Crea tu cuenta \nFake Store',
                          textAlign: TextAlign.center,
                          // style: AppTypography.title.copyWith(height: 1.2),
                        ),
                      ),
                      AnimatedContainer(
                        duration: durationMS,
                        height: mq.size.height * 0.25 - bottomOffset * 0.5,
                        curve: curve,
                      ),
                      Input(
                        hintText: 'User name',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: usernameController,
                      ),
                      SizedBox(height: 20),
                      Input(
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                      ),
                      SizedBox(height: 20),
                      Input(
                        hintText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 40),
                      CustomTextButton(text: 'Register', onTap: createAccount),
                      SizedBox(height: 20),
                      CustomLabelButton(
                        label: 'Already have an account?',
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    final username = usernameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final navigator = Navigator.of(context);

    if (username.trim().isEmpty ||
        password.trim().isEmpty ||
        email.trim().isEmpty) {
      Dialogs.showTopSnackBar('All fields are required');
      return;
    }
    try {
      Dialogs.showModalLoading(visible: true);
      final id = await ref.watch(
        signUpProvider(username, email, password).future,
      );
      Dialogs.showTopSnackBar(
        'Gracias por registrarte id: $id',
        isError: false,
      );
      navigator.popUntil((route) => route.isFirst);
    } catch (e) {
      if (e is Failure) {
        Dialogs.showTopSnackBar(e.message);
      }
    }
    Dialogs.showModalLoading(visible: false);
  }
}
