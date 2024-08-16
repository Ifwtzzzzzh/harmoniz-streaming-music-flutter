import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmoniz/core/theme/app_pallete.dart';
import 'package:harmoniz/features/auth/view/pages/login_page.dart';
import 'package:harmoniz/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:harmoniz/features/auth/view/widgets/custom_field.dart';
import 'package:harmoniz/features/auth/viewmodel/auth_viewmodel.dart';

class SignupPages extends ConsumerStatefulWidget {
  const SignupPages({super.key});

  @override
  ConsumerState<SignupPages> createState() => _SignupPagesState();
}

class _SignupPagesState extends ConsumerState<SignupPages> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final val = ref.watch(authViewmodelProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              CustomField(hintText: 'Name', controller: nameController),
              const SizedBox(height: 15),
              CustomField(hintText: 'Email', controller: emailController),
              const SizedBox(height: 15),
              CustomField(
                hintText: 'Password',
                controller: passwordController,
                isObsecureText: true,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                buttonText: 'Sign Up',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    await ref.read(authViewmodelProvider.notifier).signUpUser(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  }
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
