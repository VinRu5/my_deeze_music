import 'package:my_deeze_music/model/track.dart';

class FavoriteModel {
  final int id;
  final Track track;

  FavoriteModel({
    required this.id,
    required this.track,
  });

  factory FavoriteModel.fromRecord(Map<String, dynamic> data) {
    final track = Track.fromRecord(data);

    return FavoriteModel(
      id: data['id'],
      track: track,
    );
  }
}
