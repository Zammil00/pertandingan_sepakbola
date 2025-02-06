part of 'matches_bloc.dart';

sealed class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object> get props => [];
}

class MatchesInitial extends MatchesState {
  const MatchesInitial();
}

class MatchesSeasonIndexUpdated extends MatchesState {
  final int seasonIndex;
  const MatchesSeasonIndexUpdated({
    required this.seasonIndex,
  });

  @override
  List<Object> get props => [seasonIndex];
}


class MatchesLoaded extends MatchesState {
  final List<MatchModel> matches;

  const MatchesLoaded({required this.matches});

  @override
  List<Object> get props => [matches];
}

class MatchesError extends MatchesState {
  final String errorMessage;

  const MatchesError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}