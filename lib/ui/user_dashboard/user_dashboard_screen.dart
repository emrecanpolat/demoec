import 'package:flutter/material.dart';

import '../../app/app_router.dart';
import 'widgets/dashboard_action_card.dart';

class UserDashboardScreen extends StatelessWidget {
  const UserDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Actions',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'What would you like to do?',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 40),

              DashboardActionCard(
                icon: Icons.menu_book_outlined,
                title: 'Browse Courses',
                subtitle: 'Explore available courses',
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.courses);
                },
              ),
              const SizedBox(height: 16),

              DashboardActionCard(
                icon: Icons.video_call_outlined,
                title: 'Request Live Lesson',
                subtitle: 'Connect with instructors live',
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.liveLesson);
                },
              ),
              const SizedBox(height: 16),

              DashboardActionCard(
                icon: Icons.shopping_bag_outlined,
                title: 'Purchased Courses',
                subtitle: 'Access your bought courses',
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.purchasedCourses);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
