import 'package:quote_app/models/quote_theme.dart';

// TODO: save on firestore
///
/// Handwriting:
/// 1 - Dancing Script
/// 2 - Pacifico
/// 3 - Caveat
/// 4 - Amatic SC
/// 5 - Permanent Marker
///
/// Display:
/// 1 - Bebas Neue
/// 2 - Lobster
/// 3 - Rampart One
/// 4 - Fredoka One
/// 5 - Rubik Moonrocks
///
// TODO: test
final List<QuoteTheme> themes2 = [
  const QuoteTheme(
    image: 'image_01.png',
    font: 'Dancing Script',
    size: 28,
    color: '#194da6',
  ),
  const QuoteTheme(
    image: 'image_02.jpg',
    font: 'Pacifico',
    size: 28,
    color: '#ffffff',
  ),
  const QuoteTheme(
    image: 'image_03.jpg',
    font: 'Caveat',
    size: 28,
    color: '#ffffff',
  ),
  const QuoteTheme(
    image: 'image_04.jpg',
    font: 'Amatic SC',
    size: 28,
    color: '#ffffff',
  ),
  const QuoteTheme(
    image: 'image_04.jpg',
    font: 'Permanent Marker',
    size: 28,
    color: '#ffffff',
  ),
  //
  const QuoteTheme(
    image: 'image_01.png',
    font: 'Bebas Neue',
    size: 28,
    color: '#c22121',
  ),
  const QuoteTheme(
    image: 'image_02.jpg',
    font: 'Lobster',
    size: 28,
    color: '#ffffff',
  ),
  const QuoteTheme(
    image: 'image_03.jpg',
    font: 'Rampart One',
    size: 28,
    color: '#ffffff',
  ),
  const QuoteTheme(
    image: 'image_04.jpg',
    font: 'Fredoka One',
    size: 28,
    color: '#ffffff',
  ),
  const QuoteTheme(
    image: 'image_03.jpg',
    font: 'Rubik Moonrocks',
    size: 28,
    color: '#ffffff',
  ),
];

abstract class ThemesRepository {
  // Future<void> updateThemes();

  Future<List<QuoteTheme>> fetchThemes();
}
