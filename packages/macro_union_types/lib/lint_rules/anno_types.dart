import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'dart:io';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' as errors;
import 'package:analyzer/error/listener.dart';

/// Wanted also call it hammer, as it is to be replaced by the more sophisticated dart-team solution
class AnnoTypes extends DartLintRule {
  AnnoTypes() : super(code: _code);

  static final RegExp regex = RegExp(
    r'normaluniontypeswontbeimplemented\b',
    caseSensitive: false,
  );

  // Lint rule metadata
  static const _code = LintCode(
      name: 'anno_types_error',
      problemMessage:
          'The method is called with a param that is of not allowed type or subtype of type',
      errorSeverity: errors.ErrorSeverity.ERROR);

  // Lint rule metadata
  static const _code3 = LintCode(
      name: 'anno_types_success',
      problemMessage:
          'The method is called with a param that is of valid allowed Type',
      errorSeverity: errors.ErrorSeverity.INFO);

  // `run` is where you analyze a file and report lint errors
  // Invoked on a file automatically
  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addMethodInvocation((inv) {
      List<ElementAnnotation>? metad = inv.argumentList.arguments.first
          .staticParameterElement?.declaration.metadata;

      if (metad != null &&
          metad.isNotEmpty &&
          metad.last.element?.displayName == "\$") {
        if (inv.argumentList.arguments.first.staticType == null) {
          // throw?
        }

        for (int k = 0; k < inv.argumentList.arguments.length; k++) {
          Expression currentInvokationParam = inv.argumentList.arguments[k];
          currentInvokationParam;

          if (currentInvokationParam.staticParameterElement == null) {
            // throw?
          }
          if (inv.argumentList.arguments.first.staticParameterElement!
                  .declaration.library ==
              null) {
            // throw?
          }

          dynamic computedMetaObject = metad.last.computeConstantValue();
          bool theParamCompliesWithTypeOrValueRequirements = false;
          for (int i = 1; i <= 50; i++) {
            dynamic currentField = computedMetaObject.getField('t$i');

            if (currentField.type.toString() != "Type") {
              // aliases are also recognized as "Type"
              // throw?
            } else if (currentInvokationParam
                .staticParameterElement!.declaration.library!.typeSystem
                .isSubtypeOf(currentInvokationParam.staticType!,
                    currentField.toTypeValue())) {
              theParamCompliesWithTypeOrValueRequirements = true;
              break;
            }
          }
          try {
            reporter.atNode(currentInvokationParam /*.parent!*/,
                theParamCompliesWithTypeOrValueRequirements ? _code3 : code);
          } catch (e) {}
        }
      }
    });
  }

  // Possible fixes for the lint error go here
  @override
  List<Fix> getFixes() => [];
}
