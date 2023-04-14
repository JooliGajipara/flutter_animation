part of 'datalist_bloc.dart';


abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<String> data;

  DataLoaded(this.data);
}
