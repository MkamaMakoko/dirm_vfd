part of 'page.dart';

class _ReportTile extends StatelessWidget {
  final bool initiallyExpanded;
  final String date, daily, net, tax, gross;
  const _ReportTile(
      {required this.initiallyExpanded,
      required this.daily,
      required this.date,
      required this.gross,
      required this.net,
      required this.tax});

  @override
  Widget build(BuildContext context) {
    RichText infoText({required String label, required String amount}) =>
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '$label: ',
              style: context.textTheme.labelLarge),
          TextSpan(text: '$amount Tzs', style: context.textTheme.bodyLarge)
        ]));
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.topLeft,
      // childrenPadding: const EdgeInsets.all(edgeInsertValue),
      initiallyExpanded: initiallyExpanded,
      title: Text(date),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: edgeInsertValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoText(label: 'Daily total', amount: daily),
              infoText(label: 'Net amount', amount: net),
              infoText(label: 'Tax amount', amount: tax),
              infoText(label: 'Gross', amount: gross),
            ],
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.document_scanner_rounded)),
            FilledButton(onPressed: () {}, child: const Text('Send')),
          ],
        )
      ],
    );
  }
}
