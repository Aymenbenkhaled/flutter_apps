import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/counter/cubit/cubit.dart';
import 'package:flutter_app_1/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),

      child: BlocConsumer< CounterCubit, CounterStates>(
        listener: (context, state) {
          if(state is CounterMinusState) print('minus state ${state.counter}');
          if(state is CounterPlusState) print('plus state ${state.counter}');
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                        'Mins'
                    ),
                  ),
                  Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                        fontSize: 50
                        ,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  TextButton(
                    onPressed:() {
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                        'plus'
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

