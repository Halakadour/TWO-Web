import 'package:bloc/bloc.dart';
import 'package:two_website/core/network/enums.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_website/features/about-us-why-us/domain/entities/why_us_entity.dart';

part 'aboutwhyus_event.dart';
part 'aboutwhyus_state.dart';

class AboutwhyusBloc extends Bloc<AboutwhyusEvent, AboutwhyusState> {
  AboutwhyusBloc() : super(AboutwhyusState()) {
    on<AboutwhyusEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
