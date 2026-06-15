import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/design/tokens/app_spacing.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../domain/auth_type.dart';
import '../controllers/request_builder_controller.dart';

class AuthEditor extends ConsumerStatefulWidget {
  const AuthEditor({super.key});

  @override
  ConsumerState<AuthEditor> createState() => _AuthEditorState();
}

class _AuthEditorState extends ConsumerState<AuthEditor> {
  late final TextEditingController _bearerController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _apiKeyNameController;
  late final TextEditingController _apiKeyValueController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(requestBuilderControllerProvider);
    _bearerController = TextEditingController(text: state.bearerToken);
    _usernameController = TextEditingController(text: state.basicUsername);
    _passwordController = TextEditingController(text: state.basicPassword);
    _apiKeyNameController = TextEditingController(text: state.apiKeyName);
    _apiKeyValueController = TextEditingController(text: state.apiKeyValue);
  }

  @override
  void dispose() {
    _bearerController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _apiKeyNameController.dispose();
    _apiKeyValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(requestBuilderControllerProvider);
    final notifier = ref.read(requestBuilderControllerProvider.notifier);
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<AuthType>(
            initialValue: state.authType,
            decoration: const InputDecoration(
              labelText: AppStrings.authType,
            ),
            items: AuthType.values
                .map(
                  (type) => DropdownMenuItem(
                    value: type,
                    child: Text(type.label),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) notifier.setAuthType(value);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          switch (state.authType) {
            AuthType.none => Text(
                AppStrings.authNoneMessage,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            AuthType.bearerToken => AppTextField(
                label: AppStrings.bearerToken,
                hint: AppStrings.bearerTokenHint,
                controller: _bearerController,
                onChanged: notifier.setBearerToken,
                obscureText: true,
              ),
            AuthType.basicAuth => Column(
                children: [
                  AppTextField(
                    label: AppStrings.username,
                    hint: AppStrings.usernameHint,
                    controller: _usernameController,
                    onChanged: (value) =>
                        notifier.setBasicAuth(username: value),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: AppStrings.password,
                    hint: AppStrings.passwordHint,
                    controller: _passwordController,
                    onChanged: (value) =>
                        notifier.setBasicAuth(password: value),
                    obscureText: true,
                  ),
                ],
              ),
            AuthType.apiKey => Column(
                children: [
                  AppTextField(
                    label: AppStrings.apiKeyName,
                    hint: AppStrings.apiKeyNameHint,
                    controller: _apiKeyNameController,
                    onChanged: (value) => notifier.setApiKey(name: value),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: AppStrings.apiKeyValue,
                    hint: AppStrings.apiKeyValueHint,
                    controller: _apiKeyValueController,
                    onChanged: (value) => notifier.setApiKey(value: value),
                    obscureText: true,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  DropdownButtonFormField<String>(
                    initialValue: state.apiKeyLocation,
                    decoration: const InputDecoration(
                      labelText: AppStrings.apiKeyAddTo,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'header',
                        child: Text(AppStrings.apiKeyAddToHeader),
                      ),
                      DropdownMenuItem(
                        value: 'query',
                        child: Text(AppStrings.apiKeyAddToQuery),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) notifier.setApiKeyLocation(value);
                    },
                  ),
                ],
              ),
          },
        ],
      ),
    );
  }
}
