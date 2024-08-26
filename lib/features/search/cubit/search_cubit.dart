import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/presentation/widgets/item_card_provider.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ItemCardProvider provider = getIt<ItemCardProvider>();

  List<Item> filteredItems = [];

  SearchCubit() : super(SearchInitial());

  void search(List<Item> items, String query) {
    if (query.isEmpty) {
      emit(SearchInitial());
    } else {
      filteredItems = items.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(SearchLoaded(itemsList: filteredItems));
    }
  }
}
