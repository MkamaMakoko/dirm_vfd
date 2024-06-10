import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/format_number.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiptWidget extends ConsumerWidget {
  // final FullReceipt receipt;
  final List<({String rate, num amount})> vatRate;
  final List<({String name, num quantity, num amount, String taxCode})> items;
  final dynamic customerName,
      customerId,
      customerIdType,
      vrn,
      mobileNumber,
      receiptNumber,
      zNumber,
      dateTime,
      totalTaxExcl,
      totalTaxIncl,
      discount,
      verificationCode,
      // totalTax,
      verificationUrl;
  const ReceiptWidget({
    super.key,
    required this.vatRate,
    required this.items,
    required this.customerName,
    required this.customerId,
    required this.customerIdType,
    required this.vrn,
    required this.mobileNumber,
    required this.receiptNumber,
    required this.zNumber,
    required this.dateTime,
    required this.totalTaxExcl,
    required this.totalTaxIncl,
    // required this.totalTax,
    required this.discount,
    required this.verificationCode,
    required this.verificationUrl,
  });

  num get totalTax {
    num total = 0;
    for (final value in vatRate) {
      total += value.amount;
    }
    return total;
  }

  @override
  Widget build(BuildContext context, ref) {
    const style = GoogleFonts.ibmPlexMono;
    // final state = ref.watch(newReceiptProvider);
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
    // final value = state.value;
    // final result = value?.result;
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
          infoText(name: 'CUSTOMER NAME', value: '$customerName'),
          infoText(name: 'CUSTOMER ID TYPE', value: '$customerIdType'),
          infoText(name: 'CUSTOMER ID', value: '$customerId'),
          infoText(name: 'CUSTOMER VRN', value: '$vrn'),
          infoText(name: 'CUSTOMER MOBILE', value: '+255$mobileNumber'),
          const SpaceBetween(),
          infoText(name: 'RCT NO', value: receiptNumber.toString()),
          infoText(name: 'Z NUMBER', value: zNumber.toString()),
          infoText(name: 'RCT DATE', value: dateTime.toString()),
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
          for (final item in items) ...[
            Row(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    child: Text(item.name,
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
                    '${formatNumber(item.amount)}'
                    '\t${item.taxCode}',
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
              titleText(formatNumber(totalTaxExcl))
            ],
          ),
          divider,
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('DISCOUNT'),
              titleText(formatNumber(discount))
            ],
          ),
          divider,
          const SpaceBetween(),
          for (final value in vatRate) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText('TAX\t:\t${value.rate}'),
                titleText(formatNumber(value.amount))
              ],
            ),
            divider,
            const SpaceBetween()
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('TOTAL TAX'),
              titleText(formatNumber(totalTax))
            ],
          ),
          divider,
          const SpaceBetween(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleText('TOTAL TAX INC'),
              titleText(formatNumber(totalTaxIncl ?? 0))
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
            verificationCode,
            style: style(
                textStyle: context.textTheme.titleLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          const SpaceBetween(),
          QrImageView(data: verificationUrl, size: 200),
          const SpaceBetween(),
          titleText('***\t\t\t\tEND OF LEGAL RECEIPT\t\t\t***'),
          const SpaceBetween(times: 4)
        ],
      ),
    );
  }
}
