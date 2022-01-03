
import 'package:flutter/material.dart';

import '../app/core/utils/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({required this.text,
      this.press,
        this.loading = false,
        this.foreground = Colors.white,
        });

  final String text;
  final Function()? press;
  final bool loading;

  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: .15.ofWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: loading
                    ? SizedBox(
                  child: CircularProgressIndicator(),
                  height: 25,
                  width: 25,
                )
                    : Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              onPressed: loading ? null : press,
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
