import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor/widget.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'item_info.dart';

@RoutePage()
class ItemsPage extends ConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemsProvider);
    final notifier = ref.watch(itemsProvider.notifier);
    final value = state.value;
    final activeInputs = state is! AsyncLoading;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            title:
                Text('Products & Services'),
            actions: [AppSearchAnchor.items()],
          ),
          if (state is AsyncLoading)
            const SliverToBoxAdapter(
              child: LinearProgressIndicator(),
            ),
          if (value?.items.isEmpty ?? true)
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(edgeInsertValue),
              child: Row(
                children: [
                  Icon(Icons.info_rounded),
                  SpaceBetween(),
                  Text('You don\'t have any item saved'),
                ],
              ),
            )),
          SliverList.separated(
              itemCount: value?.items.length ?? 0,
              itemBuilder: (context, index) {
                final item = value?.items[index];
                if (item != null) {
                  return ListTile(
                      subtitle: Text('Tax code: ${item.taxCode.label}'),
                      title: Text(item.name),
                      onTap: () => showAdaptiveDialog(
                                  context: context,
                                  builder: (context) => _ItemInfoDialog(item)),
                      trailing: IconButton(
                          onPressed: activeInputs
                              ? () async => await showAdaptiveDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog.adaptive(
                                        title: const Text('Delete item'),
                                        content: const Text('Are you sure '
                                            'you want to delete '
                                            'this item?'),
                                        actions: [
                                          OutlinedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Cancel')),
                                          FilledButton.tonal(
                                              onPressed: () {
                                                notifier.deleteItem(index);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Delete')),
                                        ],
                                      ))
                              : null,
                          icon: const Icon(Icons.delete_forever_rounded)));
                }
                return const SizedBox.shrink();
              },
              separatorBuilder: (context, index) => const Divider()),
        ],
      ),
    );
  }
}
