import 'package:ecommerce_shop/core/di/di.dart';
import 'package:ecommerce_shop/core/widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/assets_manager/images_manager.dart';
import '../../../../../../core/resources/colors/colors_manager.dart';
import '../../../bloc/profile_bloc/profile_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(GetUserEvent()),
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state.userRequestState == UserRequestState.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.userRequestState == UserRequestState.error) {
          return Text(state.failures!.message.toString());
        } else if (state.userRequestState == UserRequestState.success) {
          return Container(
            height: size.height,
            padding:
                const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
            decoration: BoxDecoration(color: ColorsManager.cyanColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImagesManager.avatar,
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.userModel!.result!.name!.toUpperCase() ?? ''),
                    Text(state.userModel!.result!.email ?? ''),
                  ],
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      logoutDialog(context);
                    },
                    child: Image.asset(ImagesManager.logout))
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
