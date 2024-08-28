import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main%20screen/data/item.dart';
import 'package:my_store/features/main%20screen/domain/hive_services.dart';
import 'package:my_store/features/main%20screen/domain/item_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ItemRepository repo = getIt<ItemRepository>();
  final HiveServices _hiveServices = getIt<HiveServices>();
  List<List<Item>> lists = [];
  List<Item> searchItem = [], searchFavourites = [], searchCartItems = [];
  List<Item> filteredItems = [];

  SearchCubit() : super(SearchInitial()) {
    init();
  }
  Future<void> init() async {
    emit(SearchLoading());
    lists = await repo.getLists();
    searchItem = lists[0];
    searchFavourites = lists[1];
    searchCartItems = lists[2];
    emit(SearchLoaded(
        items: searchItem, fav: searchFavourites, cart: searchCartItems));
  }

  void search(List<Item> items, String query) {
    if (query.isEmpty) {
      emit(SearchInitial());
    } else {
      filteredItems = items.where((item) {
        return item.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
      emit(SearchLoaded(
          items: filteredItems, fav: searchFavourites, cart: searchCartItems));
    }
  }

  Future<void> toggleFavorite(Item item) async {
    emit(SearchLoading());
    if (searchFavourites.contains(item)) {
      searchFavourites.remove(item);
    } else {
      searchFavourites.add(item);
    }
    await repo.toggleFav(item);
    emit(SearchLoaded(
        items: searchItem, fav: searchFavourites, cart: searchCartItems));
  }

  bool isFavourite(Item item) {
    return searchFavourites.contains(item);
  }
}
