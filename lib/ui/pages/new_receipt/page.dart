import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/secondary_container.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/format_number.dart';
import 'package:dirm_vfd/utils/validate_cutomer_id.dart';
import 'package:dirm_vfd/utils/validate_name.dart';
import 'package:dirm_vfd/utils/validate_phone.dart';
import 'package:dirm_vfd/utils/validate_vrn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
part 'customer_info.dart';
part 'add_customer_info.dart';
part 'payment_type.dart';
part 'items.dart';
part 'add_item_dialog.dart';
part 'add_item.dart';
part 'customer_tab.dart';
part 'items_tab.dart';
part 'user_info.dart';
// part 'printer_settings.dart';

@RoutePage()
class NewReceiptPage extends ConsumerWidget {
  const NewReceiptPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(newReceiptProvider.notifier);
    final state = ref.watch(newReceiptProvider);
    final value = state.value;
    final activeInputs = state is! AsyncLoading;
    final userValue = ref.watch(userProvider.select((state) => state.value));
    // final printerState = ref.watch(printerProvider);
    final canPreview = value?.canPreview ?? false;
    return Scaffold(
      persistentFooterButtons: [
        TextButton.icon(
          onPressed: activeInputs ? notifier.clearState : null,
          label: const Text('Clear'),
          icon: const Icon(Icons.clear_all_rounded),
        ),
        if (state case AsyncError(:final error))
          TextButton.icon(
            onPressed: () async {
              await showAdaptiveDialog(
                  context: context,
                  builder: (context) => AlertDialog.adaptive(
                        title: const Text('Error'),
                        content: Text(error.toString()),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Clear'))
                        ],
                      )).then((_) {
                ref.read(newReceiptProvider.notifier).removeError();
              });
            },
            label: const Text('Show error'),
            icon: const Icon(Icons.error_rounded),
          )
        else
          TextButton.icon(
            onPressed: canPreview
                ? () => context.router.push(PreviewReceiptRoute())
                : null,
            label: const Text('Preview'),
            icon: const Icon(Icons.preview_rounded),
          ),
        // TextButton.icon(
        //   onPressed: () {
        //     ref.read(printerProvider.notifier).print();
        //   },
        //   label: const Text('Print'),
        //   icon: const Icon(Icons.print_rounded),
        // ),
      ],
      appBar: AppBar(
        title: const Text('New receipt'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         showModalBottomSheet(
        //             context: context,
        //             builder: (context) => const _PrinterSettings());
        //       },
        //       icon: Icon(switch (printerState) {
        //         AsyncData(value: PrinterState(isConnected: true)) =>
        //           Icons.print_outlined,
        //         _ => Icons.print_disabled_rounded,
        //       }))
        // ],
      ),
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
                    onPressed: current < 3
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
              state: StepState.complete,
              title: Text('Your information '
                  '(${userValue?.username})'),
              content: const _UserInfo(),
              isActive: true),
          Step(
              state: value?.step0State ?? StepState.indexed,
              title: const Text('Customer information'),
              content: const _CustomerInfo(),
              isActive: true),
          Step(
              state: value?.step1State ?? StepState.indexed,
              title: Text('Items and services '
                  '(${value?.itemsState.selectedItems.length ?? 0})'),
              content: const _Items(),
              isActive: true),
          Step(
              title: Text('Payment information (${value?.paymentType.label})'),
              content: const _PaymentType(),
              isActive: true),
        ],
      ),
    );
  }
}

// @RoutePage()
// class NewReceiptPage extends ConsumerStatefulWidget {
//   const NewReceiptPage({super.key});

//   @override
//   ConsumerState<NewReceiptPage> createState() => _NewReceiptPageState();
// }

// class _NewReceiptPageState extends ConsumerState<NewReceiptPage>
//     with TickerProviderStateMixin {
//   late final TabController tabController;
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final notifier = ref.watch(newReceiptProvider.notifier);
//     final state = ref.watch(newReceiptProvider);
//     final value = state.value;
//     final activeInputs = state is! AsyncLoading;
//     return Scaffold(
//       floatingActionButton: FloatingActionButton.extended(
//           icon: const Icon(Icons.print_rounded),
      //     onPressed: () {},
      //     label: const Text('Print')),
      // appBar: AppBar(
      //     title: const Text('New receipt'),
      //     actions: [
      //       IconButton(
      //           onPressed: activeInputs ? notifier.clearState : null,
      //           icon: const Icon(Icons.clear_all_rounded))
      //     ],
      //     bottom: TabBar(
      //       tabAlignment: TabAlignment.start,
      //       isScrollable: true,
      //       controller: tabController,
      //       tabs: [
      //         const Tab(
      //             text: 'Customer information',
      //             icon: Icon(Icons.person_rounded)),
//               Tab(
//                   text:
//                       'Items (${value?.itemsState.selectedItems.length ?? 0})',
//                   icon: const Icon(Icons.category_rounded)),
//               const Tab(
//                   text: 'Payment information',
//                   icon: Icon(Icons.payment_rounded)),
//               const Tab(text: 'Preview', icon: Icon(Icons.preview_rounded)),
//             ],
//           )),
//       body: TabBarView(controller: tabController, children: const [
//         _CustomerTab(),
//         _ItemsTab(),
//         Placeholder(),
//         Placeholder(),
//       ]),
//     );
//   }
// }
