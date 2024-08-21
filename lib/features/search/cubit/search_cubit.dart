import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/Home/data/item.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<Item> itemsList;
  List<Item> filteredItems = [];

  SearchCubit(this.itemsList) : super(SearchInitial());

  void search(String query) {
    if (query.isEmpty) {
      filteredItems = itemsList;
      emit(SearchLoaded(itemsList: itemsList));
    } else {
      filteredItems = itemsList.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(SearchLoaded(itemsList: filteredItems));
    }
  }
}
