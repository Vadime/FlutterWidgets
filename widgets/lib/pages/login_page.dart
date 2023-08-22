import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final int initialPage;
  final Function(String email, String password) onEmailSignUp;
  final Function(String email, String password) onEmailSignIn;
  final Function(String email) onEmailSendPassword;
  final Function(String phone) onPhoneSendCode;
  final Function(String phone) onPhoneVerifyCode;

  const LoginPage({
    this.initialPage = 1,
    required this.onEmailSignUp,
    required this.onEmailSignIn,
    required this.onEmailSendPassword,
    required this.onPhoneSendCode,
    required this.onPhoneVerifyCode,
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      SignUpView(
                        toSignIn: () => pageController.go(1),
                        signUp: (email, password, agree) {
                          if (!email.isValid() || !password.isValid()) {
                            Navigation.pushMessage(
                                message:
                                    "${email.errorText!} or ${password.errorText!}");

                            return;
                          }
                          widget.onEmailSignUp(email.text, password.text);
                        },
                        agreementText: Text(
                          "I agree to the Terms of Service.",
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                      SignInView(
                        toSignUp: () => pageController.go(0),
                        toSendPassword: () => pageController.go(2),
                        signIn: (email, password) {
                          if (!email.isValid() || !password.isValid()) {
                            Navigation.pushMessage(
                                message:
                                    "${email.errorText!} or ${password.errorText!}");
                            return;
                          }
                          widget.onEmailSignIn(email.text, password.text);
                        },
                      ),
                      SendPasswordView(
                        toSignIn: () => pageController.go(1),
                        sendPassword: (email) {
                          if (!email.isValid()) {
                            Navigation.pushMessage(message: email.errorText);
                            return;
                          }
                          widget.onEmailSendPassword(email.text);
                        },
                      ),
                    ]),
              ),
              const DividerWidget("Or Login with"),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // other authentication providers possible
                    Expanded(
                      child: ThirdPartyLoginButton(
                        "Phone",
                        Icons.phone_rounded,
                        onPressed: () =>
                            Navigation.pushPopup(widget: SendPhoneCodeView(
                          onSendPhoneCode: (phone) async {
                            if (!phone.isValid()) {
                              Navigation.pushMessage(message: phone.errorText);
                              return;
                            }
                            await widget.onPhoneSendCode(phone.text);
                            Navigation.pop();
                            Navigation.pushPopup(widget: VerifyPhoneCodeView(
                              verifyPhoneCode: (code) async {
                                if (!code.isValid()) {
                                  Navigation.pushMessage(
                                      message: code.errorText);
                                  return;
                                }
                                await widget.onPhoneVerifyCode(code.text);
                              },
                            ));
                          },
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const SafeArea(top: false, child: SizedBox())
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SafeArea(
              child: IconButton(
                  onPressed: () => Navigation.pushPopup(
                          widget: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ThemeChangeComponent(
                            onChange: (mode) =>
                                ThemeController.of(context).change(mode),
                            currentMode: ThemeController.of(context).state),
                      )),
                  icon: const Icon(Icons.settings, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class SendPhoneCodeView extends StatefulWidget {
  final Function(TextFieldController phone) onSendPhoneCode;
  const SendPhoneCodeView({
    required this.onSendPhoneCode,
    super.key,
  });

  @override
  State<SendPhoneCodeView> createState() => _SendPhoneCodeViewState();
}

class _SendPhoneCodeViewState extends State<SendPhoneCodeView> {
  TextFieldController phone = TextFieldController.phone();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Send Code",
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "sent to Phone",
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              phone,
            ),
            const SizedBox(height: 20),
            ElevatedButtonWidget("Send Code",
                onPressed: () => widget.onSendPhoneCode(phone))
          ],
        ));
  }
}

class VerifyPhoneCodeView extends StatefulWidget {
  final Function(TextFieldController code) verifyPhoneCode;

  const VerifyPhoneCodeView({required this.verifyPhoneCode, super.key});

  @override
  State<VerifyPhoneCodeView> createState() => _VerifyPhoneCodeViewState();
}

class _VerifyPhoneCodeViewState extends State<VerifyPhoneCodeView> {
  TextFieldController code = TextFieldController.code();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Login",
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              "with the Code",
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              code,
            ),
            const SizedBox(height: 20),
            ElevatedButtonWidget("Login",
                onPressed: () => widget.verifyPhoneCode(code)),
          ],
        ));
  }
}

class SendPasswordView extends StatefulWidget {
  final Function() toSignIn;
  final Function(TextFieldController email) sendPassword;
  const SendPasswordView({
    required this.toSignIn,
    required this.sendPassword,
    super.key,
  });

  @override
  State<SendPasswordView> createState() => _SendPasswordViewState();
}

class _SendPasswordViewState extends State<SendPasswordView> {
  TextFieldController email = TextFieldController.email();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginHeader(
          "Send Password",
          'You have your Password again? ',
          TextButtonWidget(
            'Sign In',
            onPressed: widget.toSignIn,
            foregroundColor: Colors.white,
          ),
        ),
        TextFieldWidget(
          TextFieldController.email(),
          margin: const EdgeInsets.all(20),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          "Send Password",
          onPressed: () => widget.sendPassword(email),
          margin: const EdgeInsets.all(20),
        ),
      ],
    );
  }
}

class SignInView extends StatefulWidget {
  final Function() toSignUp;
  final Function() toSendPassword;
  final Function(TextFieldController email, TextFieldController password)
      signIn;
  const SignInView({
    required this.toSignUp,
    required this.toSendPassword,
    required this.signIn,
    super.key,
  });

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextFieldController email = TextFieldController.email();
  TextFieldController password = TextFieldController.password();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginHeader(
          "Sign In",
          "Don't have an Account? ",
          TextButtonWidget(
            'Sign Up',
            onPressed: widget.toSignUp,
            foregroundColor: Colors.white,
          ),
        ),
        CardWidget(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          children: [TextFieldWidget(email), TextFieldWidget(password)],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButtonWidget(
            'Forgot password?',
            onPressed: widget.toSendPassword,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          ),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          "Sign In",
          onPressed: () => widget.signIn(email, password),
          margin: const EdgeInsets.all(20),
        ),
      ],
    );
  }
}

class SignUpView extends StatefulWidget {
  final Function() toSignIn;
  final Function(TextFieldController email, TextFieldController password,
      CheckboxController agree) signUp;
  final Widget agreementText;
  const SignUpView({
    required this.toSignIn,
    required this.signUp,
    required this.agreementText,
    super.key,
  });

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextFieldController email = TextFieldController.email();
  TextFieldController password = TextFieldController.password();
  CheckboxController agree = CheckboxController(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginHeader(
          "Sign Up",
          "Already have an account? ",
          TextButtonWidget(
            'Sign In',
            onPressed: widget.toSignIn,
            foregroundColor: Colors.white,
          ),
        ),
        CardWidget(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          children: [
            TextFieldWidget(email),
            TextFieldWidget(password),
          ],
        ),
        // checkbox and terms of service
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            children: [
              CheckboxWidget(controller: agree),
              const SizedBox(width: 10),
              Expanded(child: widget.agreementText),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          "Sign Up",
          onPressed: () => widget.signUp(email, password, agree),
          margin: const EdgeInsets.all(20),
        ),
      ],
    );
  }
}
