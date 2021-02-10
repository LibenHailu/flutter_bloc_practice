import 'package:flutter_bloc/flutter_bloc.dart';

enum ToggleEvent {toggle}

class  FavoriteBloc extends Bloc<ToggleEvent,bool>{
  FavoriteBloc():super(false);

  @override
  Stream<bool> mapEventToState(ToggleEvent event) async* {
      switch(event){
        case ToggleEvent.toggle:
          yield !state;
          break;
      }
  }
  
}