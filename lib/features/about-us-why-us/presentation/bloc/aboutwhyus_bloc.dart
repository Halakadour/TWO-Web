import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'aboutwhyus_event.dart';
part 'aboutwhyus_state.dart';

class AboutwhyusBloc extends Bloc<AboutwhyusEvent, AboutwhyusState> {
  AboutwhyusBloc() : super(AboutwhyusInitial()) {
    on<AboutwhyusEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
