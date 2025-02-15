part of 'minha_aula_notifier.dart';

sealed class MinhaAulaState {}

final class MinhaAulaInitialState extends MinhaAulaState {}

final class MinhaAulaLoadingState extends MinhaAulaState {}

final class MinhaAulaSuccessState extends MinhaAulaState {
  final AulaFetch aulas;

  MinhaAulaSuccessState(this.aulas);
}

final class MinhaAulaErrorState extends MinhaAulaState {
  final String message;

  MinhaAulaErrorState(this.message);
}
