import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'report_tile.dart';

@RoutePage()
class ZReportsPage extends ConsumerStatefulWidget {
  const ZReportsPage({super.key});

  @override
  ConsumerState<ZReportsPage> createState() => _ZReportsPageState();
}

class _ZReportsPageState extends ConsumerState<ZReportsPage> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(zReportsProvider(page: currentPage));
    final value = state.value;
    return Scaffold(
      persistentFooterButtons: [
        TextButton.icon(
          onPressed:
              currentPage == 1 ? null : () => setState(() => currentPage--),
          label: const Text('Previous'),
          icon: const Icon(Icons.navigate_before_rounded),
        ),
        TextButton.icon(
          onPressed: (value?.totalZReports ?? 0) <= 50
              ? null
              : () => setState(() => currentPage++),
          label: const Text('Next'),
          icon: const Icon(Icons.navigate_next_rounded),
        ),
      ],
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('My Z-Reports'),
            bottom: switch (state) {
              AsyncData(:final value) => PreferredSize(
                  preferredSize:
                      const Size(double.maxFinite, edgeInsertValue * 2),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(
                          left: edgeInsertValue,
                          right: edgeInsertValue,
                          // top: edgeInsertValue,
                          bottom: edgeInsertValue / 1.5),
                      child: Text('${value.totalZReports} Z-Reports found',
                          style: context.textTheme.titleSmall))),
              _ => null,
            },
            actions: [
              // IconButton(
              //     onPressed: () {}, icon: const Icon(Icons.clear_all_rounded)),
              IconButton(
                  onPressed: () => ref.invalidate(zReportsProvider),
                  icon: const Icon(Icons.refresh_rounded)),
              const AppSearchAnchor.zReprts(),
            ],
          ),
          if (state is AsyncLoading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(edgeInsertValue),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          SliverList.builder(
            // separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: 0,
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
