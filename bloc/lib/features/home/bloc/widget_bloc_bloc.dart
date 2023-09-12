import 'dart:async';

import 'package:bloc/bloc.dart';

class WidgetBlocBloc extends Bloc<WidgetBlocEvent, WidgetBlocState> {
  WidgetBlocBloc() : super(WidgetBlocInitial()) {
    on<WidgetBlocEvent>((event, emit) {
      on<HomeInitialEvent>(homeInitialEvent);
      on<AddstudentsEvent>(adastudentsEvent);
      on<EditEvent>(editEvent);
      on<DeleteEvent>(deleteEvent);
      on<AddStudentNavigateButton>(addStudentNavigateButton);
    });
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<WidgetBlocState> emit) {}

  FutureOr<void> adastudentsEvent(
      AddstudentsEvent event, Emitter<WidgetBlocState> emit) {}

  FutureOr<void> editEvent(EditEvent event, Emitter<WidgetBlocState> emit) {}

  FutureOr<void> deleteEvent(
      DeleteEvent event, Emitter<WidgetBlocState> emit) {}

  FutureOr<void> addStudentNavigateButton(
      AddStudentNavigateButton event, Emitter<WidgetBlocState> emit) {}
}
