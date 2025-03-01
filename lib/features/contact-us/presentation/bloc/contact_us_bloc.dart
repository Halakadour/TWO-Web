// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/contact-us/data/models/contact_us_model.dart';
import 'package:two_website/features/contact-us/domain/usecases/create_contact_us_usecase.dart';
import 'package:two_website/features/contact-us/domain/usecases/mark_contact_us_as_approved_uscase.dart';
import 'package:two_website/features/contact-us/domain/usecases/mark_contact_us_as_seen_usecase.dart';
import 'package:two_website/features/contact-us/domain/usecases/show_contact_us_with_seen_and_approved_usecase.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final ShowContactUsWithSeenAndApprovedUsecase
      showContactUsWithSeenAndApprovedUsecase;
  final CreateContactUsUsecase createContactUsUsecase;
  final MarkContactUsAsSeenUsecase markContactUsAsSeenUsecase;
  final MarkContactUsAsApprovedUscase markContactUsAsApprovedUscase;
  ContactUsBloc(
    this.showContactUsWithSeenAndApprovedUsecase,
    this.createContactUsUsecase,
    this.markContactUsAsSeenUsecase,
    this.markContactUsAsApprovedUscase,
  ) : super(ContactUsState()) {
    on<GetContactUsWithSeenAndApprovedEvent>((event, emit) async {
      emit(state.copyWith(contactUsListStatus: CasualStatus.loading));
      final result = await showContactUsWithSeenAndApprovedUsecase.call(
          ShowContactUsParam(
              seenFilter: event.seenFilter,
              approveFilter: event.approvedFilter));
      result.fold(
        (l) => emit(state.copyWith(
            contactUsListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            contactUsListStatus: CasualStatus.success, contactUsList: r)),
      );
    });
    on<CreateContactUsEvent>((event, emit) async {
      emit(state.copyWith(createContcatStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createContactUsUsecase.call(CreateContactUsParam(
            token: token,
            subject: event.subject,
            description: event.description,
            phone: event.phone));
        result.fold(
          (l) => emit(state.copyWith(
              createContcatStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
            createContcatStatus: CasualStatus.success,
          )),
        );
      } else {
        emit(state.copyWith(
            createContcatStatus: CasualStatus.noToken, message: "No Token"));
      }
    });
    on<MarkContactUsAsSeenEvent>((event, emit) async {
      emit(state.copyWith(seenMarkerStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await markContactUsAsSeenUsecase.call(
            MarkContactUsParam(token: token, contactUsId: event.contactUsId));
        result.fold(
          (l) => emit(state.copyWith(
              seenMarkerStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
            seenMarkerStatus: CasualStatus.success,
          )),
        );
      } else {
        emit(state.copyWith(
            seenMarkerStatus: CasualStatus.noToken, message: "No Token"));
      }
    });
    on<MarkContactUsAsApprovedEvent>((event, emit) async {
      emit(state.copyWith(approvedMarkerStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await markContactUsAsApprovedUscase.call(
            MarkContactUsParam(token: token, contactUsId: event.contactUsId));
        result.fold(
          (l) => emit(state.copyWith(
              approvedMarkerStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
            approvedMarkerStatus: CasualStatus.success,
          )),
        );
      } else {
        emit(state.copyWith(
            approvedMarkerStatus: CasualStatus.noToken, message: "No Token"));
      }
    });
  }
}
