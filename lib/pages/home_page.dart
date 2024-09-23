import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_irri_app/bloc/data_bloc.dart';
import 'package:smart_irri_app/extensions/build_context.extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isSwitchedOn = false;

  @override
  Widget build(BuildContext context) {
    final indicatorValue = context.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Smart Irrigation",
          style: context.textTheme.titleMedium?.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pump ",
                      style: context.textTheme.titleLarge,
                    ),
                  ],
                ),
                BlocSelector<DataBloc, DataState, double>(
                  selector: (state) {
                    return state.waterLevel;
                  },
                  builder: (context, waterLevel) {
                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "$waterLevel% ",
                            style: context.textTheme.headlineLarge?.copyWith(
                              color: context.colorScheme.secondary,
                            ),
                          ),
                          TextSpan(
                              text: "of the water left in the tank.",
                              style: context.textTheme.titleMedium),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox.square(dimension: 16),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temperature  ",
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox.square(dimension: 16),
                BlocSelector<DataBloc, DataState, double>(
                  selector: (state) => state.temperature,
                  builder: (context, temperature) {
                    return Row(
                      children: [
                        Text(
                          "$temperature \u00B0",
                          style: context.textTheme.headlineLarge,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox.square(dimension: 16),
                BlocSelector<DataBloc, DataState, double>(
                  selector: (state) {
                    return state.soilMoisture;
                  },
                  builder: (context, soilMoisture) {
                    return Stack(
                      children: [
                        Container(
                          width:  indicatorValue,
                          height: 30,
                          decoration: ShapeDecoration(
                            color: Colors.grey.shade300,
                            shape: const StadiumBorder(),
                          ),
                        ),
                        Container(
                          width: (soilMoisture / 100) * indicatorValue,
                          height: 30,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(22),
                            gradient: LinearGradient(
                              stops: const [
                                0.0,
                                0.0,
                              ],
                              colors: [
                                context.colorScheme.error,
                                context.colorScheme.primary,
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
