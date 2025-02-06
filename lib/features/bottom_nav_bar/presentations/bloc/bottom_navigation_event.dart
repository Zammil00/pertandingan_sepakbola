part of 'bottom_navigation_bloc.dart';

sealed class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends BottomNavigationEvent {
  final int tabIndex;
  const ChangeTabEvent(this.tabIndex);
}
