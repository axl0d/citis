import 'package:citis/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifier extends StateNotifier<List<TechnicalTrack>> {
  FilterNotifier() : super([]);

  void toggleFilter(TechnicalTrack filter) {
    if (state.contains(filter)) {
      state = state.where((item) => item != filter).toList();
    } else {
      state = [...state, filter];
    }
  }
}

final filterNotifierProvider =
    StateNotifierProvider<FilterNotifier, List<TechnicalTrack>>(
        (_) => FilterNotifier());
