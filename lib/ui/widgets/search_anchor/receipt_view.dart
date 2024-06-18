part of 'widget.dart';

class _ReceiptViewBuilder extends StatefulWidget {
  final Iterable<Widget> suggestions;
  final SearchController controller;
  final void Function(void Function(String)) changeViewOnSubmitted;
  const _ReceiptViewBuilder(
      {required this.suggestions,
      required this.changeViewOnSubmitted,
      required this.controller});

  @override
  State<_ReceiptViewBuilder> createState() => __ReceiptViewBuilderState();
}

class __ReceiptViewBuilderState extends State<_ReceiptViewBuilder> {
  late final TextEditingController miniTEC, maxTEC;
  DateTimeRange range =
      DateTimeRange(start: DateTime(2020), end: DateTime.now());
  PaymentType paymentType = PaymentType.cash;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
      // if(widget.controller.)
    });
    miniTEC = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    maxTEC = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  void Function(String) get onViewSubmitted => (text) {
        final isTIN = int.tryParse(text) != null;
        final provider = searchReceiptsProvider(
          customerName: isTIN ? '' : text,
          tin: isTIN ? text : null,
          startDate: range.start,
          endDate: range.end,
          maxmum: double.tryParse(maxTEC.text),
          minimum: double.tryParse(miniTEC.text),
          paymentType: paymentType,
        );
        context.router.push(MyReceiptsRoute(searchReceiptsProvider: provider));
      };

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    widget.changeViewOnSubmitted(onViewSubmitted);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: edgeInsertValue),
          child: TextButton.icon(
              icon: const Icon(Icons.date_range_rounded),
              onPressed: () async => await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          currentDate: DateTime.now(),
                          lastDate: DateTime.now())
                      .then((range) {
                    if (range case DateTimeRange range) {
                      setState(() => this.range = range);
                    }
                  }),
              label: Text('From ${formatDateOnly(time: range.start)}'
                  '\t\tto\t\t${formatDateOnly(time: range.end)}')),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: edgeInsertValue),
          child: DropdownMenu<PaymentType>(
              width: context.screenSize.width - (edgeInsertValue * 2),
              initialSelection: paymentType,
              label: const Text('Payment type'),
              onSelected: (value) {
                if (value case PaymentType type) {
                  setState(() => paymentType = type);
                }
              },
              dropdownMenuEntries: PaymentType.values
                  .map((value) =>
                      DropdownMenuEntry(value: value, label: value.label))
                  .toList()),
        ),
        Padding(
          padding: const EdgeInsets.all(edgeInsertValue),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: miniTEC,
                  maxLines: 1,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  decoration: const InputDecoration(
                      labelText: 'Minimum amount',
                      border: OutlineInputBorder()),
                ),
              ),
              const SpaceBetween(),
              Expanded(
                child: TextField(
                  controller: maxTEC,
                  maxLines: 1,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true, signed: true),
                  decoration: const InputDecoration(
                      labelText: 'Maximum amount',
                      border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(edgeInsertValue),
          child: SizedBox(
            width: double.maxFinite,
            child: FilledButton.icon(
              onPressed: () {
                onViewSubmitted(widget.controller.text);
              },
              label: const Text('Search'),
              icon: const Icon(Icons.search_rounded),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  widget.suggestions.elementAt(index),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: widget.suggestions.length),
        ),
      ],
    );
  }
}
