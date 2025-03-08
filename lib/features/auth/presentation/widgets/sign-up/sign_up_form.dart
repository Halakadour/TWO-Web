import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'package:two_website/config/strings/text_strings.dart';
import 'package:two_website/core/error/validation.dart';
import 'package:two_website/core/functions/tuggle_password.dart';
import 'package:two_website/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_website/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_website/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_website/core/widgets/layouts/buttons/custom_cartoon_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  bool _isSecurePassword1 = false;
  bool _isSecurePassword2 = false;
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _fullnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: SizesConfig.spaceBtwSections),
        child: Column(
          children: [
            // Full Name
            CustomTextFormField(
              prefixIconWidget: const Icon(Iconsax.profile_tick),
              labelText: TextStrings.fullName,
              controller: _fullnameController,
              validator: (fullname) {
                if (fullname != null && fullname.isNotShortText()) {
                  return null;
                } else {
                  return TextStrings.nameValidation;
                }
              },
            ),
            const SizedBox(
              height: SizesConfig.spaceBtwInputFields,
            ),
            // Email
            CustomTextFormField(
              prefixIconWidget: const Icon(Iconsax.direct_right),
              labelText: TextStrings.email,
              controller: _emailController,
              validator: (email) {
                if (email != null && email.isValidEmail()) {
                  return null;
                } else {
                  return TextStrings.emailValidation;
                }
              },
            ),
            const SizedBox(
              height: SizesConfig.spaceBtwInputFields,
            ),
            // Password
            CustomTextFormField(
              prefixIconWidget: const Icon(Iconsax.password_check),
              postfixIconPath: togglePassword(
                _isSecurePassword1,
                () {
                  setState(() {
                    _isSecurePassword1 = !_isSecurePassword1;
                  });
                },
              ),
              obscureText: !_isSecurePassword1,
              labelText: TextStrings.password,
              hintText: TextStrings.passwordHint,
              controller: _passwordController,
              validator: (password) {
                if (password != null && password.isValidPassword()) {
                  return null;
                } else {
                  return TextStrings.passwordValidation;
                }
              },
            ),
            const SizedBox(
              height: SizesConfig.spaceBtwInputFields,
            ),
            // Confirm Password
            CustomTextFormField(
              prefixIconWidget: const Icon(Iconsax.password_check),
              postfixIconPath: togglePassword(
                _isSecurePassword2,
                () {
                  setState(() {
                    _isSecurePassword2 = !_isSecurePassword2;
                  });
                },
              ),
              obscureText: !_isSecurePassword2,
              labelText: TextStrings.confirmPassword,
              hintText: TextStrings.confirmPasswordHint,
              controller: _confirmPasswordController,
              validator: (password) {
                if (password != null && password == _passwordController.text) {
                  return null;
                } else {
                  return TextStrings.confirmPasswordValidation;
                }
              },
            ),
            const SizedBox(
              height: SizesConfig.spaceBtwInputFields / 2,
            ),

            const SizedBox(
              height: SizesConfig.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomCartoonButton(
                title: TextStrings.signup,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (_confirmPasswordController.text !=
                        _passwordController.text) {
                      CustomQuickAlert().passwordMatchingAlert(context);
                    } else {
                      context.read<AuthRoleProfileBloc>().add(
                          RegisteNewUserEvent(
                              name: _fullnameController.text,
                              email: _emailController.text,
                              password: _passwordController.text));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
