part of 'bloc.dart';

abstract class TransactionEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TransactionCreate extends TransactionEvent {
  final QualifiedModel? qualifiedModel;

  TransactionCreate(this.qualifiedModel);

  @override
  List<Object?> get props => [qualifiedModel];
}

class TransactionQRFetch extends TransactionEvent {
  final String? qRCode;

  TransactionQRFetch({this.qRCode});

  @override
  List<Object?> get props => [qRCode];
}

class TransactionLicensePlateFetch extends TransactionEvent {
  final String licensePlate, imageLicensePlate;

  TransactionLicensePlateFetch(
      {required this.licensePlate, required this.imageLicensePlate});

  @override
  List<Object?> get props => [licensePlate, imageLicensePlate];
}
