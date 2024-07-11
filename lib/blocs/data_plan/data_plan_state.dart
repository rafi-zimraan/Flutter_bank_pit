part of 'data_plan_bloc.dart';

sealed class DataPlanState extends Equatable {
  const DataPlanState();

  @override
  List<Object> get props => [];
}

final class DataPlanInitial extends DataPlanState {}

final class DataPlanLoading extends DataPlanState {}

final class DataPlanFailed extends DataPlanState {
  final String e;
  const DataPlanFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class DataPlanSuccess extends DataPlanState {}
