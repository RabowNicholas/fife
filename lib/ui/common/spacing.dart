import 'package:flutter/material.dart';

class Spacing {
  static List<Widget> inBetween(List<Widget> children, Widget child,
      [Axis axis = Axis.vertical]) {
    final l = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      l.add(children[i]);
      if (i < children.length - 1) {
        l.add(child);
      }
    }
    return l;
  }

  static List<Widget> around(List<Widget> children, Widget child,
      [Axis axis = Axis.vertical]) {
    final l = <Widget>[child];
    for (int i = 0; i < children.length; i++) {
      l.add(children[i]);
      if (i < children.length - 1) {
        l.add(child);
      }
    }
    l.add(child);
    return l;
  }

  static List<Widget> spaceBetween(List<Widget> children, double space,
      [Axis axis = Axis.vertical]) {
    return inBetween(
        children,
        Padding(
          padding: EdgeInsets.only(
            right: axis == Axis.horizontal ? space : 0.0,
            bottom: axis == Axis.vertical ? space : 0.0,
          ),
        ));
  }
}
