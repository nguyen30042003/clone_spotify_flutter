import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/getUser.dart';
import 'package:spotify/presentation/bloc/profile_info_state.dart';

import '../../service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState>{
  ProfileInfoCubit() : super (ProfileInfoLoading());

  Future<void> getProfile() async {
    var returnedUsers = await sl<GetuserUseCases>().call();
    returnedUsers.fold(
        (l) {
          emit(ProfileInfoFailure());
        },
        (userEntity){
          emit(
              ProfileInfoLoaded(userEntity: userEntity)
          );
        }
    );
  }

}