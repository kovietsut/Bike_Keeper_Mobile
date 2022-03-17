import 'package:mobile/models/qualified_model.dart';
import 'package:mobile/models/transaction_model.dart';
import 'package:mobile/services/transaction_service/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

part 'event.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc({TransactionState? initialState}) : super(TransactionInit());

  @override
  Stream<TransactionState> mapEventToState(TransactionEvent event) async* {
    if (event is TransactionCreate) {
      yield await _mapTransactionCreateToState(event);
    } else if (event is TransactionQRFetch) {
      yield await _mapTransactionQRFetchToState(event);
    } else if (event is TransactionLicensePlateFetch) {
      yield await _mapTransactionLicensePlateFetchToState(event);
    }
  }

  Future<TransactionState> _mapTransactionCreateToState(
      TransactionCreate event) async {
    TransactionModel? result =
        await TransactionService().create(event.qualifiedModel);

    return result == null
        ? TransactionCreateFail()
        : TransactionCheckInSuccess(transactionModel: result);
  }

  Future<TransactionState> _mapTransactionQRFetchToState(
      TransactionQRFetch event) async {
    String? transactionType =
        await TransactionService().getTransactionType(event.qRCode);
    return TransactionQRFetched(
        qRCode: event.qRCode,
        vehicleColor: "Pink",
        vehicleManufacturer: "Suzuki",
        transactionType: transactionType);
  }

  Future<TransactionState> _mapTransactionLicensePlateFetchToState(
      TransactionLicensePlateFetch event) async {
    return TransactionLicensePlateFetched(
        licensePlate: event.licensePlate,
        imageLicensePlate: event.imageLicensePlate);
  }
}
