import 'dart:math';

import 'package:task_tock/home/domain/tiktok.dart';

class TikTokUrl {
  factory TikTokUrl() => _instance;

  TikTokUrl._();
  static final TikTokUrl _instance = TikTokUrl._();

  TikTok? _lastTikTok;
  final Random _random = Random(DateTime.now().millisecondsSinceEpoch);

  final List<TikTok> _urls = [
    TikTok(
      imageUrl:
          'https://github.com/user-attachments/assets/ac6a7481-7664-4b89-8597-2ce20637b32a',
      videoUrl: 'https://www.tiktok.com/@naenano/video/7277502689041239298',
    ),
    TikTok(
      imageUrl:
          'https://github.com/user-attachments/assets/d6e49365-4942-427b-8f9c-2564fb048a89',
      videoUrl: 'https://www.tiktok.com/@aine_nakano/video/7396973923855830279',
    ),
    TikTok(
      imageUrl:
          'https://github.com/user-attachments/assets/26cec7d7-967a-401f-851b-d1aeda8f1b34',
      videoUrl:
          'https://www.tiktok.com/@siorisandayo2/video/7431113090344799495',
    ),
    TikTok(
      imageUrl:
          'https://github.com/user-attachments/assets/6e5589f3-cd67-4df8-99ac-7ed3baac893f',
      videoUrl: 'https://www.tiktok.com/@rana.0509/video/7392914651903839506',
    ),
    TikTok(
      imageUrl:
          'https://github.com/user-attachments/assets/8085234a-e35a-403b-8072-240210a8c4bb',
      videoUrl: 'https://www.tiktok.com/@0404__xx/video/7229295852890721538',
    ),
  ];

  TikTok random() {
    final tikTok = _urls[_random.nextInt(_urls.length)];
    if (tikTok == _lastTikTok) {
      return random();
    }
    _lastTikTok = tikTok;
    return tikTok;
  }
}
