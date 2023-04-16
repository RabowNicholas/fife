import 'package:fife/service/models.dart';

abstract class FifeService {
  Future<List<AlarmModel>> fetchAlarms(String userId);
}

class MockFifeService extends FifeService {
  @override
  Future<List<AlarmModel>> fetchAlarms(String userId) async {
    return [
      AlarmModel(
        time: DateTime.now(),
        schedule: const Schedule(),
        music: const Music(
          provider: StreamingService.local,
          artist: 'Russ',
          title: 'Pull the Trigger',
          duration: TimeDuration(start: 0, end: 100),
        ),
      ),
      AlarmModel(
        time: DateTime.now(),
        schedule: const Schedule(),
        music: const Music(
          provider: StreamingService.local,
          artist: 'Russ',
          title: 'Pull the Trigger',
          duration: TimeDuration(start: 0, end: 100),
        ),
      ),
    ];
  }
}

class ProductionFifeService extends FifeService {
  @override
  Future<List<AlarmModel>> fetchAlarms(String userId) async {
    // TODO: implement fetchAlarms
    throw UnimplementedError();
  }
}
