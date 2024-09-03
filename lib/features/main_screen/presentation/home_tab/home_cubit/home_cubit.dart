import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/helpers/item_list_params.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/item_card_list/items_list_operations.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ItemsListOperations {
  final List<String> categories = ["ALL"];
  int currentTabIndex = 0;
  HomeCubit() : super(HomeStateInitial()) {
    homeInit();
  }

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

  Future<void> toggleHomeFavourite(Item item) async {
    emit(HomeStateLoading());
    await toggleFavourite(item);
    emit(HomeStateItems(items: items, fav: favourites, cart: cartItems));
  }

  Future<void> toggleHomeCart(Item item, int direction) async {
    emit(HomeStateLoading());
    await toggleCart(item, direction);
    emit(HomeStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isHomeFavourite(Item item) {
    emit(HomeStateLoading());
    return isFav(item);
  }

  bool isHomeCart(Item item) {
    emit(HomeStateLoading());
    return isCart(item);
  }

  ItemsListParams get params {
    reInitialize();
    return ItemsListParams(
      list: itemsToShow,
      toggleFav: toggleHomeFavourite,
      isFav: isHomeFavourite,
      isCart: isHomeCart,
      toggleCart: toggleHomeCart,
    );
  }
}
