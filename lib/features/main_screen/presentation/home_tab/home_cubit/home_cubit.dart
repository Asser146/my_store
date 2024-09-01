import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ItemsListOperations {
  final List<String> categories = ["ALL"];
  int currentTabIndex = 0;
  HomeCubit() : super(HomeStateInitial());

  Future<void> homeInit() async {
    init();
    final List<String> cat = await repo.getCategories();
    categories.addAll(cat);
    emit(HomeStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> reInitialize() async {
    emit(HomeStateLoading());
    init();
    emit(HomeStateItems(items: items, fav: favourites, cart: cartItems));
  }

  void changeTab(int index) {
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: currentTabIndex));
  }

  List<Item> get itemsToShow {
    return currentTabIndex == 0
        ? items
        : items
            .where((item) => item.category == categories[currentTabIndex])
            .toList();
  }

  ItemsListParams get params {
    return ItemsListParams(
      list: itemsToShow,
      toggleFav: toggleFavourite,
      isFav: isFav,
      isCart: isCart,
      toggleCart: toggleCart,
    );
  }
}
