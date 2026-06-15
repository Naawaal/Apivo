import 'unresolved_variable.dart';

class VariableResolutionResult {
  const VariableResolutionResult({
    required this.resolvedText,
    required this.unresolvedVariables,
    required this.usedVariables,
  });

  final String resolvedText;
  final List<UnresolvedVariable> unresolvedVariables;
  final List<String> usedVariables;

  bool get hasUnresolvedVariables => unresolvedVariables.isNotEmpty;
}
