part of 'page.dart';

class _ReceiptPage extends ConsumerWidget {
  const _ReceiptPage();

  @override
  Widget build(BuildContext context, ref) {
    const style = GoogleFonts.ibmPlexMono;

    final state = ref.watch(newReceiptProvider);
    final userState = ref.watch(userProvider);
    final stars = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpaceBetween(),
        Text('**********************************************',
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: style(
                textStyle: context.textTheme.bodyLarge
                    ?.copyWith(color: Colors.black))),
        const SpaceBetween(),
      ],
    );

    Widget infoText({required String name, required String value}) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$name : ',
                style: GoogleFonts.ibmPlexMono(
                    textStyle: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black))),
            Expanded(
                child: Text(
              value,
              style: style(
                  textStyle: context.textTheme.bodyLarge
                      ?.copyWith(color: Colors.black)),
              textAlign: TextAlign.right,
            )),
          ],
        );

    Text titleText(String text, {TextAlign align = TextAlign.start}) => Text(
        text,
        textAlign: align,
        style: style(
            textStyle: context.textTheme.labelLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)));

    const divider =
        Divider(thickness: 1, color: Colors.black, height: edgeInsertValue * 2);
    const smallDivider = Divider(
        thickness: .25, color: Colors.black, height: edgeInsertValue * 2);

    final uservalue = userState.value;
    final value = state.value;
    final result = value?.result;
    ref.listen(newReceiptProvider, (_, state) {
      if (state case AsyncError(:final error, :final stackTrace)) {
        if (kDebugMode) {
          print(error);
          print(stackTrace);
        }
        context.snackBar(message: error.toString(), error: true);
      }
    });

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          titleText('***\t\t\tSTART OF LEGAL RECEIPT\t\t\t***'),
          const SpaceBetween(),
          SizedBox.square(
              dimension: edgeInsertValue * 8,
              child: Image.asset(assetAddress.traLogo)),
          const SpaceBetween(),
          Text(uservalue?.clientInformation.businessName ?? 'DIRM TECHWORKS',
              style: style(
                  textStyle: context.textTheme.titleLarge
                      ?.copyWith(color: Colors.black))),
          infoText(
              name: 'TEL', value: '+255${uservalue?.clientInformation.mobile}'),
          infoText(name: 'TIN', value: '${uservalue?.vfdaInformation.tin}'),
          infoText(name: 'VRN', value: '${uservalue?.vfdaInformation.vrn}'),
          infoText(name: 'UIN', value: '${uservalue?.vfdaInformation.uin}'),
          infoText(
              name: 'TAX OFFICE',
              value: '${uservalue?.vfdaInformation.taxOffice}'),
          stars,
          infoText(
              name: 'CUSTOMER NAME',
              value: '${value?.customersState.customer?.name}'),
          infoText(
              name: 'CUSTOMER ID TYPE',
              value: '${value?.customersState.customer?.idType.label}'),
          infoText(
              name: 'CUSTOMER ID',
              value: '${value?.customersState.customer?.customerId}'),
          infoText(
              name: 'CUSTOMER VRN',
              value: '${value?.customersState.customer?.vrn}'),
          infoText(
              name: 'CUSTOMER MOBILE',
              value: '+255${value?.customersState.customer?.phoneNumber}'),
          const SpaceBetween(),
          infoText(
              name: 'RCT NO',
              value: switch (result) {
                final ReceiptResult result => result.receiptNumber,
                _ => '---',
              }
                  .toString()),
          infoText(
              name: 'Z NUMBER',
              value: switch (result) {
                final ReceiptResult result => result.zNumber,
                _ => '---',
              }
                  .toString()),
          infoText(
              name: 'RCT DATE',
              value: switch (result) {
                final ReceiptResult result => result.date,
                _ => '---',
              }
                  .toString()),
          stars,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(fit: FlexFit.tight, child: titleText('DESCRIPTION')),
              Flexible(
                fit: FlexFit.tight,
                child: titleText('QYT.', align: TextAlign.center),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: titleText('PRICE', align: TextAlign.end))
            ],
          ),
          divider,
          for (final item
              in value?.itemsState.selectedItems ?? <SelectedItemState>[]) ...[
            Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(item.item.name,
                        style: style(
                            textStyle: context.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black)))),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    item.quantity.toString(),
                    style: style(
                        textStyle: context.textTheme.bodyMedium
                            ?.copyWith(color: Colors.black)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    '${formatNumber(item.totalPrice)}'
                    '\t${item.item.taxCode.vatRate}',
                    style: style(
                        textStyle: context.textTheme.bodyMedium
                            ?.copyWith(color: Colors.black)),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            smallDivider,
          ],
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('TOTAL TAX EXC'),
              titleText(formatNumber(value?.priceTaxExcluded ?? 0))
            ],
          ),
          divider,
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('DISCOUNT'),
              titleText(formatNumber(value?.discount ?? 0))
            ],
          ),
          divider,
          const SpaceBetween(),
          for (final item
              in value?.itemsState.selectedItems ?? <SelectedItemState>[]) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText('TAX\t:\t${item.item.taxCode.vatRate}'),
                titleText(formatNumber(
                    (value?.customersState.customer?.vrn.isEmpty ?? true)
                        ? 0
                        : item.totalTax))
              ],
            ),
            divider,
            const SpaceBetween()
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('TOTAL TAX'),
              titleText(formatNumber(value?.tax ?? 0))
            ],
          ),
          divider,
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('TOTAL TAX INC'),
              titleText(formatNumber(value?.totalAmount ?? 0))
            ],
          ),
          divider,
          stars,
          const SpaceBetween(),
          Text(
            'RECEIPT VERIFICATION CODE',
            style: style(
                textStyle: context.textTheme.titleMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          Text(
            switch (result) {
              final ReceiptResult result => result.verificationCode,
              _ => '-----',
            }
                .toString(),
            style: style(
                textStyle: context.textTheme.titleLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          const SpaceBetween(),
          QrImageView(
              data: switch (result) {
                final ReceiptResult result => result.verificationUrl,
                _ => 'Invalid',
              }
                  .toString(),
              size: 200),
          const SpaceBetween(),
          titleText('***\t\t\t\tEND OF LEGAL RECEIPT\t\t\t***'),
          const SpaceBetween(times: 4)
        ],
      ),
    );
  }
}
