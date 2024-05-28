import 'package:dirm_vfd/utils/_.dart';
import 'package:flutter/material.dart';

enum _SearchType { global, customers, receipts, items, zReports, vfd }

class AppSearchAnchor extends StatelessWidget {
  final _SearchType _type;
  const AppSearchAnchor({super.key}) : _type = _SearchType.global;

  const AppSearchAnchor.customers({super.key}) : _type = _SearchType.customers;
  const AppSearchAnchor.receipts({super.key}) : _type = _SearchType.receipts;
  const AppSearchAnchor.items({super.key}) : _type = _SearchType.items;
  const AppSearchAnchor.vfd({super.key}) : _type = _SearchType.vfd;
  const AppSearchAnchor.zReprts({super.key}) : _type = _SearchType.zReports;
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
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
        viewHintText: switch (_type) {
          _SearchType.customers => 'Search customers',
          _SearchType.items => 'Search products & services',
          _SearchType.receipts => 'Search receipts',
          _SearchType.vfd => 'Search VFD',
          _SearchType.zReports => 'Search Z-reports',
          _SearchType.global => 'Search',
        });
  }
}
