import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// State for router bloc.
abstract class RouterState extends Equatable {
  /// State for router bloc.
  const RouterState();

  /// Build route stack for this page.
  List<Page> get buildRouteStack {
    if (popsInto == this) {
      return routes;
    } else {
      return [
        ...popsInto.routes,
        ...routes,
      ];
    }
  }

  /// What to replace state with on pop.
  RouterState get popsInto;

  /// Build routes for
  List<Page> get routes;
}
