import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final int? maxLength;

  const ExpandableTextWidget({
    Key? key,
    required this.text,
    required this.textStyle,
    this.maxLength = 50,
  }) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  void updateText() {
    int lineCounter = 0;
    int breakIndex = 0;
    for (int i = 0; i < widget.text.length; i++) {
      if (widget.text[i] == '\n') {
        lineCounter++;
      }
      if (lineCounter == 3) {
        breakIndex = i;
        break;
      }
    }
    if (lineCounter == 3 && breakIndex < widget.maxLength!) {
      firstHalf = widget.text.substring(0, breakIndex);
      secondHalf = widget.text.substring(breakIndex, widget.text.length);
    } else if (widget.text.length >= widget.maxLength!) {
      firstHalf = widget.text.substring(0, widget.maxLength);
      secondHalf = widget.text.substring(widget.maxLength!, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  void didUpdateWidget(covariant ExpandableTextWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    updateText();
  }

  @override
  void initState() {
    super.initState();
    updateText();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: widget.textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    flag ? ("$firstHalf... ") : (firstHalf + secondHalf),
                    style: widget.textStyle,
                  ),
                ),
                InkWell(
                  hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                  child: Text(
                    flag ? " Read more" : " Show less",
                    style: AppTextStyles.text14w400.indigo,
                  ),
                ),
              ],
            ),
    );
  }
}
