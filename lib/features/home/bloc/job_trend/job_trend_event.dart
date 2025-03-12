import 'package:equatable/equatable.dart';

abstract class JobTrendEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadJobTrends extends JobTrendEvent {}
