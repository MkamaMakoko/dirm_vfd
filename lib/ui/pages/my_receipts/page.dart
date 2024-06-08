import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MyReceiptsPage extends ConsumerStatefulWidget {
  const MyReceiptsPage({super.key});

  @override
  ConsumerState<MyReceiptsPage> createState() => _MyReceiptsPageState();
}

class _MyReceiptsPageState extends ConsumerState<MyReceiptsPage> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myReceiptsProvider(page: currentPage));
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
          onPressed: (value?.totalReceipts ?? 0) <= 50
              ? null
              : () => setState(() => currentPage++),
          label: const Text('Next'),
          icon: const Icon(Icons.navigate_next_rounded),
        ),
      ],
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('My Receipts'),
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
                      child: Text('${value.totalReceipts} receipts found',
                          style: context.textTheme.titleSmall))),
              _ => null,
            },
            actions: [
              // IconButton(
              //     onPressed: () {}, icon: const Icon(Icons.clear_all_rounded)),
              IconButton(
                  onPressed: () => ref.invalidate(myReceiptsProvider),
                  icon: const Icon(Icons.refresh_rounded)),
              const AppSearchAnchor.receipts(),
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
          if (value case MyReceiptsResults results)
            SliverList.separated(
              separatorBuilder: (context, index) => const Divider(height: 0),
              itemCount: results.receipts.length,
              itemBuilder: (context, index) {
                final receipt = results.receipts[index];
                return ListTile(
                  onTap: () =>
                      context.router.push(ReceiptRoute(receipt: receipt)),
                  titleAlignment: ListTileTitleAlignment.center,
                  isThreeLine: true,
                  leading: CircleAvatar(
                      backgroundColor: context.colorScheme.secondaryContainer,
                      child: Text((index + 1).toString())),
                  // trailing: const Text('Tsh 300,000.00'),
                  title: Text(receipt.custName),
                  subtitle: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: receipt.pmtAmount?.toString(),
                        style: context.textTheme.labelLarge?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '\n${receipt.dateTime}',
                        style: context.textTheme.bodySmall),
                  ])),
                );
              },
            )
        ],
      ),
    );
  }
}
