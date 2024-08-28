import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/core/widgets/items_list_operations.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ItemsListOperations {
  final List<String> categories = ["ALL"];
  int currentTabIndex = 0;

  HomeCubit() : super(HomeStateInitial());

  Future<void> homeInit() async {
    emit(HomeStateLoading());
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

  Future<void> homeToggleFav(Item item) async {
    emit(HomeStateLoading());
    toggleFavourite(item);
    emit(HomeStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isFavourite(Item item) {
    return favourites.contains(item);
  }

  void changeTab(int index) {
    emit(HomeStateLoading());
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: currentTabIndex));
  }

  Future<void> homeToggleCart(Item item) async {
    emit(HomeStateLoading());
    toggleCart(item);
    emit(HomeStateItems(items: items, fav: favourites, cart: cartItems));
  }

  bool isCart(Item item) {
    return cartItems.contains(item);
  }
}
