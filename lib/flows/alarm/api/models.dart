import 'package:equatable/equatable.dart';

class AlarmModel extends Equatable {
  const AlarmModel({
    required this.time,
    required this.schedule,
    required this.music,
  });

  final DateTime time;
  final Schedule schedule;
  final Music music;

  @override
  List<Object?> get props => [
        time,
        schedule,
        music,
      ];
}

class Schedule extends Equatable {
  const Schedule({
    this.sunday = true,
    this.monday = true,
    this.tuesday = true,
    this.wednesday = true,
    this.thursday = true,
    this.friday = true,
    this.saturday = true,
  });

  final bool sunday;
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;

  @override
  List<Object?> get props => [
        sunday,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
      ];
}

class Music extends Equatable {
  const Music({
    required this.provider,
    this.albumArtUrl,
    required this.artist,
    required this.title,
    required this.duration,
  });

  final StreamingService provider;
  final String? albumArtUrl;
  final String artist;
  final String title;
  final TimeDuration duration;
  @override
  List<Object?> get props => [
        provider,
        albumArtUrl,
        artist,
        title,
        duration,
      ];
}

class TimeDuration extends Equatable {
  const TimeDuration({
    required this.start,
    required this.end,
  });

  final double start;
  final double end;

  @override
  List<Object?> get props => [
        start,
        end,
      ];
}

enum StreamingService {
  local,
  // amazon,
  // spotify,
  // apple,
}
