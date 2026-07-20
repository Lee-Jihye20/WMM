import 'package:flutter/material.dart';
import 'package:wmm/Model/Container.dart';

class MemoCard extends StatelessWidget {
  final ModelContainer container;

  const MemoCard({required this.container, super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: container.transform,
        builder: (context, child) {
          return Positioned(
            left: container.transform.position.x,
            top: container.transform.position.y,
            width: 100,
            height: 100,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.yellow[700]!, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "${container.transform.position.x.toStringAsFixed(0)}, ${container.transform.position.y.toStringAsFixed(0)}",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }
    );
  }
}