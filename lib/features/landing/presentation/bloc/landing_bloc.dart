// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:two_website/core/network/enums.dart';
import 'package:two_website/core/param/project_param.dart';
import 'package:two_website/core/services/shared_preferences_services.dart';
import 'package:two_website/features/landing/domain/entities/about_us_entity.dart';
import 'package:two_website/features/landing/domain/entities/post_entity.dart';
import 'package:two_website/features/landing/domain/entities/service_entity.dart';
import 'package:two_website/features/landing/domain/entities/why_us_entity.dart';
import 'package:two_website/features/landing/domain/usecases/create_contact_us_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/create_project_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/reply_to_post_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_about_us_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_active_posts_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_service_usecase.dart';
import 'package:two_website/features/landing/domain/usecases/show_why_us_usecase.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final ShowAboutUsUsecase showAboutUsUsecase;
  final ShowWhyUsUsecase showWhyUsUsecase;
  final CreateContactUsUsecase createContactUsUsecase;
  final ReplyToPostUsecase replyToPostUsecase;
  final ShowActivePostsUsecase showActivePostsUsecase;
  final ShowServiceUsecase showServiceUsecase;
  final CreateProjectUsecase createProjectUsecase;

  LandingBloc(
      {required this.showAboutUsUsecase,
      required this.showWhyUsUsecase,
      required this.createContactUsUsecase,
      required this.showActivePostsUsecase,
      required this.replyToPostUsecase,
      required this.showServiceUsecase,
      required this.createProjectUsecase})
      : super(LandingState()) {
    // HOME //
    on<CreateProjectEvent>((event, emit) async {
      emit(state.copyWith(createProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createProjectUsecase.call(CreateProjectParam(
            token: token,
            type: event.type,
            description: event.description,
            requirements: event.requirements,
            document: event.document,
            cooperationType: event.cooperationType,
            contactTime: event.contactTime));
        result.fold(
          (l) => emit(state.copyWith(
              createProjectStatus: CasualStatus.failure, message: l.message)),
          (r) => emit(state.copyWith(
            createProjectStatus: CasualStatus.success,
          )),
        );
      } else {
        emit(state.copyWith(
            createProjectStatus: CasualStatus.notAuthorized,
            message: "No Token"));
      }
    });
    // About Us //
    on<ShowAboutUsEvent>((event, emit) async {
      emit(state.copyWith(showAboutUsStatus: CasualStatus.loading));
      final result = await showAboutUsUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            showAboutUsStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            showAboutUsStatus: CasualStatus.success, showAboutUsEntity: r)),
      );
    });
    // Why Us //
    on<ShowWhyUsEvent>((event, emit) async {
      emit(state.copyWith(showWhyUsStatus: CasualStatus.loading));
      final result = await showWhyUsUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            showWhyUsStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            showWhyUsStatus: CasualStatus.success, showWhyUsList: r)),
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
            createContcatStatus: CasualStatus.notAuthorized,
            message: "No Token"));
      }
    });
    // GET ACTIVE POSTS //
    on<GetActivePostsEvent>((event, emit) async {
      emit(state.copyWith(activePostsListStatus: CasualStatus.loading));
      final result = await showActivePostsUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            activePostsListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            activePostsListStatus: CasualStatus.success, activePostsList: r)),
      );
    });
    // REPLY TO POST //
    on<ReplyToPostEvent>((event, emit) async {
      emit(state.copyWith(sendReplyStatus: CasualStatus.loading));
      final result = await replyToPostUsecase.call(ReplyParam(
          fullName: event.fullName,
          email: event.email,
          phone: event.phone,
          cv: event.cv,
          postId: event.postId));
      result.fold(
        (l) => emit(state.copyWith(
            sendReplyStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
          sendReplyStatus: CasualStatus.success,
        )),
      );
    });
    // SHOW SERVICE  //
    on<ShowServicesEvent>((event, emit) async {
      emit(state.copyWith(serviceListStatus: CasualStatus.loading));
      final result = await showServiceUsecase.call();
      result.fold(
        (l) => emit(state.copyWith(
            serviceListStatus: CasualStatus.failure, message: l.message)),
        (r) => emit(state.copyWith(
            serviceListStatus: CasualStatus.success, serviceList: r)),
      );
    });
  }
}
