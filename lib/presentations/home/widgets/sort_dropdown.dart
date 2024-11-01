import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SortDropdown extends StatelessWidget {
  final String? value;
  final List<String> options;
  final Function(String?) onChanged;

  const SortDropdown({
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            'Sort By',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 10.sp,
            ),
          ),
          value: value,
          icon: Icon(Icons.arrow_drop_down, color: Colors.black54),
          dropdownColor: Colors.white,
          isExpanded: true,
          style: TextStyle(color: Colors.black, fontSize: 10.sp),
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: TextStyle(color: Colors.black, fontSize: 10.sp),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}