import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  final int initialPage;
  final dynamic Function(
      TextFieldController email, TextFieldController password) onEmailSignUp;
  final dynamic Function(
      TextFieldController email, TextFieldController password) onEmailSignIn;
  final dynamic Function(TextFieldController email) onEmailSendPassword;
  final dynamic Function(TextFieldController phone) onPhoneSendCode;
  final dynamic Function()? onAppleLogin;

  const LoginPage({
    this.initialPage = 1,
    required this.onEmailSignUp,
    required this.onEmailSignIn,
    required this.onEmailSendPassword,
    required this.onPhoneSendCode,
    this.onAppleLogin,
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
                    signUp: (email, password, agree) async {
                      TextInput.finishAutofillContext();
                      FocusScope.of(context).unfocus();

                      if (!agree.state) {
                        Messaging.info(
                          'Please agree to the Terms of Service.',
                          context: context,
                        );
                        return;
                      }
                      if (!email.isValid() || !password.isValid()) {
                        email.emptyAllowed = false;
                        password.emptyAllowed = false;
                        return;
                      }
                      try {
                        await widget.onEmailSignUp(email, password);
                      } catch (e) {
                        Messaging.info(
                          e.toString(),
                          context: context,
                        );
                      }
                    },
                    agreementText: Text(
                      'I agree to the Terms of Service.',
                      style: context.textTheme.labelSmall,
                    ),
                  ),
                  SignInView(
                    toSignUp: () => pageController.go(0),
                    toSendPassword: () => pageController.go(2),
                    signIn: (email, password) async {
                      TextInput.finishAutofillContext();
                      FocusScope.of(context).unfocus();

                      if (!email.isValid() || !password.isValid()) {
                        email.emptyAllowed = false;
                        password.emptyAllowed = false;
                        return;
                      }
                      try {
                        await widget.onEmailSignIn(email, password);
                      } catch (e) {
                        Messaging.info(
                          e.toString(),
                          context: context,
                        );
                      }
                    },
                  ),
                  SendPasswordView(
                    toSignIn: () => pageController.go(1),
                    sendPassword: (email) async {
                      TextInput.finishAutofillContext();
                      FocusScope.of(context).unfocus();

                      if (!email.isValid()) {
                        email.emptyAllowed = false;
                        return;
                      }
                      try {
                        await widget.onEmailSendPassword(email);
                      } catch (e) {
                        Messaging.info(
                          e.toString(),
                          context: context,
                        );
                      }
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
                    onPressed: () async =>
                        Navigation.pushPopup(widget: SendPhoneCodeView(
                      onSendPhoneCode: (phone) async {
                        TextInput.finishAutofillContext();
                        FocusScope.of(context).unfocus();

                        if (!phone.isValid()) {
                          phone.emptyAllowed = false;
                          return;
                        }
                        try {
                          await widget.onPhoneSendCode(phone);
                        } catch (e) {
                          Logging.log(e);
                          Messaging.info(e.toString(), context: context);
                        }
                      },
                    )),
                  ),
                ),
                if (widget.onAppleLogin != null)
                  Expanded(
                    child: ThirdPartyLoginButton('Apple', Icons.apple_rounded,
                        onPressed: () async {
                      TextInput.finishAutofillContext();
                      FocusScope.of(context).unfocus();
                      try {
                        await widget.onAppleLogin!();
                      } catch (e) {
                        Messaging.info(
                          e.toString(),
                          context: context,
                        );
                      }
                    }),
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
