import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../exceptions/app_exception.dart';
import '../styles/svg_asset.dart';
import 'svg_viewer.dart';

class ErrorDialog extends StatelessWidget {
  final ErrorType? error;

  const ErrorDialog({required this.error, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade500,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade600, offset: const Offset(3, 3), blurRadius: 15, spreadRadius: 1),
                  const BoxShadow(color: Colors.white, offset: Offset(-3, -3), blurRadius: 15, spreadRadius: 1),
                ],
              ),
              child: const SvgViewer(asset: SvgAsset.icSadFace, width: 52, height: 52),
            ),
            const SizedBox(height: 16),
            Text(
              'Ops! Um erro aconteceu.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (error != null)
              Text(error?.getErrorMessage() ?? '', style: TextStyle(fontSize: 16), textAlign: TextAlign.justify),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: context.pop, child: Text('Entendido')),
          ],
        ),
      ),
    );
  }
}
