import 'package:buffalo_design/core/styles/colors.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

/// A customizable InkWell widget that opens the MultiSelectDialog

class BFMultipleOptionField<V> extends FormField<List<V>> {
  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Style the Container that makes up the field.
  final BoxDecoration? decoration;

  /// Set text that is displayed on the button.
  final Text? buttonText;

  /// Specify the button icon.
  final Icon? buttonIcon;

  /// The text at the top of the dialog.
  final Widget? title;

  /// List of items to select from.
  final List<MultiSelectItem<V>> items;

  /// Fires when the an item is selected / unselected.
  final void Function(List<V>)? onSelectionChanged;

  /// Overrides the default MultiSelectChipDisplay attached to this field.
  /// If you want to remove it, use MultiSelectChipDisplay.none().
  final MultiOptionChipDisplay<V>? chipDisplay;

  /// Fires when confirm is tapped.
  final void Function(List<V>) onConfirm;

  /// Toggles search functionality.
  final bool? searchable;

  /// Text on the confirm button.
  final Text? confirmText;

  /// Text on the cancel button.
  final Text? cancelText;

  /// Set the color of the space outside the BottomSheet.
  final Color? barrierColor;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Give the dialog a fixed height
  final double? height;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color Function(V)? colorator;

  /// Set the background color of the dialog.
  final Color? backgroundColor;

  /// Color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Replaces the deafult search icon when searchable is true.
  final Icon? searchIcon;

  /// Replaces the default close search icon when searchable is true.
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the text that is typed into the search field.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  final Color? backgroundContainerColor;

  BFMultipleOptionField({
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.chipDisplay,
    this.searchable,
    this.confirmText,
    this.cancelText,
    this.barrierColor,
    this.selectedColor = CommonColor.primary,
    this.searchHint,
    this.height,
    this.colorator,
    this.backgroundColor,
    this.backgroundContainerColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.checkColor,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.key,
  }) : super(builder: (FormFieldState<List<V>> state) {
          _BFMultiSelectDialogFieldView field = _BFMultiSelectDialogFieldView<V>(
            title: title,
            items: items,
            buttonText: buttonText,
            buttonIcon: buttonIcon,
            chipDisplay: chipDisplay,
            decoration: decoration,
            listType: listType,
            onConfirm: onConfirm,
            onSelectionChanged: onSelectionChanged,
            initialValue: initialValue,
            searchable: searchable,
            confirmText: confirmText,
            cancelText: cancelText,
            barrierColor: barrierColor,
            selectedColor: selectedColor,
            searchHint: searchHint,
            height: height,
            colorator: colorator,
            backgroundColor: backgroundColor,
            backgroundContainerColor: backgroundContainerColor,
            unselectedColor: unselectedColor,
            searchIcon: searchIcon,
            closeSearchIcon: closeSearchIcon,
            itemsTextStyle: itemsTextStyle,
            searchTextStyle: searchTextStyle,
            searchHintStyle: searchHintStyle,
            selectedItemsTextStyle: selectedItemsTextStyle,
            checkColor: checkColor,
          );
          return _BFMultiSelectDialogFieldView<V>._withState(field as _BFMultiSelectDialogFieldView<V>, state);
        });
}

class _BFMultiSelectDialogFieldView<V> extends StatefulWidget {
  final MultiSelectListType? listType;
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final Widget? title;
  final List<MultiSelectItem<V>> items;
  final void Function(List<V>)? onSelectionChanged;
  final MultiOptionChipDisplay<V>? chipDisplay;
  final List<V>? initialValue;
  final void Function(List<V>)? onConfirm;
  final bool? searchable;
  final Text? confirmText;
  final Text? cancelText;
  final Color? barrierColor;
  final Color? selectedColor;
  final double? height;
  final String? searchHint;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final Color? checkColor;
  final Color? backgroundContainerColor;
  final FormFieldState<List<V>>? state;

  const _BFMultiSelectDialogFieldView({
    required this.items,
    this.title,
    required this.buttonText,
    required this.buttonIcon,
    required this.listType,
    this.decoration,
    required this.onSelectionChanged,
    this.onConfirm,
    this.chipDisplay,
    this.initialValue,
    this.searchable,
    required this.confirmText,
    required this.cancelText,
    required this.barrierColor,
    this.selectedColor,
    required this.searchHint,
    required this.height,
    required this.colorator,
    required this.backgroundColor,
    this.backgroundContainerColor,
    required this.unselectedColor,
    required this.searchIcon,
    required this.closeSearchIcon,
    required this.itemsTextStyle,
    required this.searchTextStyle,
    required this.searchHintStyle,
    required this.selectedItemsTextStyle,
    required this.checkColor,
    this.state,
  });

  /// This constructor allows a FormFieldState to be passed in. Called by MultiSelectDialogField.
  _BFMultiSelectDialogFieldView._withState(_BFMultiSelectDialogFieldView<V> field, FormFieldState<List<V>> this.state)
      : items = field.items,
        title = field.title,
        buttonText = field.buttonText,
        buttonIcon = field.buttonIcon,
        listType = field.listType,
        decoration = field.decoration,
        onSelectionChanged = field.onSelectionChanged,
        onConfirm = field.onConfirm,
        chipDisplay = field.chipDisplay,
        initialValue = field.initialValue,
        searchable = field.searchable,
        confirmText = field.confirmText,
        cancelText = field.cancelText,
        barrierColor = field.barrierColor,
        selectedColor = field.selectedColor,
        height = field.height,
        searchHint = field.searchHint,
        colorator = field.colorator,
        backgroundContainerColor = field.backgroundContainerColor,
        backgroundColor = field.backgroundColor,
        unselectedColor = field.unselectedColor,
        searchIcon = field.searchIcon,
        closeSearchIcon = field.closeSearchIcon,
        itemsTextStyle = field.itemsTextStyle,
        searchHintStyle = field.searchHintStyle,
        searchTextStyle = field.searchTextStyle,
        selectedItemsTextStyle = field.selectedItemsTextStyle,
        checkColor = field.checkColor;

  @override
  _BFMultiSelectDialogFieldViewState createState() => _BFMultiSelectDialogFieldViewState<V>();
}

class _BFMultiSelectDialogFieldViewState<V> extends State<_BFMultiSelectDialogFieldView<V>> {
  List<V> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedItems.addAll(widget.initialValue!);
    }
  }

  Widget _buildInheritedChipDisplay() {
    List<MultiSelectItem<V>?> chipDisplayItems = [];
    chipDisplayItems = _selectedItems.map((e) => widget.items.firstWhereOrNull((element) => e == element.value)).toList();
    chipDisplayItems.removeWhere((element) => element == null);
    if (widget.chipDisplay != null) {
      if (widget.chipDisplay?.disabled ?? true) {
        return Container();
      } else {
        return MultiOptionChipDisplay<V>(
          items: chipDisplayItems,
          colorator: widget.chipDisplay!.colorator ?? widget.colorator,
          onCloseTapped: (item) {
            setState(() {
              _selectedItems.remove(item);
            });
            widget.onConfirm?.call(_selectedItems);
          },
          decoration: widget.chipDisplay?.decoration,
          alignment: widget.chipDisplay?.alignment,
          textStyle: widget.chipDisplay?.textStyle,
          icon: widget.chipDisplay?.icon,
          shape: widget.chipDisplay?.shape,
          scroll: widget.chipDisplay?.scroll ?? false,
          height: widget.chipDisplay?.height,
          chipWidth: widget.chipDisplay?.chipWidth,
        );
      }
    } else {
      // user didn't specify a chipDisplay, build the default
      return MultiOptionChipDisplay<V>(
        items: chipDisplayItems,
        colorator: widget.colorator,
        onCloseTapped: (item) {
          setState(() {
            _selectedItems.remove(item);
          });
          widget.onConfirm?.call(_selectedItems);
        },
        // chipColor: (widget.selectedColor != null && widget.selectedColor != Colors.transparent) ? widget.selectedColor!.withOpacity(0.35) : null,
      );
    }
  }

  /// Calls showDialog() and renders a MultiSelectDialog.
  _showDialog(BuildContext ctx) async {
    await showDialog(
      barrierColor: widget.barrierColor,
      context: context,
      builder: (ctx) {
        return MultiSelectDialog<V>(
          checkColor: widget.checkColor,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchHintStyle: widget.searchHintStyle,
          searchTextStyle: widget.searchTextStyle,
          itemsTextStyle: widget.itemsTextStyle,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          unselectedColor: widget.unselectedColor,
          backgroundColor: widget.backgroundColor,
          colorator: widget.colorator,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          onSelectionChanged: widget.onSelectionChanged,
          height: widget.height,
          listType: widget.listType,
          items: widget.items,
          title: widget.title ?? const Text("Select"),
          initialValue: _selectedItems,
          searchable: widget.searchable ?? false,
          confirmText: widget.confirmText,
          cancelText: widget.cancelText,
          onConfirm: (selected) {
            if (widget.state != null) {
              widget.state!.didChange(selected);
            }
            _selectedItems = selected;
            if (widget.onConfirm != null) widget.onConfirm!(selected);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _showDialog(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(minHeight: kMinInteractiveDimension),
            decoration: ShapeDecoration(
              color: widget.backgroundContainerColor,
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: CommonColor.borderGrey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.buttonText ?? const Text("Select"),
                widget.buttonIcon ?? const Icon(Icons.arrow_downward),
              ],
            ),
          ),
        ),
        _buildInheritedChipDisplay(),
        widget.state != null && widget.state!.hasError ? const SizedBox(height: 5) : Container(),
        widget.state != null && widget.state!.hasError
            ? Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      widget.state!.errorText ?? '',
                      style: TextStyle(
                        color: Colors.red[800],
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

/// A widget meant to display selected values as chips.
// ignore: must_be_immutable
class MultiOptionChipDisplay<V> extends StatefulWidget {
  /// The source list of selected items.
  final List<MultiSelectItem<V>?>? items;

  /// Fires when a chip is tapped.
  final Function(V)? onCloseTapped;

  /// Change the alignment of the chips.
  final Alignment? alignment;

  /// Style the Container that makes up the chip display.
  final BoxDecoration? decoration;

  /// Style the text on the chips.
  final TextStyle? textStyle;

  /// A function that sets the color of selected items based on their value.
  final Color? Function(V)? colorator;

  /// An icon to display prior to the chip's label.
  final Icon? icon;

  /// Set a ShapeBorder. Typically a RoundedRectangularBorder.
  final ShapeBorder? shape;

  /// Enables horizontal scrolling.
  final bool scroll;

  /// Set a fixed height.
  final double? height;

  /// Set the width of the chips.
  final double? chipWidth;

  bool? disabled;

  MultiOptionChipDisplay({
    super.key,
    this.items,
    this.onCloseTapped,
    this.alignment,
    this.decoration,
    this.textStyle,
    this.colorator,
    this.icon,
    this.shape,
    this.scroll = false,
    this.height,
    this.chipWidth,
  }) {
    this.disabled = false;
  }

  MultiOptionChipDisplay.none({
    super.key,
    this.items = const [],
    this.disabled = true,
    this.onCloseTapped,
    this.alignment,
    this.decoration,
    this.textStyle,
    this.colorator,
    this.icon,
    this.shape,
    this.scroll = false,
    this.height,
    this.chipWidth,
  });

  @override
  State<MultiOptionChipDisplay<V>> createState() => _MultiOptionChipDisplayState<V>();
}

class _MultiOptionChipDisplayState<V> extends State<MultiOptionChipDisplay<V>> {
  final Color? chipColor = Colors.grey.withOpacity(0.3);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (widget.items == null || widget.items!.isEmpty) return Container();
    return Container(
      decoration: widget.decoration,
      alignment: widget.alignment ?? Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: widget.scroll ? 0 : 10),
      child: widget.scroll
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: widget.height ?? MediaQuery.of(context).size.height * 0.08,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.items!.length,
                itemBuilder: (ctx, index) {
                  return _buildItem(widget.items![index]!, context);
                },
              ),
            )
          : Wrap(
              children: widget.items != null
                  ? widget.items!.map((item) => _buildItem(item!, context)).toList()
                  : <Widget>[
                      Container(),
                    ],
            ),
    );
  }

  Widget _buildItem(MultiSelectItem<V> item, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: CommonColor.colorGreyF0F2F4,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        color: CommonColor.colorGreyF0F2F4,
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.only(top: 8, right: 8),
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.chipWidth,
            child: Text(
              item.label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black87, height: 1.2, fontSize: 16),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.all(2),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: CommonColor.colorGrey91979D,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
            onTap: () {
              widget.onCloseTapped?.call(item.value);
              setState(() {
                widget.items?.remove(item);
              });
            },
          ),
        ],
      ),
    );
  }
}
