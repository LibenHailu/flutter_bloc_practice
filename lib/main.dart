

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocpractice/counter_bloc.dart';
import 'package:flutterblocpractice/favorite_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<FavoriteBloc>(
          create: (BuildContext context) => FavoriteBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocTrying(),
      ),
    );
  }
}

class BlocTrying extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {


    Widget myFavWidget() {
    return  BlocBuilder<FavoriteBloc,bool>(
          builder: (context, state) {
        return state
            ? IconButton(
          icon: Icon(Icons.star),
          onPressed: () => ctx.read<FavoriteBloc>().add(ToggleEvent.toggle),
        )
            : IconButton(
          icon: Icon(Icons.star_outline),
          onPressed: () => ctx.read<FavoriteBloc>().add(ToggleEvent.toggle)
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('lab 4'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            myFavWidget(),
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc,int>(
              builder: (context, state) {
                return Text('${state}',
                    style: Theme.of(context).textTheme.headline4);
              },
            ),

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => ctx.read<CounterBloc>().add(CounterEvent.increment),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => ctx.read<CounterBloc>().add(CounterEvent.decrement),
          ),
        ],
      ),
    );
  }
}

//if (favState) {
//return IconButton(icon: Icon(Icons.star),
//onPressed: () => context.read<Favorite>().handleFavorite(),);
//} else {
//return IconButton(icon: Icon(Icons.star_outline),
//onPressed: () => context.read<Favorite>().handleFavorite(),);
//}
//}
