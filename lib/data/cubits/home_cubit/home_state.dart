part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}





//? Offers State
final class OfferLoadingState extends HomeState {}
final class OfferErrorState extends HomeState {
  final dynamic error;
  OfferErrorState({this.error});
}
final class OfferSuccessState extends HomeState {
  final OffersModel offersModel;
  OfferSuccessState({required this.offersModel});
}

