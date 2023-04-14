part of 'datalist_bloc.dart';

abstract class DataEvent {}

class FetchData extends DataEvent {
  final List<String> data;

  FetchData(this.data);
}
