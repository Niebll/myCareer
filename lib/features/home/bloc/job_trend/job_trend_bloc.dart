import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../data/model/job_trend_model.dart';
import 'job_trend_event.dart';
import 'job_trend_state.dart';

class JobTrendBloc extends Bloc<JobTrendEvent, JobTrendState> {
  JobTrendBloc() : super(JobTrendInitial()) {
    on<LoadJobTrends>(_onLoadJobTrends);
  }

  Future<void> _onLoadJobTrends(
      LoadJobTrends event, Emitter<JobTrendState> emit) async {
    emit(JobTrendLoading());
    try {
      final String response = await rootBundle.loadString('assets/data/job_trend.json');
      final List<dynamic> data = json.decode(response);
      final List<JobTrendModel> jobTrends =
      data.map((json) => JobTrendModel.fromJson(json)).toList();
      print(data);

      emit(JobTrendLoaded(jobTrends));
    } catch (e) {
      emit(JobTrendError("Gagal memuat data: ${e.toString()}"));
    }
  }
}
