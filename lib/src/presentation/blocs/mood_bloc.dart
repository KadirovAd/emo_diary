import 'package:bloc/bloc.dart';

class MoodBloc extends Bloc<MoodEvent, MoodState> {
  MoodBloc() : super(MoodInitial());

  @override
  Stream<MoodState> mapEventToState(MoodEvent event) async* {
    // Implement state management logic here
  }
}

abstract class MoodEvent {}

abstract class MoodState {}

class MoodInitial extends MoodState {}
