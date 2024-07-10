part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class SalonLoadingState extends HomeState {}
final class SalonErrorStateState extends HomeState {}
final class SalonSuccessState extends HomeState {}



//? Offers State
final class OfferLoadingState extends HomeState {}
final class OfferErrorState extends HomeState {}
final class OfferSuccessState extends HomeState {
  final OffersModel offersModel;
  OfferSuccessState({required this.offersModel});
}

