import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/home_bloc/home_bloc.dart';

class headerHomeWidget extends StatelessWidget {
  const headerHomeWidget({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Olá $username",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple,
          ),
          child: IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(NavBackLogin());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
