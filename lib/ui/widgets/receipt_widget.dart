import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:dirm_vfd/utils/format_date.dart';
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
    final stars = Text(
        '----------------------------------------------------------------',
        maxLines: 1,
        overflow: TextOverflow.clip,
        style: style(
            textStyle:
                context.textTheme.labelMedium?.copyWith(color: Colors.black)));

    Widget infoText(
        {required String name,
        required String value,
        bool spaceBetween = false,
        bool useColon = true}) {
          final style=context.textTheme.bodyLarge?.copyWith(
              // fontWeight: FontWeight.bold,
              color: Colors.black,
            );
      name = '$name${useColon ? ':' : ''} ';
      if (spaceBetween) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              name,
              style: style,
              textAlign: TextAlign.left,
            )),
            Expanded(
                child: Text(
              value,
              style: style,
              textAlign: TextAlign.end,
            ))
          ],
        );
      }
      return RichText(
          text: TextSpan(children: [
        TextSpan(
            text: name,
            style: GoogleFonts.ibmPlexMono(
                textStyle: style)),
        TextSpan(
            text: value,
            style: GoogleFonts.ibmPlexMono(
                textStyle: style))
      ]));
    }

    Text titleText(String text,
            {TextAlign align = TextAlign.start, bool bold = false}) =>
        Text(text,
            textAlign: align,
            style: style(
                textStyle: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: bold ? FontWeight.bold : null)));
    final uservalue = userState.value;
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
          titleText('***\t\t\tSTART OF LEGAL RECEIPT\t\t\t***', bold: true),
          const SpaceBetween(),
          SizedBox.square(
              dimension: edgeInsertValue * 6,
              child: Image.asset(assetAddress.traLogo)),
          const SpaceBetween(),
          Text(uservalue?.clientInformation.businessName ?? 'DIRM TECHWORKS',
              style: style(
                  textStyle: context.textTheme.bodyLarge
                      ?.copyWith(color: Colors.black))),
          if (uservalue?.clientInformation.district case String district
              when district.isNotEmpty)
            Text(district,
                style: style(
                    textStyle: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.black))),
          if (uservalue?.clientInformation.region case String region
              when region.isNotEmpty)
            Text(region,
                style: style(
                    textStyle: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.black))),
          infoText(
              name: 'TEL', value: '+255${uservalue?.clientInformation.mobile}'),
          infoText(name: 'TIN', value: '${uservalue?.vfdaInformation.tin}'),
          if (vrn != null)
            infoText(name: 'VRN', value: '${uservalue?.vfdaInformation.vrn}'),
          infoText(
              name: 'SERIAL NUMBER',
              value: '${uservalue?.vfdaInformation.certKey}'),
          infoText(name: 'UIN', value: '${uservalue?.vfdaInformation.uin}'),
          infoText(
              name: 'TAX OFFICE',
              value: '${uservalue?.vfdaInformation.taxOffice}'),
          const SpaceBetween(),
          if (customerName case String name when name.isNotEmpty)
            infoText(name: 'CUSTOMER NAME', value: name, spaceBetween: true),
          infoText(
              name: 'CUSTOMER ID TYPE',
              value: '$customerIdType',
              spaceBetween: true),
          if (customerId != null)
            infoText(
                name: 'CUSTOMER ID', value: '$customerId', spaceBetween: true),
          if (vrn != null)
            infoText(name: 'CUSTOMER VRN', value: '$vrn', spaceBetween: true),
          if (mobileNumber case String number when number.isNotEmpty)
            infoText(
                name: 'CUSTOMER MOBILE',
                value: '+255$number',
                spaceBetween: true),
          const SpaceBetween(),
          infoText(
              name: 'RECEIPT NUMBER',
              value: '$receiptNumber',
              spaceBetween: true),
          infoText(name: 'ZNO', value: '$zNumber', spaceBetween: true),
          infoText(
              useColon: false,
              name: 'RECEIPT DATE: ${formatDateOnly(timeString: dateTime)}',
              value: 'TIME: ${formatTimeOnly(timeString: dateTime)}',
              spaceBetween: true),
          const SpaceBetween(),
          stars,
          for (final item in items) ...[
            infoText(
              useColon: false,
              spaceBetween: true,
              name: '${item.name}\t\t${item.quantity}'
                  '*${formatNumber(item.amount / item.quantity)}',
              value: '${formatNumber(item.amount)}\t${item.taxCode}',
            ),
          ],
          stars,
          for (final value in vatRate) ...[
            infoText(
                useColon: false,
                spaceBetween: true,
                name: 'TAX\t\t\t${value.rate}\t-\t'
                    '${value.rate == 'A' ? '18' : '0'}%',
                value: formatNumber(value.amount))
          ],
          infoText(
            useColon: false,
            spaceBetween: true,
            name: 'TOTAL TAX',
            value: formatNumber(totalTax),
          ),
          stars,
          infoText(
              useColon: false,
              spaceBetween: true,
              name: 'TOTAL INCLUSIVE OF TAX',
              value: formatNumber(totalTaxIncl)),
          stars,
          Text(
            'RECEIPT VERIFICATION CODE',
            style: style(
                textStyle:
                    context.textTheme.bodyLarge?.copyWith(color: Colors.black)),
          ),
          Text(
            verificationCode,
            style: style(
                textStyle: context.textTheme.bodyMedium
                    ?.copyWith(color: Colors.black)),
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
