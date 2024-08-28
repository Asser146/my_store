import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/di/dependency_injection.dart';
import 'package:my_store/features/main_screen/data/item.dart';
import 'package:my_store/features/main_screen/domain/item_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final List<String> categories = ["ALL"];
  final ItemRepository repo = getIt<ItemRepository>();
  List<List<Item>> lists = [];
  List<Item> homeitems = [], homefavourites = [], homecartItems = [];

  HomeCubit() : super(HomeStateInitial());
  Future<void> init() async {
    emit(HomeStateLoading());
    lists = await repo.getLists();
    homeitems = lists[0];
    homefavourites = lists[1];
    homecartItems = lists[2];
    final List<String> cat = await repo.getCategories();
    categories.addAll(cat);
    emit(HomeStateItems(
        items: homeitems, fav: homefavourites, cart: homecartItems));
  }

  Future<void> toggleFavorite(Item item) async {
    emit(HomeStateLoading());
    if (homefavourites.contains(item)) {
      homefavourites.remove(item);
    } else {
      homefavourites.add(item);
    }
    await repo.toggleFav(item);
    emit(HomeStateItems(
        items: homeitems, fav: homefavourites, cart: homecartItems));
  }

  bool isFavourite(Item item) {
    return homefavourites.contains(item);
  }

  int currentTabIndex = 0;
  void changeTab(int index) {
    emit(HomeStateLoading());
    currentTabIndex = index;
    emit(HomeStateTabChanged(index: currentTabIndex));
  }

  Future<void> toggleCart(Item item) async {
    emit(HomeStateLoading());
    if (homecartItems.contains(item)) {
      homecartItems.remove(item);
    } else {
      homecartItems.add(item);
    }
    await repo.toggleCart(item);
    emit(HomeStateItems(
        items: homeitems, fav: homefavourites, cart: homecartItems));
  }

  bool isCart(Item item) {
    return homecartItems.contains(item);
  }
}
