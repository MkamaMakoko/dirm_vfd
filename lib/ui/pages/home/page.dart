import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/_.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/ui/widgets/search_anchor/widget.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'menu_button.dart';
part 'drawer.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(userProvider, (_, state) {
      if (state case AsyncValue(value: null)) {
        context.router.replaceAll([const InitialRoute()]);
      }
    });
    final value = ref.watch(userProvider.select((state) => state.value));
    final selectedBranch =
        ref.watch(selectedBranchProvider.select((state) => state.value));
    return Scaffold(
      drawer: const _Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text(appTitle),
            leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: const Icon(Icons.person_rounded))),
            actions: const [AppSearchAnchor()],
          ),
          if (value case UserInfo info)
            SliverPadding(
              padding: const EdgeInsets.all(edgeInsertValue),
              sliver: SliverToBoxAdapter(
                child: DropdownMenu<Branch>(
                    initialSelection: selectedBranch ?? info.branches.first,
                    width: context.screenSize.width - edgeInsertValue * 2,
                    enabled: info.branches.length > 1,
                    onSelected: (value) {
                      if (value case Branch value) {
                        ref
                            .read(selectedBranchProvider.notifier)
                            .changeBracnh(value);
                      }
                    },
                    label: const Text('Branches'),
                    dropdownMenuEntries: [
                      for (final branch in info.branches)
                        DropdownMenuEntry(value: branch, label: branch.name),
                    ]),
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.all(edgeInsertValue / 2),
            sliver: SliverGrid(
                delegate: SliverChildListDelegate.fixed([
                  const _BigMenuButton(
                    label: 'New receipt',
                    iconData: Icons.create_rounded,
                    route: NewReceiptRoute(),
                  ),
                  _BigMenuButton(
                    label: 'My receipts',
                    iconData: Icons.receipt_long_rounded,
                    route: MyReceiptsRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'Customers',
                    iconData: Icons.people_rounded,
                    route: CustomersRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'Products & Services',
                    iconData: Icons.shopping_cart_rounded,
                    route: ItemsRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'Z Reports',
                    iconData: Icons.show_chart_rounded,
                    route: ZReportsRoute(),
                  ),
                  const _BigMenuButton(
                    label: 'My VFD',
                    iconData: Icons.print_rounded,
                    route: MyVFDRoute(),
                  ),
                ]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: edgeInsertValue / 4,
                    crossAxisSpacing: edgeInsertValue / 4)),
          ),
        ],
      ),
    );
  }
}
