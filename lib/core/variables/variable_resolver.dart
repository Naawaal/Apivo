import 'unresolved_variable.dart';
import 'variable_resolution_result.dart';

abstract final class VariableResolver {
  static final _pattern = RegExp(r'\{\{\s*([a-zA-Z0-9_.-]+)\s*\}\}');

  static VariableResolutionResult resolve(
    String input,
    Map<String, String> variables,
  ) {
    if (input.isEmpty) {
      return const VariableResolutionResult(
        resolvedText: '',
        unresolvedVariables: [],
        usedVariables: [],
      );
    }

    final unresolved = <UnresolvedVariable>[];
    final used = <String>[];
    final seenUnresolved = <String>{};

    final resolved = input.replaceAllMapped(_pattern, (match) {
      final key = match.group(1)!;
      final token = match.group(0)!;
      final value = variables[key];

      if (value == null) {
        if (seenUnresolved.add(key)) {
          unresolved.add(UnresolvedVariable(key: key, originalToken: token));
        }
        return token;
      }

      if (!used.contains(key)) {
        used.add(key);
      }
      return value;
    });

    return VariableResolutionResult(
      resolvedText: resolved,
      unresolvedVariables: unresolved,
      usedVariables: used,
    );
  }

  static bool containsVariables(String input) => _pattern.hasMatch(input);
}
