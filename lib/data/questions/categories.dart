import '../../model/questions/category.dart';
import 'answers/bulldog.dart';
import 'answers/cocker_spaniel.dart';
import 'answers/dachshund_miniature.dart';
import 'answers/french_bulldog.dart';
import 'answers/german_shepherd.dart';
import 'answers/labrador_retriever.dart';
import 'answers/pug.dart';
import 'answers/springer_spaniel.dart';
import 'answers/staffordshire_bull_terrier.dart';

/// Categories for answers.
abstract class Categories {
  /// All dogs.
  static Category allDogs = Category(
    name: 'All Dogs',
    answers: {
      bulldog,
      cockerSpaniel,
      dachshundMiniature,
      frenchBulldog,
      germanShepherd,
      labradorRetriever,
      pug,
      springerSpaniel,
      staffordshireBullTerrier,
    },
  );

  /// Most common 10 dogs.
  static Category mostCommonTen = Category(
    name: 'Most Common 10 Dogs',
    answers: {
      bulldog,
      cockerSpaniel,
      dachshundMiniature,
      frenchBulldog,
      germanShepherd,
      labradorRetriever,
      pug,
      springerSpaniel,
      staffordshireBullTerrier,
    },
  );
}
