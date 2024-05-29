import 'package:bank_pit_bwa/models/sign_in_form_model.dart';
import 'package:bank_pit_bwa/models/sign_up_form_model.dart';
import 'package:bank_pit_bwa/models/user_edit_form_model.dart';
import 'package:bank_pit_bwa/models/user_model.dart';
import 'package:bank_pit_bwa/services/auth_service.dart';
import 'package:bank_pit_bwa/services/user_service.dart';
import 'package:bank_pit_bwa/services/wallet_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email Sudah Terpakai'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());

          final user = await AuthService().register(event.data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final user = await AuthService().login(event.data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updateUSer = (state as AuthSuccess).user.copywith(
                  username: event.data.username,
                  name: event.data.name,
                  email: event.data.email,
                  password: event.data.password,
                );

            emit(AuthLoading());

            await UserService().updateUser(event.data);

            emit(AuthSuccess(updateUSer));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updateUSer = (state as AuthSuccess).user.copywith(
                  pin: event.newPin,
                );

            emit(AuthLoading());

            await WalletService().updatePin(
              event.oldPin,
              event.newPin,
            );

            emit(AuthSuccess(updateUSer));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());

          await AuthService().logout();

          emit(AuthInitial());
        } catch (e) {
          emit((AuthFailed(e.toString())));
        }
      }

      if (event is AuthUpdateBelance) {
        if (state is AuthSuccess) {
          final currenUser = (state as AuthSuccess).user;
          final updateUSer = currenUser.copywith(
            balance: currenUser.balance! + event.amount,
          );

          emit(AuthSuccess(updateUSer));
        }
      }
    });
  }
}
