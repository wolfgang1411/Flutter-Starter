import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:invoice_builder/core/models/pagination.model.dart';

class AppAsyncSelect<T> extends StatelessWidget {
  final String label;
  final Future<PaginatedResponse<T>> Function(int page, String search)
  fetchPage;
  final String Function(T item) itemLabel;
  final void Function(T? item) onChanged;
  final T? selectedItem;
  final bool Function(T item1, T item2)? compareFn;

  const AppAsyncSelect({
    super.key,
    required this.label,
    required this.fetchPage,
    required this.itemLabel,
    required this.onChanged,
    this.selectedItem,
    this.compareFn,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      selectedItem: selectedItem,
      compareFn: compareFn,

      // ✅ async pagination
      items: (filter, loadProps) async {
        final skip = loadProps?.skip ?? 0;
        final take = loadProps?.take ?? 30;
        final page = (skip ~/ take) + 1;

        final response = await fetchPage(page, filter);
        return response.items;
      },

      itemAsString: itemLabel,
      onChanged: onChanged,

      // ✅ THIS ENABLES SEARCH FIELD
      popupProps: PopupProps.bottomSheet(
        showSearchBox: true,
        disableFilter: true, // required for server filtering
        infiniteScrollProps: InfiniteScrollProps(
          loadProps: const LoadProps(skip: 0, take: 30),
        ),
      ),

      // optional but recommended for nice field UI
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
