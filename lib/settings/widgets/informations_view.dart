import 'package:flutter/material.dart';
import 'package:smart_pantry/generated/l10n.dart';

class InformationsView extends StatelessWidget {
  const InformationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(width: double.infinity),
          Text(
            'Smart Pantry',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          Text(
            S.of(context).appVersion('1.0.0'),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          Text(
            S.of(context).appDevelopedBy,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const Divider(
            thickness: 0.2,
            height: 40,
          ),
          Text(
            S.of(context).appStorageInformationsTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).appStorageInformationsContent,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 30),
          Text(
            S.of(context).appExpirationDateManagementTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).appExpirationDateManagementContent,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
