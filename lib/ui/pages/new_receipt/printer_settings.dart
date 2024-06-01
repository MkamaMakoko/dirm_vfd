// part of 'page.dart';

// class _PrinterSettings extends ConsumerWidget {
//   const _PrinterSettings();

//   @override
//   Widget build(BuildContext context, ref) {
//     final state = ref.watch(printerProvider);
//     final value = state.value;
//     print(state);
//     return Padding(
//       padding: const EdgeInsets.all(edgeInsertValue),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Bluetooth devices', style: context.textTheme.titleMedium),
//           if (value case PrinterState state)
//             ListView.separated(
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final device = state.devices[index];
//                 return ListTile(
//                   visualDensity: VisualDensity.compact,
//                   title: Text(device.name ?? 'Bluetooth device'),
//                   onTap: () =>
//                       ref.read(printerProvider.notifier).connectDevice(device),
//                 );
//               },
//               separatorBuilder: (context, index) => const Divider(height: 0),
//               itemCount: state.devices.length,
//             ),
//         ],
//       ),
//     );
//   }
// }
