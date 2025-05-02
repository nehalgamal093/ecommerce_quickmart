import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/features/profile/domain/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/logic/failures/failures.dart';
import '../../data/models/address_request.dart';
import '../../data/models/addresses_model.dart';

@injectable
class AddAddressUseCase {
  ProfileRepo profileRepo;
  AddAddressUseCase(this.profileRepo);

  Future<Either<AppFailures, AddressesModel>> call({AddressRequest? request}) {
    return profileRepo.addAddress(request: request);
  }
}
