import 'package:equatable/equatable.dart';
import '../../data/model/job_trend_model.dart';

abstract class JobTrendState extends Equatable {
  @override
  List<Object> get props => [];
}

class JobTrendInitial extends JobTrendState {}

class JobTrendLoading extends JobTrendState {}

class JobTrendLoaded extends JobTrendState {
  final List<JobTrendModel> jobTrends;

  JobTrendLoaded(this.jobTrends);

  @override
  List<Object> get props => [jobTrends];
}

class JobTrendError extends JobTrendState {
  final String message;

  JobTrendError(this.message);

  @override
  List<Object> get props => [message];
}
