library angular2.src.compiler.directive_metadata;

import "package:angular2/src/facade/lang.dart"
    show
        isPresent,
        isBlank,
        normalizeBool,
        serializeEnum,
        Type,
        isString,
        RegExpWrapper,
        StringWrapper;
import "package:angular2/src/facade/exceptions.dart" show unimplemented;
import "package:angular2/src/facade/collection.dart" show StringMapWrapper;
import "package:angular2/src/core/change_detection/change_detection.dart"
    show ChangeDetectionStrategy, CHANGE_DETECTION_STRATEGY_VALUES;
import "package:angular2/src/core/metadata/view.dart"
    show ViewEncapsulation, VIEW_ENCAPSULATION_VALUES;
import "package:angular2/src/compiler/selector.dart" show CssSelector;
import "util.dart" show splitAtColon;
import "package:angular2/src/core/linker/interfaces.dart"
    show LifecycleHooks, LIFECYCLE_HOOKS_VALUES;
// group 1: "property" from "[property]"

// group 2: "event" from "(event)"
var HOST_REG_EXP = new RegExp(r'^(?:(?:\[([^\]]+)\])|(?:\(([^\)]+)\)))$');

abstract class CompileMetadataWithIdentifier {
  static CompileMetadataWithIdentifier fromJson(Map<String, dynamic> data) {
    return _COMPILE_METADATA_FROM_JSON[data["class"]](data);
  }

  Map<String, dynamic> toJson();
  CompileIdentifierMetadata get identifier {
    return (unimplemented() as CompileIdentifierMetadata);
  }
}

abstract class CompileMetadataWithType extends CompileMetadataWithIdentifier {
  static CompileMetadataWithType fromJson(Map<String, dynamic> data) {
    return _COMPILE_METADATA_FROM_JSON[data["class"]](data);
  }

  Map<String, dynamic> toJson();
  CompileTypeMetadata get type {
    return (unimplemented() as CompileTypeMetadata);
  }

  CompileIdentifierMetadata get identifier {
    return (unimplemented() as CompileIdentifierMetadata);
  }
}

class CompileIdentifierMetadata implements CompileMetadataWithIdentifier {
  dynamic runtime;
  String name;
  String prefix;
  String moduleUrl;
  bool constConstructor;
  CompileIdentifierMetadata(
      {runtime, name, moduleUrl, prefix, constConstructor}) {
    this.runtime = runtime;
    this.name = name;
    this.prefix = prefix;
    this.moduleUrl = moduleUrl;
    this.constConstructor = constConstructor;
  }
  static CompileIdentifierMetadata fromJson(Map<String, dynamic> data) {
    return new CompileIdentifierMetadata(
        name: data["name"],
        prefix: data["prefix"],
        moduleUrl: data["moduleUrl"],
        constConstructor: data["constConstructor"]);
  }

  Map<String, dynamic> toJson() {
    return {
      // Note: Runtime type can't be serialized...
      "class": "Identifier", "name": this.name, "moduleUrl": this.moduleUrl,
      "prefix": this.prefix, "constConstructor": this.constConstructor
    };
  }

  CompileIdentifierMetadata get identifier {
    return this;
  }
}

class CompileDiDependencyMetadata {
  bool isAttribute;
  bool isSelf;
  bool isHost;
  bool isSkipSelf;
  bool isOptional;
  CompileQueryMetadata query;
  CompileQueryMetadata viewQuery;
  dynamic /* CompileIdentifierMetadata | String */ token;
  CompileDiDependencyMetadata(
      {isAttribute,
      isSelf,
      isHost,
      isSkipSelf,
      isOptional,
      query,
      viewQuery,
      token}) {
    this.isAttribute = normalizeBool(isAttribute);
    this.isSelf = normalizeBool(isSelf);
    this.isHost = normalizeBool(isHost);
    this.isSkipSelf = normalizeBool(isSkipSelf);
    this.isOptional = normalizeBool(isOptional);
    this.query = query;
    this.viewQuery = viewQuery;
    this.token = token;
  }
  static CompileDiDependencyMetadata fromJson(Map<String, dynamic> data) {
    return new CompileDiDependencyMetadata(
        token: objFromJson(data["token"], CompileIdentifierMetadata.fromJson),
        query: objFromJson(data["query"], CompileQueryMetadata.fromJson),
        viewQuery:
            objFromJson(data["viewQuery"], CompileQueryMetadata.fromJson),
        isAttribute: data["isAttribute"],
        isSelf: data["isSelf"],
        isHost: data["isHost"],
        isSkipSelf: data["isSkipSelf"],
        isOptional: data["isOptional"]);
  }

  Map<String, dynamic> toJson() {
    return {
      // Note: Runtime type can't be serialized...
      "token": objToJson(this.token),
      "query": objToJson(this.query),
      "viewQuery": objToJson(this.viewQuery),
      "isAttribute": this.isAttribute,
      "isSelf": this.isSelf,
      "isHost": this.isHost,
      "isSkipSelf": this.isSkipSelf,
      "isOptional": this.isOptional
    };
  }
}

class CompileProviderMetadata {
  dynamic /* CompileIdentifierMetadata | String */ token;
  CompileTypeMetadata useClass;
  dynamic useValue;
  dynamic /* CompileIdentifierMetadata | String */ useExisting;
  CompileFactoryMetadata useFactory;
  List<CompileDiDependencyMetadata> deps;
  bool multi;
  CompileProviderMetadata(
      {token, useClass, useValue, useExisting, useFactory, deps, multi}) {
    this.token = token;
    this.useClass = useClass;
    this.useValue = useValue;
    this.useExisting = useExisting;
    this.useFactory = useFactory;
    this.deps = deps;
    this.multi = multi;
  }
  static CompileProviderMetadata fromJson(Map<String, dynamic> data) {
    return new CompileProviderMetadata(
        token: objFromJson(data["token"], CompileIdentifierMetadata.fromJson),
        useClass: objFromJson(data["useClass"], CompileTypeMetadata.fromJson));
  }

  Map<String, dynamic> toJson() {
    return {
      // Note: Runtime type can't be serialized...
      "token": objToJson(this.token), "useClass": objToJson(this.useClass)
    };
  }
}

class CompileFactoryMetadata implements CompileIdentifierMetadata {
  Function runtime;
  String name;
  String prefix;
  String moduleUrl;
  bool constConstructor;
  List<CompileDiDependencyMetadata> diDeps;
  CompileFactoryMetadata({runtime, name, moduleUrl, constConstructor, diDeps}) {
    this.runtime = runtime;
    this.name = name;
    this.moduleUrl = moduleUrl;
    this.diDeps = diDeps;
    this.constConstructor = constConstructor;
  }
  CompileIdentifierMetadata get identifier {
    return this;
  }

  toJson() {
    return null;
  }
}

/**
 * Metadata regarding compilation of a type.
 */
class CompileTypeMetadata
    implements CompileIdentifierMetadata, CompileMetadataWithType {
  Type runtime;
  String name;
  String prefix;
  String moduleUrl;
  bool isHost;
  bool constConstructor;
  List<CompileDiDependencyMetadata> diDeps;
  CompileTypeMetadata(
      {runtime, name, moduleUrl, prefix, isHost, constConstructor, diDeps}) {
    this.runtime = runtime;
    this.name = name;
    this.moduleUrl = moduleUrl;
    this.prefix = prefix;
    this.isHost = normalizeBool(isHost);
    this.constConstructor = constConstructor;
    this.diDeps = diDeps;
  }
  static CompileTypeMetadata fromJson(Map<String, dynamic> data) {
    return new CompileTypeMetadata(
        name: data["name"],
        moduleUrl: data["moduleUrl"],
        prefix: data["prefix"],
        isHost: data["isHost"],
        constConstructor: data["constConstructor"],
        diDeps: arrayFromJson(
            data["diDeps"], CompileDiDependencyMetadata.fromJson));
  }

  CompileIdentifierMetadata get identifier {
    return this;
  }

  CompileTypeMetadata get type {
    return this;
  }

  Map<String, dynamic> toJson() {
    return {
      // Note: Runtime type can't be serialized...
      "class": "Type",
      "name": this.name,
      "moduleUrl": this.moduleUrl,
      "prefix": this.prefix,
      "isHost": this.isHost,
      "constConstructor": this.constConstructor,
      "diDeps": arrayToJson(this.diDeps)
    };
  }
}

class CompileQueryMetadata {
  List<dynamic /* CompileIdentifierMetadata | String */ > selectors;
  bool descendants;
  bool first;
  String propertyName;
  CompileQueryMetadata({selectors, descendants, first, propertyName}) {
    this.selectors = selectors;
    this.descendants = descendants;
    this.first = normalizeBool(first);
    this.propertyName = propertyName;
  }
  static CompileQueryMetadata fromJson(Map<String, dynamic> data) {
    return new CompileQueryMetadata(
        selectors: arrayFromJson(
            data["selectors"], CompileIdentifierMetadata.fromJson),
        descendants: data["descendants"],
        first: data["first"],
        propertyName: data["propertyName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      // Note: Runtime type can't be serialized...
      "selectors": arrayToJson(this.selectors), "descendants": this.descendants,
      "first": this.first, "propertyName": this.propertyName
    };
  }
}

/**
 * Metadata regarding compilation of a template.
 */
class CompileTemplateMetadata {
  ViewEncapsulation encapsulation;
  String template;
  String templateUrl;
  List<String> styles;
  List<String> styleUrls;
  List<String> ngContentSelectors;
  CompileTemplateMetadata(
      {encapsulation,
      template,
      templateUrl,
      styles,
      styleUrls,
      ngContentSelectors}) {
    this.encapsulation =
        isPresent(encapsulation) ? encapsulation : ViewEncapsulation.Emulated;
    this.template = template;
    this.templateUrl = templateUrl;
    this.styles = isPresent(styles) ? styles : [];
    this.styleUrls = isPresent(styleUrls) ? styleUrls : [];
    this.ngContentSelectors =
        isPresent(ngContentSelectors) ? ngContentSelectors : [];
  }
  static CompileTemplateMetadata fromJson(Map<String, dynamic> data) {
    return new CompileTemplateMetadata(
        encapsulation: isPresent(data["encapsulation"])
            ? VIEW_ENCAPSULATION_VALUES[data["encapsulation"]]
            : data["encapsulation"],
        template: data["template"],
        templateUrl: data["templateUrl"],
        styles: data["styles"],
        styleUrls: data["styleUrls"],
        ngContentSelectors: data["ngContentSelectors"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "encapsulation": isPresent(this.encapsulation)
          ? serializeEnum(this.encapsulation)
          : this.encapsulation,
      "template": this.template,
      "templateUrl": this.templateUrl,
      "styles": this.styles,
      "styleUrls": this.styleUrls,
      "ngContentSelectors": this.ngContentSelectors
    };
  }
}

/**
 * Metadata regarding compilation of a directive.
 */
class CompileDirectiveMetadata implements CompileMetadataWithType {
  static CompileDirectiveMetadata create(
      {type,
      isComponent,
      dynamicLoadable,
      selector,
      exportAs,
      changeDetection,
      inputs,
      outputs,
      host,
      lifecycleHooks,
      providers,
      viewProviders,
      queries,
      viewQueries,
      template}) {
    Map<String, String> hostListeners = {};
    Map<String, String> hostProperties = {};
    Map<String, String> hostAttributes = {};
    if (isPresent(host)) {
      StringMapWrapper.forEach(host, (String value, String key) {
        var matches = RegExpWrapper.firstMatch(HOST_REG_EXP, key);
        if (isBlank(matches)) {
          hostAttributes[key] = value;
        } else if (isPresent(matches[1])) {
          hostProperties[matches[1]] = value;
        } else if (isPresent(matches[2])) {
          hostListeners[matches[2]] = value;
        }
      });
    }
    Map<String, String> inputsMap = {};
    if (isPresent(inputs)) {
      inputs.forEach((String bindConfig) {
        // canonical syntax: `dirProp: elProp`

        // if there is no `:`, use dirProp = elProp
        var parts = splitAtColon(bindConfig, [bindConfig, bindConfig]);
        inputsMap[parts[0]] = parts[1];
      });
    }
    Map<String, String> outputsMap = {};
    if (isPresent(outputs)) {
      outputs.forEach((String bindConfig) {
        // canonical syntax: `dirProp: elProp`

        // if there is no `:`, use dirProp = elProp
        var parts = splitAtColon(bindConfig, [bindConfig, bindConfig]);
        outputsMap[parts[0]] = parts[1];
      });
    }
    return new CompileDirectiveMetadata(
        type: type,
        isComponent: normalizeBool(isComponent),
        dynamicLoadable: normalizeBool(dynamicLoadable),
        selector: selector,
        exportAs: exportAs,
        changeDetection: changeDetection,
        inputs: inputsMap,
        outputs: outputsMap,
        hostListeners: hostListeners,
        hostProperties: hostProperties,
        hostAttributes: hostAttributes,
        lifecycleHooks: isPresent(lifecycleHooks) ? lifecycleHooks : [],
        providers: providers,
        viewProviders: viewProviders,
        queries: queries,
        viewQueries: viewQueries,
        template: template);
  }

  CompileTypeMetadata type;
  bool isComponent;
  bool dynamicLoadable;
  String selector;
  String exportAs;
  ChangeDetectionStrategy changeDetection;
  Map<String, String> inputs;
  Map<String, String> outputs;
  Map<String, String> hostListeners;
  Map<String, String> hostProperties;
  Map<String, String> hostAttributes;
  List<LifecycleHooks> lifecycleHooks;
  List<dynamic /* CompileProviderMetadata | CompileTypeMetadata | List < dynamic > */ >
      providers;
  List<dynamic /* CompileProviderMetadata | CompileTypeMetadata | List < dynamic > */ >
      viewProviders;
  List<CompileQueryMetadata> queries;
  List<CompileQueryMetadata> viewQueries;
  CompileTemplateMetadata template;
  CompileDirectiveMetadata(
      {type,
      isComponent,
      dynamicLoadable,
      selector,
      exportAs,
      changeDetection,
      inputs,
      outputs,
      hostListeners,
      hostProperties,
      hostAttributes,
      lifecycleHooks,
      providers,
      viewProviders,
      queries,
      viewQueries,
      template}) {
    this.type = type;
    this.isComponent = isComponent;
    this.dynamicLoadable = dynamicLoadable;
    this.selector = selector;
    this.exportAs = exportAs;
    this.changeDetection = changeDetection;
    this.inputs = inputs;
    this.outputs = outputs;
    this.hostListeners = hostListeners;
    this.hostProperties = hostProperties;
    this.hostAttributes = hostAttributes;
    this.lifecycleHooks = lifecycleHooks;
    this.providers = providers;
    this.viewProviders = viewProviders;
    this.queries = queries;
    this.viewQueries = viewQueries;
    this.template = template;
  }
  CompileIdentifierMetadata get identifier {
    return this.type;
  }

  static CompileDirectiveMetadata fromJson(Map<String, dynamic> data) {
    return new CompileDirectiveMetadata(
        isComponent: data["isComponent"],
        dynamicLoadable: data["dynamicLoadable"],
        selector: data["selector"],
        exportAs: data["exportAs"],
        type: isPresent(data["type"])
            ? CompileTypeMetadata.fromJson(data["type"])
            : data["type"],
        changeDetection: isPresent(data["changeDetection"])
            ? CHANGE_DETECTION_STRATEGY_VALUES[data["changeDetection"]]
            : data["changeDetection"],
        inputs: data["inputs"],
        outputs: data["outputs"],
        hostListeners: data["hostListeners"],
        hostProperties: data["hostProperties"],
        hostAttributes: data["hostAttributes"],
        lifecycleHooks: ((data["lifecycleHooks"] as List<dynamic>))
            .map((hookValue) => LIFECYCLE_HOOKS_VALUES[hookValue])
            .toList(),
        template: isPresent(data["template"])
            ? CompileTemplateMetadata.fromJson(data["template"])
            : data["template"],
        providers:
            arrayFromJson(data["providers"], CompileProviderMetadata.fromJson));
  }

  Map<String, dynamic> toJson() {
    return {
      "class": "Directive",
      "isComponent": this.isComponent,
      "dynamicLoadable": this.dynamicLoadable,
      "selector": this.selector,
      "exportAs": this.exportAs,
      "type": isPresent(this.type) ? this.type.toJson() : this.type,
      "changeDetection": isPresent(this.changeDetection)
          ? serializeEnum(this.changeDetection)
          : this.changeDetection,
      "inputs": this.inputs,
      "outputs": this.outputs,
      "hostListeners": this.hostListeners,
      "hostProperties": this.hostProperties,
      "hostAttributes": this.hostAttributes,
      "lifecycleHooks":
          this.lifecycleHooks.map((hook) => serializeEnum(hook)).toList(),
      "template":
          isPresent(this.template) ? this.template.toJson() : this.template,
      "providers": arrayToJson(this.providers)
    };
  }
}

/**
 * Construct [CompileDirectiveMetadata] from [ComponentTypeMetadata] and a selector.
 */
CompileDirectiveMetadata createHostComponentMeta(
    CompileTypeMetadata componentType, String componentSelector) {
  var template =
      CssSelector.parse(componentSelector)[0].getMatchingElementTemplate();
  return CompileDirectiveMetadata.create(
      type: new CompileTypeMetadata(
          runtime: Object,
          name: '''Host${ componentType . name}''',
          moduleUrl: componentType.moduleUrl,
          isHost: true),
      template: new CompileTemplateMetadata(
          template: template,
          templateUrl: "",
          styles: [],
          styleUrls: [],
          ngContentSelectors: []),
      changeDetection: ChangeDetectionStrategy.Default,
      inputs: [],
      outputs: [],
      host: {},
      lifecycleHooks: [],
      isComponent: true,
      dynamicLoadable: false,
      selector: "*",
      providers: [],
      viewProviders: [],
      queries: [],
      viewQueries: []);
}

class CompilePipeMetadata implements CompileMetadataWithType {
  CompileTypeMetadata type;
  String name;
  bool pure;
  CompilePipeMetadata({type, name, pure}) {
    this.type = type;
    this.name = name;
    this.pure = normalizeBool(pure);
  }
  CompileIdentifierMetadata get identifier {
    return this.type;
  }

  static CompilePipeMetadata fromJson(Map<String, dynamic> data) {
    return new CompilePipeMetadata(
        type: isPresent(data["type"])
            ? CompileTypeMetadata.fromJson(data["type"])
            : data["type"],
        name: data["name"],
        pure: data["pure"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "class": "Pipe",
      "type": isPresent(this.type) ? this.type.toJson() : null,
      "name": this.name,
      "pure": this.pure
    };
  }
}

var _COMPILE_METADATA_FROM_JSON = {
  "Directive": CompileDirectiveMetadata.fromJson,
  "Pipe": CompilePipeMetadata.fromJson,
  "Type": CompileTypeMetadata.fromJson,
  "Identifier": CompileIdentifierMetadata.fromJson
};
dynamic arrayFromJson(
    List<dynamic> obj, dynamic /* (a: {[key: string]: any}) => any */ fn) {
  return isBlank(obj) ? null : obj.map((o) => objFromJson(o, fn)).toList();
}

dynamic /* String | Map < String , dynamic > */ arrayToJson(List<dynamic> obj) {
  return isBlank(obj) ? null : obj.map(objToJson).toList();
}

dynamic objFromJson(
    dynamic obj, dynamic /* (a: {[key: string]: any}) => any */ fn) {
  return (isString(obj) || isBlank(obj)) ? obj : fn(obj);
}

dynamic /* String | Map < String , dynamic > */ objToJson(dynamic obj) {
  return (isString(obj) || isBlank(obj)) ? obj : obj.toJson();
}
