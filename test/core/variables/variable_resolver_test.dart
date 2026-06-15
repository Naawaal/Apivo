import 'package:flutter_test/flutter_test.dart';

import 'package:apivo/core/variables/variable_resolver.dart';

void main() {
  group('VariableResolver', () {
    test('resolves variables with trimmed braces', () {
      const variables = {
        'base_url': 'https://api.example.com',
        'user_id': '12',
      };

      final result = VariableResolver.resolve(
        '{{ base_url }}/users/{{ user_id }}',
        variables,
      );

      expect(result.resolvedText, 'https://api.example.com/users/12');
      expect(result.hasUnresolvedVariables, isFalse);
      expect(result.usedVariables, ['base_url', 'user_id']);
    });

    test('returns unresolved variables when value is missing', () {
      final result = VariableResolver.resolve(
        'Bearer {{token}}',
        const {},
      );

      expect(result.resolvedText, 'Bearer {{token}}');
      expect(result.hasUnresolvedVariables, isTrue);
      expect(result.unresolvedVariables.single.key, 'token');
      expect(result.unresolvedVariables.single.originalToken, '{{token}}');
    });

    test('leaves malformed tokens unchanged', () {
      final result = VariableResolver.resolve(
        '{{broken',
        const {'broken': 'value'},
      );

      expect(result.resolvedText, '{{broken');
      expect(result.unresolvedVariables, isEmpty);
    });

    test('supports safe key characters', () {
      final result = VariableResolver.resolve(
        '{{api-key}}.{{user.id}}',
        const {'api-key': 'abc', 'user.id': '42'},
      );

      expect(result.resolvedText, 'abc.42');
    });
  });
}
