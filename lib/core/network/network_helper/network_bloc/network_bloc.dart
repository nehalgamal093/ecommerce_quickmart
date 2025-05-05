import 'package:bloc/bloc.dart';
import 'package:ecommerce_shop/core/network/network_helper/network_helper.dart';
import 'package:injectable/injectable.dart';

part 'network_event.dart';
part 'network_state.dart';

@injectable
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkEvent>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }
  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
