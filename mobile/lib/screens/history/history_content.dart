import 'package:mobile/global/global_variable.dart';
import 'package:mobile/global/theme.dart';
import 'history_record_row.dart';
import 'package:mobile/widgets/no_glow_container.dart';
import 'package:flutter/material.dart';

class HistoryContent extends StatelessWidget {
  final double? height;

  const HistoryContent({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: NoGlowContainer(
        child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return index != 0
                ? HistoryRecordRow(
                    plate: "67-L1 399" +
                        (index < 10 ? "0" : "") +
                        index.toString(),
                    status: index % 3 == 0
                        ? KeepType.CheckedIn
                        : KeepType.CheckedOut,
                  )
                : Container(
                    child: HistoryRecordRow(
                      plate: "67-L1 399" +
                          (index < 10 ? "0" : "") +
                          index.toString(),
                      status: index % 3 == 0
                          ? KeepType.CheckedIn
                          : KeepType.CheckedOut,
                    ),
                    padding:
                        const EdgeInsets.only(top: MAIN_LAYOUT_PADDING / 3),
                  );
          },
        ),
      ),
    );
  }
}
