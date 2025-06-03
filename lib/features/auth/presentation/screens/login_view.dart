import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_verse/core/shared/widgets/error_message_snackbar.dart';
import 'package:yoga_verse/core/shared/widgets/loading_dailog.dart';
import 'package:yoga_verse/core/themes/app_colors.dart';
import 'package:yoga_verse/core/themes/app_decoration_themes.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/core/widgets/gradient_app_background.dart';
import 'package:yoga_verse/features/auth/presentation/provider/login_caching_user_provider.dart';
import 'package:yoga_verse/features/auth/presentation/provider/user_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginUsecase = ref.watch(loginAndCachingUsecaseProvider);

    return GradientAppBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: -35,
                top: 80,
                child: Opacity(
                  opacity: .07,
                  child: Image.asset('assets/images/lotus.png', height: 200),
                ),
              ),
              Positioned(
                right: -30,
                bottom: 50,
                child: Transform.rotate(
                  angle: -.3,
                  child: Opacity(
                    opacity: .2,
                    child: Image.asset(
                      'assets/images/yoga-mat_1.png',
                      height: 180,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30,
                children: [
                  Text(
                    "Welcome back",
                    style: GoogleFonts.aBeeZee(
                      letterSpacing: 1.2,
                      fontSize: 18.7,
                      color: const Color.fromARGB(255, 22, 22, 22),
                    ),
                  ),

                  Container(
                    width: 300,
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    // height: 200,
                    alignment: Alignment.center,
                    child: TextFormField(
                      validator: (value) => 'required',
                      controller: email,
                      decoration: AppDecorationThemes.appTextFieldTheme
                          .copyWith(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            label: Text('User email'),
                            labelStyle: TextStyle(fontSize: 13),
                          ),
                      textInputAction: TextInputAction.next,

                      cursorColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    // height: 200,
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: pass,
                      decoration: AppDecorationThemes.appTextFieldTheme
                          .copyWith(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            label: Text('User password'),
                            labelStyle: TextStyle(fontSize: 13),
                          ),
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.go,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      simpleLoadingDailog(context: context);
                      final result = await loginUsecase.loginUser(
                        email: email.text,
                        pass: pass.text,
                      );
                      ref.watch(userProvider);

                      if (context.mounted) Navigator.of(context).pop();
                      if (result.isSuccess && context.mounted) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else if (context.mounted) {
                        errorHandingSnackBar(
                          context: context,
                          errorMessage: result.message,
                        );
                      }
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      backgroundColor: WidgetStatePropertyAll(
                        AppTheme.lightTheme.primaryColor,
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.only(left: 35, right: 35),
                      ),
                    ),
                    child: Text(
                      'SignIn',
                      style: GoogleFonts.actor(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
