part of 'nav_cubit.dart';

enum NavStatus {
  loading,
  success,
}

class NavState extends Equatable {
  final int? index;
  final NavStatus? status;
  const NavState({this.index = 0, this.status = NavStatus.loading});

  NavState copyWith({int? index, NavStatus? status}) =>
      NavState(index: index ?? this.index, status: status ?? this.status);

  @override
  List<Object?> get props => [index, status];
}
