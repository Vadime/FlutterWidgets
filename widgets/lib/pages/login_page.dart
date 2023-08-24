import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final int initialPage;
  final Function(TextFieldController email, TextFieldController password)
      onEmailSignUp;
  final Function(TextFieldController email, TextFieldController password)
      onEmailSignIn;
  final Function(TextFieldController email) onEmailSendPassword;
  final Function(TextFieldController phone) onPhoneSendCode;
  final Function(TextFieldController phone) onPhoneVerifyCode;
  final Function() onAppleLogin;

  const LoginPage({
    this.initialPage = 1,
    required this.onEmailSignUp,
    required this.onEmailSignIn,
    required this.onEmailSendPassword,
    required this.onPhoneSendCode,
    required this.onPhoneVerifyCode,
    required this.onAppleLogin,
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late PageController pageController;

  get page => pageController.hasClients
      ? pageController.page!.round()
      : widget.initialPage;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialPage);
    pageController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        [
          'Sign Up',
          'Sign In',
          'Send Password',
        ][page],
        action: const BrigthnessSwitchComponent(),
      ),
      body: Column(
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
                      if (!agree.state) {
                        Navigation.pushMessage(
                            message: 'Please agree to the Terms of Service.');
                        return;
                      }
                      if (!email.isValid() || !password.isValid()) {
                        email.emptyAllowed = false;
                        password.emptyAllowed = false;
                        return;
                      }
                      widget.onEmailSignUp(email, password);
                    },
                    agreementText: Text(
                      'I agree to the Terms of Service.',
                      style: context.textTheme.labelSmall,
                    ),
                  ),
                  SignInView(
                    toSignUp: () => pageController.go(0),
                    toSendPassword: () => pageController.go(2),
                    signIn: (email, password) {
                      if (!email.isValid() || !password.isValid()) {
                        email.emptyAllowed = false;
                        password.emptyAllowed = false;
                        return;
                      }
                      widget.onEmailSignIn(email, password);
                    },
                  ),
                  SendPasswordView(
                    toSignIn: () => pageController.go(1),
                    sendPassword: (email) {
                      if (!email.isValid()) {
                        email.emptyAllowed = false;
                        return;
                      }
                      widget.onEmailSendPassword(email);
                    },
                  ),
                ]),
          ),
          const DividerWidget('Or Login with'),
          Padding(
            padding: EdgeInsets.all(context.config.paddingH),
            child: Row(
              children: [
                // other authentication providers possible
                Expanded(
                  child: ThirdPartyLoginButton(
                    'Phone',
                    Icons.phone_rounded,
                    onPressed: () =>
                        Navigation.pushPopup(widget: SendPhoneCodeView(
                      onSendPhoneCode: (phone) async {
                        if (!phone.isValid()) {
                          phone.emptyAllowed = false;
                          return;
                        }
                        await widget.onPhoneSendCode(phone);
                        Navigation.pop();
                        Navigation.pushPopup(widget: VerifyPhoneCodeView(
                          verifyPhoneCode: (code) async {
                            if (!code.isValid()) {
                              phone.emptyAllowed = false;
                              return;
                            }
                            await widget.onPhoneVerifyCode(code);
                          },
                        ));
                      },
                    )),
                  ),
                ),
                Expanded(
                  child: ThirdPartyLoginButton('Apple', Icons.apple_rounded,
                      onPressed: widget.onAppleLogin),
                ),
              ],
            ),
          ),
          const SafeArea(top: false, child: SizedBox())
        ],
      ),
    );
  }
}
