import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enums/user_role.dart';
import 'login_view_model.dart';
import 'widgets/role_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your role',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose how you want to continue',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40),

              RoleCard(
                icon: Icons.person_outline,
                title: 'User',
                subtitle: 'Continue as a regular user',
                onTap: () => vm.login(context, UserRole.user),
              ),
              const SizedBox(height: 16),

              RoleCard(
                icon: Icons.school_outlined,
                title: 'Instructor',
                subtitle: 'Manage and teach content',
                onTap: () => vm.login(context, UserRole.instructor),
              ),
              const SizedBox(height: 16),

              RoleCard(
                icon: Icons.admin_panel_settings_outlined,
                title: 'Admin',
                subtitle: 'Full access to the system',
                onTap: () => vm.login(context, UserRole.admin),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
