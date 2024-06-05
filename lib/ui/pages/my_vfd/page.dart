import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MyVFDPage extends ConsumerWidget {
  const MyVFDPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final value = ref.watch(userProvider.select((state) => state.value));
    final titleStyle = context.textTheme.labelLarge;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(title: Text('VFD Account information')),
          if (value case UserInfo info)
            SliverToBoxAdapter(
              child: DataTable(columns: const [
                DataColumn(label: Text('Title')),
                DataColumn(label: Text('Information')),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('Address', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.physicalAddress)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Street', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.street)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Mobile', style: titleStyle)),
                  DataCell(Text('0${info.vfdaInformation.mobile}')),
                ]),
                DataRow(cells: [
                  DataCell(Text('TIN', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.tin.toString())),
                ]),
                DataRow(cells: [
                  DataCell(Text('VRN', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.vrn)),
                ]),
                DataRow(cells: [
                  DataCell(Text('UIN', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.uin)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Serial', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.certKey)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Tax office', style: titleStyle)),
                  DataCell(Text(info.vfdaInformation.taxOffice)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Region', style: titleStyle)),
                  DataCell(Text(info.clientInformation.region)),
                ]),
                DataRow(cells: [
                  DataCell(Text('District', style: titleStyle)),
                  DataCell(Text(info.clientInformation.district)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Registered on', style: titleStyle)),
                  DataCell(Text(info.clientInformation.registrationDate)),
                ]),
                DataRow(cells: [
                  DataCell(Text('Status', style: titleStyle)),
                  DataCell(Text(info.status)),
                ]),
              ]),
            )
        ],
      ),
    );
  }
}
