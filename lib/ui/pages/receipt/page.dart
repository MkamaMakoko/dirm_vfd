import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/objects/receipt.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ReceiptPage extends ConsumerWidget {
  final Receipt receipt;
  const ReceiptPage({super.key, required this.receipt});

  @override
  Widget build(BuildContext context, ref) {
    final provider = receiptProvider(id: receipt.id);
    final state = ref.watch(provider);
    // final value = state.value;
    ref.listen(provider, (_, state) {
      if (state case AsyncError(:final error, :final stackTrace)) {
        if (kDebugMode) print(stackTrace);
        context.snackBar(message: error.toString(), error: true);
      }
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.medium(
            title: Text('Receipt view'),
          ),
          if (state case AsyncLoading())
            const SliverPadding(
              padding: EdgeInsets.all(edgeInsertValue),
              sliver: SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator.adaptive()),
              ),
            )
        ],
      ),
    );
  }
}
