import 'dart:developer';

import 'package:connectivity_plus_widget/connectivity/connectivity_plus_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marquee/marquee.dart';

class ConnectivityPlusWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final String? notConnectedText;
  final Decoration? decoration;
  final bool? marquee;

  ConnectivityPlusWidget(
      {Key? key,
      this.backgroundColor,
      this.height,
      this.width,
      this.textStyle,
      this.notConnectedText,
      this.decoration,
      this.padding,
      this.marquee = false})
      : super(key: key);
  final connectivityPlusService = GetIt.I<ConnectivityPlusService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityStatus>(
      stream: connectivityPlusService.connectivityStream,
      initialData: connectivityPlusService.getIntialStatus(),
      builder: (context, snapshot) {
        log("from snapshot", name: snapshot.data.toString());
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        } else {
          if (snapshot.data == ConnectivityStatus.wiFi ||
              snapshot.data == ConnectivityStatus.cellular) {
            return const SizedBox(
              height: 0,
              width: 0,
            );
          } else {
            return marquee == false
                ? Container(
                    padding: padding,
                    decoration: decoration,
                    color: decoration == null
                        ? backgroundColor ?? Colors.redAccent
                        : null,
                    height: height ?? 24,
                    width: width ?? double.infinity,
                    child: Center(
                        child: Text(
                      notConnectedText ?? "Internet is not connected",
                      style: textStyle ??
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                    )))
                : Container(
                    padding: padding,
                    decoration: decoration,
                    color: decoration == null
                        ? backgroundColor ?? Colors.redAccent
                        : null,
                    height: height ?? 24,
                    width: width ?? double.infinity,
                    child: Center(
                        child: Marquee(
                      blankSpace: 25,
                      text: notConnectedText ?? "Internet is not connected",
                      style: textStyle ??
                          const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                    )));
          }
        }
      },
    );
  }
}

class ConnectivityPlusCustomWidget extends StatelessWidget {
  final Widget customWidget;

  ConnectivityPlusCustomWidget({Key? key, required this.customWidget})
      : super(key: key);
  final connectivityPlusService = GetIt.I<ConnectivityPlusService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityStatus>(
      stream: connectivityPlusService.connectivityStream,
      initialData: connectivityPlusService.getIntialStatus(),
      builder: (context, snapshot) {
        log("from snapshot", name: snapshot.data.toString());
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 0,
            width: 0,
          );
        } else {
          if (snapshot.data == ConnectivityStatus.wiFi ||
              snapshot.data == ConnectivityStatus.cellular) {
            return const SizedBox(
              height: 0,
              width: 0,
            );
          } else {
            return customWidget;
          }
        }
      },
    );
  }
}
