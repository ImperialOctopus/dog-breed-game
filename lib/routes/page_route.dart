import 'package:flutter/material.dart';

abstract class PageRoute<T> extends StatelessWidget {
  Page<T> get page;
}
