import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../core/utils/widgets/consecutive_text_field.dart';
import '../../../../core/utils/widgets/animated_press_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Uso de SafeArea y SingleChildScrollView para permitir scroll con teclado y evitar overlap
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agnostic Base'),
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () {
            // Ejemplo de navegación lógica (Back siempre disponible si aplica)
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                LucideIcons.rocket, // Íconos profesionales
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Bienvenido',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Prueba la navegación y el teclado',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ConsecutiveTextField(
                hintText: 'Correo Electrónico',
                focusNode: _emailFocus,
                nextFocusNode: _passwordFocus,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: LucideIcons.mail,
              ),
              ConsecutiveTextField(
                hintText: 'Contraseña',
                focusNode: _passwordFocus,
                isLast: true,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: LucideIcons.lock,
              ),
              const SizedBox(height: 24),
              AnimatedPressButton(
                onPressed: () {},
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
