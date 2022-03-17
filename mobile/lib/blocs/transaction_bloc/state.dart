part of 'bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionCheckInSuccess extends TransactionState {
  final TransactionModel transactionModel;

  const TransactionCheckInSuccess({required this.transactionModel});

  @override
  List<Object> get props => [transactionModel];
}

class TransactionCreateFail extends TransactionState {}

class TransactionInit extends TransactionState {}

class TransactionQRFetched extends TransactionState {
  final String? qRCode, vehicleColor, vehicleManufacturer, transactionType;

  const TransactionQRFetched(
      {this.qRCode,
      this.vehicleColor,
      this.vehicleManufacturer,
      this.transactionType});

  @override
  List<Object?> get props =>
      [qRCode, vehicleColor, vehicleManufacturer, transactionType];
}

class TransactionLicensePlateFetched extends TransactionState {
  final String licensePlate, imageLicensePlate;

  const TransactionLicensePlateFetched(
      {required this.licensePlate, required this.imageLicensePlate});

  @override
  List<Object?> get props => [licensePlate, imageLicensePlate];
}
