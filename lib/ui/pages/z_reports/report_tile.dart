part of 'page.dart';

class _ReportTile extends StatelessWidget {
  final bool initiallyExpanded;
  final int id;
  final ZReportStatus status;
  final String date, daily, net, tax, gross;
  const _ReportTile(
      {required this.id,
      required this.initiallyExpanded,
      required this.daily,
      required this.date,
      required this.status,
      required this.gross,
      required this.net,
      required this.tax});

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (status) {
      ZReportStatus.pending => Colors.blue,
      ZReportStatus.sent => Colors.green,
      ZReportStatus.blocked || ZReportStatus.fail => Colors.red,
      ZReportStatus.excluded => Colors.amber,
    };
    RichText infoText({required String label, required String amount}) =>
        RichText(
            text: TextSpan(children: [
          TextSpan(text: '$label: ', style: context.textTheme.labelLarge),
          TextSpan(text: '$amount Tzs', style: context.textTheme.bodyLarge)
        ]));
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: statusColor, width: 1),
          color: context.colorScheme.secondaryContainer.withOpacity(.25),
          // color: statusColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(edgeInsertValue)),
      padding: const EdgeInsets.all(edgeInsertValue / 2),
      margin: const EdgeInsets.all(edgeInsertValue / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(date, style: context.textTheme.titleMedium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: context.textTheme.titleMedium),
          const SpaceBetween(times: .5),
          infoText(label: 'Daily total', amount: daily),
          infoText(label: 'Net amount', amount: net),
          infoText(label: 'Tax amount', amount: tax),
          infoText(label: 'Gross', amount: gross),
        ],
      ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: edgeInsertValue / 2,
                vertical: edgeInsertValue / 8),
            decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(edgeInsertValue)),
            child: Text(status.label,
                style: context.textTheme.labelLarge
                    ?.copyWith(color: Colors.white)),
          )
        ],
      ),
    );
    // return ExpansionTile(
    //   expandedCrossAxisAlignment: CrossAxisAlignment.start,
    //   expandedAlignment: Alignment.topLeft,
    //   // childrenPadding: const EdgeInsets.all(edgeInsertValue),
    //   // initiallyExpanded: initiallyExpanded,
    //   title: Text('$id\t:\t\t$date'),
    //   subtitle: infoText(label: 'Daily total', amount: daily),
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: edgeInsertValue),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           // infoText(label: 'Daily total', amount: daily),
    //           infoText(label: 'Net amount', amount: net),
    //           infoText(label: 'Tax amount', amount: tax),
    //           infoText(label: 'Gross', amount: gross),
    //         ],
    //       ),
    //     ),
    //     // ButtonBar(
    //     //   alignment: MainAxisAlignment.start,
    //     //   children: [
    //     //     IconButton.filledTonal(
    //     //         onPressed: () {},
    //     //         icon: const Icon(Icons.document_scanner_rounded)),
    //     //     FilledButton(onPressed: () {}, child: const Text('Send')),
    //     //   ],
    //     // )
    //   ],
    // );
  }
}
