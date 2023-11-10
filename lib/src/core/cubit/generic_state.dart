import 'package:equatable/equatable.dart';

abstract class GenericState extends Equatable{
  const GenericState();

  @override
  List<Object> get props => [];
}

class SuccessState extends GenericState{}

class LoadingState extends GenericState{}

class ErrorState extends GenericState{}

class InitState extends GenericState{}

class ChangeState extends GenericState{}

class LoadingPaginationState extends GenericState{}