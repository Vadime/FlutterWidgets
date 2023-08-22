import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final int initialPage;
  final Function(String email, String password) onEmailSignUp;
  final Function(String email, String password) onEmailSignIn;
  final Function(String email) onEmailSendPassword;
  final Function(String phone) onPhoneSendCode;
  final Function(String phone) onPhoneVerifyCode;
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
        action: const BrigthnessSwitch(),
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
                      widget.onEmailSignUp(email.text, password.text);
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
                      widget.onEmailSignIn(email.text, password.text);
                    },
                  ),
                  SendPasswordView(
                    toSignIn: () => pageController.go(1),
                    sendPassword: (email) {
                      if (!email.isValid()) {
                        email.emptyAllowed = false;
                        return;
                      }
                      widget.onEmailSendPassword(email.text);
                    },
                  ),
                ]),
          ),
          const DividerWidget('Or Login with'),
          Padding(
            padding: const EdgeInsets.all(ThemeConfig.kPaddingH),
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
                        await widget.onPhoneSendCode(phone.text);
                        Navigation.pop();
                        Navigation.pushPopup(widget: VerifyPhoneCodeView(
                          verifyPhoneCode: (code) async {
                            if (!code.isValid()) {
                              phone.emptyAllowed = false;
                              return;
                            }
                            await widget.onPhoneVerifyCode(code.text);
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
        padding: const EdgeInsets.all(ThemeConfig.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              phone,
              autofocus: true,
            ),
            const SizedBox(height: ThemeConfig.kPadding),
            ElevatedButtonWidget('Send Code',
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
  TextFieldController code = TextFieldController.code(labelText: 'Verify Code');

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(ThemeConfig.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              code,
            ),
            const SizedBox(height: ThemeConfig.kPadding),
            ElevatedButtonWidget('Login',
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
        const Spacer(),
        LoginHeader(
          'Send Password',
          'You have your Password again? ',
          TextButtonWidget(
            'Sign In',
            onPressed: widget.toSignIn,
          ),
        ),
        TextFieldWidget(
          TextFieldController.email(),
          margin: const EdgeInsets.fromLTRB(
              ThemeConfig.kPadding,
              ThemeConfig.kPaddingH,
              ThemeConfig.kPadding,
              ThemeConfig.kPaddingH),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          'Send Password',
          onPressed: () => widget.sendPassword(email),
          margin: const EdgeInsets.all(ThemeConfig.kPadding),
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
        const Spacer(),
        LoginHeader(
          'Sign In',
          "Don't have an Account? ",
          TextButtonWidget(
            'Sign Up',
            onPressed: widget.toSignUp,
          ),
        ),
        CardWidget(
          margin: const EdgeInsets.fromLTRB(
              ThemeConfig.kPadding,
              ThemeConfig.kPaddingH,
              ThemeConfig.kPadding,
              ThemeConfig.kPaddingH),
          children: [TextFieldWidget(email), TextFieldWidget(password)],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButtonWidget(
            'Forgot password?',
            onPressed: widget.toSendPassword,
            margin: const EdgeInsets.fromLTRB(
                ThemeConfig.kPadding,
                ThemeConfig.kPaddingH,
                ThemeConfig.kPadding,
                ThemeConfig.kPaddingH),
          ),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          'Sign In',
          onPressed: () => widget.signIn(email, password),
          margin: const EdgeInsets.all(ThemeConfig.kPadding),
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
        const Spacer(),

        LoginHeader(
          'Sign Up',
          'Already have an account? ',
          TextButtonWidget(
            'Sign In',
            onPressed: widget.toSignIn,
          ),
        ),

        CardWidget(
          margin: const EdgeInsets.fromLTRB(
              ThemeConfig.kPadding,
              ThemeConfig.kPaddingH,
              ThemeConfig.kPadding,
              ThemeConfig.kPaddingH),
          children: [
            TextFieldWidget(email),
            TextFieldWidget(password),
          ],
        ),
        // checkbox and terms of service
        Padding(
          padding: const EdgeInsets.fromLTRB(
              ThemeConfig.kPadding, 0, ThemeConfig.kPadding, 0),
          child: Row(
            children: [
              CheckboxWidget(controller: agree),
              const SizedBox(width: ThemeConfig.kPaddingH),
              Expanded(child: widget.agreementText),
            ],
          ),
        ),
        const Spacer(),
        ElevatedButtonWidget(
          'Sign Up',
          onPressed: () => widget.signUp(email, password, agree),
          margin: const EdgeInsets.all(ThemeConfig.kPadding),
        ),
      ],
    );
  }
}
