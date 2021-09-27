import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:matcher/matcher.dart';

/// Assert that `actual` matches `matcher`.
///
/// Functionally identical to the `flutter_test` variant, but the [matcher] is
/// enforced to be an actual [Matcher], instead of any [dynamic] object for
/// consistency.
///
/// See [expect] for details. This is a variant of that function
/// that additionally verifies that there are no asynchronous APIs
/// that have not yet resolved.
void expect(
  dynamic actual,
  flutter_test.Matcher matcher, {
  String? reason,
  dynamic skip, // true or a String
}) {
  flutter_test.expect(
    actual,
    matcher,
    reason: reason,
    skip: skip,
  );
}

/// Assert that `actual` matches `matcher`.
///
/// Functionally identical to the `flutter_test` variant, but the [matcher] is
/// enforced to be an actual [Matcher], instead of any [dynamic] object for
/// consistency.
///
/// See [expect] for details. This variant will _not_ check that
/// there are no outstanding asynchronous API requests. As such, it can be
/// called from, e.g., callbacks that are run during build or layout, or in the
/// completion handlers of futures that execute in response to user input.
void expectSync(
  dynamic actual,
  flutter_test.Matcher matcher, {
  String? reason,
}) {
  flutter_test.expect(actual, matcher, reason: reason);
}

/// Just like [expect], but returns a [Future] that completes when the matcher
/// has finished matching.
///
/// Functionally identical to the `flutter_test` variant, but the [matcher] is
/// enforced to be an actual [Matcher], instead of any [dynamic] object for
/// consistency.
///
/// See [expectLater] for details.
Future<void> expectLater(
  dynamic actual,
  flutter_test.Matcher matcher, {
  String? reason,
  dynamic skip, // true or a String
}) {
  return flutter_test.expectLater(actual, matcher, reason: reason, skip: skip);
}
