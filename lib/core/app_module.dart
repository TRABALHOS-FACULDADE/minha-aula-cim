import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import '../app/domain/usecases/listar_aulas_do_aluno.dart';
import '../app/domain/usecases/pegar_ra_do_aluno.dart';
import '../app/domain/usecases/salvar_ra_do_aluno.dart';
import '../app/external/minha_aula_datasource.dart';
import '../app/infra/minha_aula_repository.dart';
import '../app/presentation/pages/aulas_page.dart';
import '../app/presentation/pages/inserir_ra_page.dart';
import '../app/presentation/pages/settings_page.dart';
import '../app/presentation/pages/splash_page.dart';
import '../app/presentation/view_model/minha_aula_notifier.dart';
import '../app/presentation/view_model/ra_controller.dart';

final class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<MinhaAulaDatasource>(
      () => MinhaAulaDatasource(
        Uno(),
      ),
    );

    i.addLazySingleton<MinhaAulaRepository>(
      MinhaAulaRepository.new,
    );

    i.addLazySingleton<ListarAulasDoAluno>(
      ListarAulasDoAlunoImpl.new,
    );

    i.addLazySingleton<SalvarRADoAluno>(
      SalvarRADoAlunoImpl.new,
    );

    i.addLazySingleton<PegarRADoAluno>(
      PegarRADoAlunoImpl.new,
    );

    i.addLazySingleton<MinhaAulaNotifier>(
      MinhaAulaNotifier.new,
    );

    i.addLazySingleton<RAController>(
      RAController.new,
    );

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SplashPage(),
    );

    r.child(
      '/inserirRA',
      child: (_) => const InserirRaPage(),
    );

    r.child(
      '/aulas',
      child: (_) => const AulasPage(),
    );

    r.child(
      '/settings',
      child: (_) => const SettingsPage(),
    );

    super.routes(r);
  }
}
