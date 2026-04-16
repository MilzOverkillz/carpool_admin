import 'package:carpool_admin/widgets/settngs/custom_textfield.dart';
import 'package:flutter/material.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Default Policies',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              labelText: 'Cancellation Policy',
              hintText:
                  'Rides can be canceled up to 30 minutes before scheduled departure. Cancellations within 30 minutes may incur a fee.',
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              labelText: 'Refund Policy',
              hintText:
                  'Full refund for cancellations made 24 hours in advance. Partial refund for cancellations within 24 hours. No refund for no-shows.',
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              labelText: 'Ride Rules',
              hintText:
                  'Be punctual. Respect other riders. No smoking or pets. Keep the vehicle clean.',
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              labelText: 'Maximum Passengers per Ride',
              hintText: '4',
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              labelText: 'Cancellation Fee',
              hintText: '5.00 LKR',
            ),
          ],
        ),
      ),
    );
  }
}
