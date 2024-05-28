import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_pay/core/di/injector.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_bloc.dart';
import 'package:smart_pay/feautres/auth/presentation/bloc/auth_state.dart';

final authBloc =
    StateNotifierProvider<AuthBloc, AuthState>((ref) => si<AuthBloc>());
