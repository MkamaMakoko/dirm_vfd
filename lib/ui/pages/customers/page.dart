import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'info_dialog.dart';

@RoutePage()
class CustomersPage extends ConsumerWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(customersProvider.notifier);
    final customers = ref.watch(customersProvider
        .select((state) => state.value?.customers ?? <Customer>[]));
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            title: Text('Customers'),
            actions: [AppSearchAnchor.customers()],
          ),
          if (customers.isEmpty)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(edgeInsertValue),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_rounded),
                    SpaceBetween(),
                    Expanded(
                        child: Text('Your customers will automatically'
                            ' be saved here once you create their receipts'))
                  ],
                ),
              ),
            ),
          SliverList.separated(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final customer = customers[index];
                return ListTile(
                  onTap: () {},
                  trailing: IconButton(
                      onPressed: () => showAdaptiveDialog(
                          context: context,
                          builder: (context) => _InfoDialog(customer)),
                      icon: const Icon(Icons.info_outline_rounded)),
                  title: Text(customer.name),
                );
              },
              separatorBuilder: (context, index) => const Divider())
        ],
      ),
    );
  }
}
