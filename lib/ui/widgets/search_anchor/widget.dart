import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/format_date.dart';
import 'package:flutter/material.dart';
part 'receipt_view.dart';

enum _SearchType { global, customers, receipts, items, zReports, vfd }

class AppSearchAnchor extends StatefulWidget {
  final _SearchType _type;
  const AppSearchAnchor({super.key}) : _type = _SearchType.global;

  const AppSearchAnchor.customers({super.key}) : _type = _SearchType.customers;
  const AppSearchAnchor.receipts({super.key}) : _type = _SearchType.receipts;
  const AppSearchAnchor.items({super.key}) : _type = _SearchType.items;
  const AppSearchAnchor.vfd({super.key}) : _type = _SearchType.vfd;
  const AppSearchAnchor.zReprts({super.key}) : _type = _SearchType.zReports;

  @override
  State<AppSearchAnchor> createState() => _AppSearchAnchorState();
}

class _AppSearchAnchorState extends State<AppSearchAnchor> {
  void Function(String) viewOnSubmitted = (text) {};

  void changeViewOnSubmitted(void Function(String) function) =>
      setState(() => viewOnSubmitted = function);

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
    return SearchAnchor(
        viewOnSubmitted: viewOnSubmitted,
        builder: (context, controller) {
          return const Padding(
            padding: EdgeInsets.all(edgeInsertValue),
            child: Icon(Icons.search_rounded),
          );
        },
        suggestionsBuilder: (context, controller) {
          return [
            for (int index = 0; index < 12; index++)
              ListTile(title: Text('Result number $index'))
          ];
        },
        viewBuilder: (suggestions) => _ReceiptViewBuilder(
              suggestions: suggestions,
              changeViewOnSubmitted: changeViewOnSubmitted,
            ),
        viewHintText: switch (widget._type) {
          _SearchType.customers => 'Search customers',
          _SearchType.items => 'Search products & services',
          _SearchType.receipts => 'Type customer name or TIN',
          _SearchType.vfd => 'Search VFD',
          _SearchType.zReports => 'Search Z-reports',
          _SearchType.global => 'Search',
        });
  }
}
