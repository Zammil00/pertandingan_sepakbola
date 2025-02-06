part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial();
}

class BottomNavigationUpdated extends BottomNavigationState {
  final int tabIndex;
  final Widget currentScreen;

  const BottomNavigationUpdated({
    required this.tabIndex,
    required this.currentScreen,
  });

  @override
  List<Object> get props => [tabIndex, currentScreen];
}
