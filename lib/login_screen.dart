import 'package:flutter/material.dart';
import 'package:ks_assign/home_screen.dart';
import 'package:ks_assign/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  TextEditingController mobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        label: Text('Name'), border: OutlineInputBorder()),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: mobile,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter mobile number';
                      }

                      if ((value[0] == '6' ||
                              value[0] == '7' ||
                              value[0] == '8' ||
                              value[0] == '9') &&
                          value.length == 10 &&
                          RegExp(r'^[0-9]+$').hasMatch(value)) return null;
                      return 'Enter valid Indian mobile number';
                    },
                    decoration: const InputDecoration(
                        label: Text('Mobile'), border: OutlineInputBorder()),
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (value) => login(context),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => login(context),
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    {
      if (formKey.currentState!.validate()) {
        activeUser = User(name: name.text, mobile: int.parse(mobile.text));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    }
  }
}
