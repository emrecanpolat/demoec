import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/course_entity.dart';
import 'payment_view_model.dart';
import 'widgets/payment_summary_card.dart';

class PaymentScreen extends StatefulWidget {
  final CourseEntity course;

  const PaymentScreen({
    super.key,
    required this.course,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentViewModel>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PaymentViewModel>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Summary',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              PaymentSummaryCard(course: widget.course),
              const SizedBox(height: 32),

              if (vm.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: () async {
                      final success = await vm.pay(widget.course);

                      if (!mounted) return;

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Payment successful'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Pay Now'),
                  ),
                ),

              if (vm.message != null) ...[
                const SizedBox(height: 16),
                Text(
                  vm.message!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
