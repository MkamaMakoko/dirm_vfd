import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'customer_info.dart';
part 'payment_type.dart';
part 'items.dart';

@RoutePage()
class NewReceiptPage extends ConsumerWidget {
  const NewReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newReceiptProvider.notifier);
    final state = ref.watch(newReceiptProvider);
    final value = state.value;
    return Scaffold(
      floatingActionButton: value?.currentStep == 1
          ? FloatingActionButton.extended(
              onPressed: () {},
              label: const Text('Add item'),
              icon: const Icon(Icons.add_rounded),
            )
          : null,
      persistentFooterButtons: [
        TextButton.icon(
          onPressed: () {},
          label: const Text('Clear'),
          icon: const Icon(Icons.clear_all_rounded),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text('Preview'),
          icon: const Icon(Icons.preview_rounded),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text('Print'),
          icon: const Icon(Icons.print_rounded),
        ),
      ],
      appBar: AppBar(title: const Text('New receipt')),
      body: Stepper(
        controlsBuilder: (context, details) {
          final current = details.currentStep;
          return Padding(
            padding: const EdgeInsets.only(top: edgeInsertValue * 2),
            child: ButtonBar(
              buttonPadding: EdgeInsets.zero,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton.filled(
                    onPressed: current > 0
                        ? () =>
                            notifier.changeCurrentStep(details.currentStep - 1)
                        : null,
                    icon: const Icon(Icons.arrow_upward_rounded)),
                const SpaceBetween(),
                IconButton.filled(
                    onPressed: current < 2
                        ? () =>
                            notifier.changeCurrentStep(details.currentStep + 1)
                        : null,
                    icon: const Icon(Icons.arrow_downward_rounded))
              ],
            ),
          );
        },
        // type: StepperType.horizontal,
        currentStep: value?.currentStep ?? 0,
        onStepTapped: notifier.changeCurrentStep,
        steps: [
          Step(
              state: value?.step0State ?? StepState.indexed,
              title: const Text('Customer information'),
              content: const _CustomerInfo(),
              isActive: true),
          const Step(
              title: Text('Items (3)'), content: _Items(), isActive: true),
          const Step(
              title: Text('Payment information'),
              content: _PaymentType(),
              isActive: true),
        ],
      ),
    );
  }
}
