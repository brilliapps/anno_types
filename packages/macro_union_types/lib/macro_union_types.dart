import 'package:custom_lint_builder/custom_lint_builder.dart';
import './lint_rules/anno_types.dart';

// Entrypoint of plugin
PluginBase createPlugin() => _MacroUnionTypes();

// The class listing all the [LintRule]s and [Assist]s defined by our plugin
class _MacroUnionTypes extends PluginBase {
  // Lint rules
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [AnnoTypes()];
  }

  // Assists
  //@override
  //List<Assist> getAssists() => [];
}
