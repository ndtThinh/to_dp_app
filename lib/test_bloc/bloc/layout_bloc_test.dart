import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/bloc.dart';
import 'package:to_dp_app/test_bloc/bloc/event.dart';
import 'package:to_dp_app/test_bloc/bloc/state.dart';
import 'package:to_dp_app/test_bloc/person.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class PersonView extends StatelessWidget {
  /// {@macro counter_view}
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<PersonBloc, PersonState>(
          builder: (context, state) {
            return Text('name: ${state.person?.name} age: ${state.person?.age}',
                style: TextStyle(fontSize: 20, color: Colors.purple));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            // onPressed: () => BlocProvider.of<PersonBloc>(context)
            //     .add(ChangeAgePressed(agePlus: 10)),
            onPressed: () =>
                context.read<PersonBloc>().add(ChangeAgePressed(agePlus: 100)),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<PersonBloc>(),
          ),
        ],
      ),
    );
  }
}
