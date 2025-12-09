import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/models/user.dart'; // Importe o model

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome', style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 24),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(), // Fica mais bonito com borda
                ),
              ),
              // Campo de senha removido
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final name = _usernameController.text;

                  // Validação simples para não entrar vazio
                  if (name.isNotEmpty) {
                    // Salva o nome no Provider
                    context.read<UserModel>().login(name);

                    // Vai para o catálogo
                    context.pushReplacement('/catalog');
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                child: const Text('ENTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
