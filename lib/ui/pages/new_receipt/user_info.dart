part of 'page.dart';

class _UserInfo extends ConsumerWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final value = ref.watch(userProvider.select((state) => state.value));
    Widget infoWidget(
        {required String label, required String value, bool useRow = false}) {
      final labelWidget = Text(label, style: context.textTheme.labelMedium);
      final valueWidget = Text(value, style: context.textTheme.bodyMedium);
      if (useRow) {
        return Row(
          children: [
            labelWidget,
            const SpaceBetween(times: .5),
            Expanded(child: valueWidget)
          ],
        );
      }
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [labelWidget, valueWidget],
      );
    }

    if (value case UserInfo info) {
      return SecondaryContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('Business name', style: context.textTheme.labelLarge),
            // Text(info.clientInformation.businessName,
            //     style: context.textTheme.bodyLarge),
            infoWidget(
                label: 'Business name',
                value: info.clientInformation.businessName),
            const SpaceBetween(),
            infoWidget(
                useRow: true,
                label: 'TIN',
                value: info.vfdaInformation.tin.toString()),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
