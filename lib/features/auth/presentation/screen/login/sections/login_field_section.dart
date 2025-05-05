import '../../import_files/import_files.dart';

class LoginFieldSection extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFieldSection(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  State<LoginFieldSection> createState() => _LoginFieldSectionState();
}

class _LoginFieldSectionState extends State<LoginFieldSection> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var validationProvider = Provider.of<ValidateProvider>(context);
    var isObscure = Provider.of<ObscurePasswordProvider>(context);
    return Column(
      children: [
        LabelText(label: 'Email'),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          errorText: validationProvider.errorEmailText,
          onChanged: (val) {
            validationProvider.validateEmail(val);
          },
          controller: widget.emailController,
          hintText: StringsManager.enterEmail,
        ),
        SizedBox(
          height: 16,
        ),
        LabelText(label: 'Password'),
        SizedBox(
          height: 5,
        ),
        CustomTextField(
          isObscure: isObscure.isSecured,
          errorText: validationProvider.errorPasswordText,
          onChanged: (val) {
            validationProvider.validatePassword(val);
          },
          controller: widget.passwordController,
          hintText: StringsManager.enterPassword,
          icon: InkWell(
            onTap: () {
              isObscure.changeSecurePassword();
            },
            child: isObscure.isSecured
                ? Icon(Icons.visibility_off)
                : ImageIcon(
                    AssetImage(
                      ImagesManager.eyeIcon,
                    ),
                    color: ColorsManager.blackColor,
                  ),
          ),
        ),
      ],
    );
  }
}
