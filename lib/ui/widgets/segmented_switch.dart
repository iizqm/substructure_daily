import 'package:flutter/material.dart';

class SegmentItem<T> {
  final T value;
  final String label;

  const SegmentItem({required this.value, required this.label});
}

class SegmentedSwitch<T> extends StatelessWidget {
  final List<SegmentItem<T>> segments;
  final T selected;
  final ValueChanged<T> onSelectionChanged;

  const SegmentedSwitch({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: segments.map((segment) {
        final isSelected = segment.value == selected;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onSelectionChanged(segment.value),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(255, 127, 134, 59)
                    : const Color.fromARGB(255, 56, 56, 56),
                border: isSelected
                    ? Border.all(color: Colors.yellow, width: 2)
                    : Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    segment.label,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
