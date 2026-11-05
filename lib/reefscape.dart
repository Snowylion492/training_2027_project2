import 'itsAllComingTogether.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class Reefscape extends ConsumerStatefulWidget {
  final String eventKey;

  const Reefscape({super.key, required this.eventKey});
  @override
  ConsumerState<Reefscape> createState() => ReefscapeStateful();
}
