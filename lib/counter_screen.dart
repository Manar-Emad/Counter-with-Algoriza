import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, CounterState>(
          // listener: (context, state) {
          //   if (state is CounterInitial) {
          //     debugPrint('InitialState');
          //     debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          //   } else if (state is CounterIncrementState) {
          //     debugPrint('CounterIncrementState');
          //     debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          //   } else if (state is CounterDecrementState) {
          //     debugPrint('CounterDecrementState');
          //     debugPrint('${BlocProvider.of<CounterCubit>(context).counter}');
          //   }
          // },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.minimize),
                      onPressed: () {
                        CounterCubit.get(context).decrement();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: BlocBuilder<CounterCubit, CounterState>(
                        builder: (context, state) {
                          return Text(
                            '${CounterCubit.get(context).counter}',
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w900),
                          );
                        },
                      ),
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        CounterCubit.get(context).increment();
                      },
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
