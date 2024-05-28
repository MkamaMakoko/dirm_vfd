import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'report_tile.dart';

@RoutePage()
class ZReportsPage extends StatelessWidget {
  const ZReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('My Z-Reports'),
            bottom: PreferredSize(
                preferredSize:
                    const Size(double.maxFinite, edgeInsertValue * 2),
                child: Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                        left: edgeInsertValue,
                        right: edgeInsertValue,
                        // top: edgeInsertValue,
                        bottom: edgeInsertValue / 1.5),
                    child: Text('200 Z-Reports found',
                        style: context.textTheme.titleSmall))),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.clear_all_rounded)),
              const AppSearchAnchor.zReprts(),
            ],
          ),
          SliverList.builder(
            // separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: 200,
            itemBuilder: (context, index) {
              // return ListTile(
              //   onTap: () {},
              //   // titleAlignment: ListTileTitleAlignment.center,
              //   isThreeLine: true,
              //   // leading: CircleAvatar(
              //   //     backgroundColor: context.colorScheme.secondaryContainer,
              //   //     child: Text((index + 1).toString())),
              //   trailing:
              //       FilledButton(onPressed: () {}, child: const Text('Sent')),
              //   title: Text('2024-04-28', style: context.textTheme.titleMedium),
              //   subtitle: RichText(
              //       text: TextSpan(children: const [
              //     TextSpan(text: 'Daily total: 560,000.00 Tzs'),
              //     TextSpan(text: '\nNet amount: 560,000.00 Tzs'),
              //     TextSpan(text: '\nTax amount: 0.00 Tzs'),
              //     TextSpan(text: '\nGross: 311,714, 664.85.00 Tzs'),
              //   ], style: context.textTheme.bodyMedium)),
              // );
              return _ReportTile(
                initiallyExpanded: index == 0,
                date: '2024-04-28',
                daily: '560,000.00',
                net: '560,000.00',
                tax: '0.00',
                gross: '311,714, 664.85.00',
              );
            },
          )
        ],
      ),
    );
  }
}
