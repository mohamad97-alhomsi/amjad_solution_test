part of 'clinic_cubit.dart';

@immutable
sealed class ClinicState {}

final class ClinicInitial extends ClinicState {}

final class ClinicLoadingState extends ClinicState {}

final class ClinicErrorStateState extends ClinicState {
  final dynamic error;
  ClinicErrorStateState({this.error});
}

final class ClinicSuccessState extends ClinicState {
  final ClinicModel clinicModel;
  ClinicSuccessState({required this.clinicModel});
}
