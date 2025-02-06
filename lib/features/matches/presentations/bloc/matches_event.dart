part of 'matches_bloc.dart';

sealed class MatchesEvent extends Equatable {
  const MatchesEvent();

  @override
  List<Object> get props => [];
}

class SeasonIndexChange extends MatchesEvent {
  final int seasonIndex;

  const SeasonIndexChange(this.seasonIndex);
}
