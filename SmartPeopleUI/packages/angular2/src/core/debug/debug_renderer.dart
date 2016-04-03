library angular2.src.core.debug.debug_renderer;

import "package:angular2/src/facade/lang.dart" show isPresent;
import "package:angular2/src/core/render/api.dart"
    show Renderer, RootRenderer, RenderComponentType, RenderDebugInfo;
import "package:angular2/src/core/debug/debug_node.dart"
    show
        DebugNode,
        DebugElement,
        EventListener,
        getDebugNode,
        indexDebugNode,
        removeDebugNodeFromIndex;

class DebugDomRootRenderer implements RootRenderer {
  RootRenderer _delegate;
  DebugDomRootRenderer(this._delegate) {}
  Renderer renderComponent(RenderComponentType componentProto) {
    return new DebugDomRenderer(
        this, this._delegate.renderComponent(componentProto));
  }
}

class DebugDomRenderer implements Renderer {
  DebugDomRootRenderer _rootRenderer;
  Renderer _delegate;
  DebugDomRenderer(this._rootRenderer, this._delegate) {}
  Renderer renderComponent(RenderComponentType componentType) {
    return this._rootRenderer.renderComponent(componentType);
  }

  dynamic selectRootElement(String selector) {
    var nativeEl = this._delegate.selectRootElement(selector);
    var debugEl = new DebugElement(nativeEl, null);
    indexDebugNode(debugEl);
    return nativeEl;
  }

  dynamic createElement(dynamic parentElement, String name) {
    var nativeEl = this._delegate.createElement(parentElement, name);
    var debugEl = new DebugElement(nativeEl, getDebugNode(parentElement));
    debugEl.name = name;
    indexDebugNode(debugEl);
    return nativeEl;
  }

  dynamic createViewRoot(dynamic hostElement) {
    return this._delegate.createViewRoot(hostElement);
  }

  dynamic createTemplateAnchor(dynamic parentElement) {
    var comment = this._delegate.createTemplateAnchor(parentElement);
    var debugEl = new DebugNode(comment, getDebugNode(parentElement));
    indexDebugNode(debugEl);
    return comment;
  }

  dynamic createText(dynamic parentElement, String value) {
    var text = this._delegate.createText(parentElement, value);
    var debugEl = new DebugNode(text, getDebugNode(parentElement));
    indexDebugNode(debugEl);
    return text;
  }

  projectNodes(dynamic parentElement, List<dynamic> nodes) {
    var debugParent = getDebugNode(parentElement);
    if (isPresent(debugParent) && debugParent is DebugElement) {
      nodes.forEach((node) {
        debugParent.addChild(getDebugNode(node));
      });
    }
    return this._delegate.projectNodes(parentElement, nodes);
  }

  attachViewAfter(dynamic node, List<dynamic> viewRootNodes) {
    var debugNode = getDebugNode(node);
    if (isPresent(debugNode)) {
      var debugParent = debugNode.parent;
      if (viewRootNodes.length > 0 && isPresent(debugParent)) {
        List<DebugNode> debugViewRootNodes = [];
        viewRootNodes.forEach(
            (rootNode) => debugViewRootNodes.add(getDebugNode(rootNode)));
        debugParent.insertChildrenAfter(debugNode, debugViewRootNodes);
      }
    }
    return this._delegate.attachViewAfter(node, viewRootNodes);
  }

  detachView(List<dynamic> viewRootNodes) {
    viewRootNodes.forEach((node) {
      var debugNode = getDebugNode(node);
      if (isPresent(debugNode) && isPresent(debugNode.parent)) {
        debugNode.parent.removeChild(debugNode);
      }
    });
    return this._delegate.detachView(viewRootNodes);
  }

  destroyView(dynamic hostElement, List<dynamic> viewAllNodes) {
    viewAllNodes.forEach((node) {
      removeDebugNodeFromIndex(getDebugNode(node));
    });
    return this._delegate.destroyView(hostElement, viewAllNodes);
  }

  listen(dynamic renderElement, String name, Function callback) {
    var debugEl = getDebugNode(renderElement);
    if (isPresent(debugEl)) {
      debugEl.listeners.add(new EventListener(name, callback));
    }
    return this._delegate.listen(renderElement, name, callback);
  }

  Function listenGlobal(String target, String name, Function callback) {
    return this._delegate.listenGlobal(target, name, callback);
  }

  setElementProperty(
      dynamic renderElement, String propertyName, dynamic propertyValue) {
    var debugEl = getDebugNode(renderElement);
    if (isPresent(debugEl) && debugEl is DebugElement) {
      debugEl.properties[propertyName] = propertyValue;
    }
    return this
        ._delegate
        .setElementProperty(renderElement, propertyName, propertyValue);
  }

  setElementAttribute(
      dynamic renderElement, String attributeName, String attributeValue) {
    var debugEl = getDebugNode(renderElement);
    if (isPresent(debugEl) && debugEl is DebugElement) {
      debugEl.attributes[attributeName] = attributeValue;
    }
    return this
        ._delegate
        .setElementAttribute(renderElement, attributeName, attributeValue);
  }

  /**
   * Used only in debug mode to serialize property changes to comment nodes,
   * such as <template> placeholders.
   */
  setBindingDebugInfo(
      dynamic renderElement, String propertyName, String propertyValue) {
    return this
        ._delegate
        .setBindingDebugInfo(renderElement, propertyName, propertyValue);
  }

  /**
   * Used only in development mode to set information needed by the DebugNode for this element.
   */
  setElementDebugInfo(dynamic renderElement, RenderDebugInfo info) {
    var debugEl = getDebugNode(renderElement);
    debugEl.setDebugInfo(info);
    return this._delegate.setElementDebugInfo(renderElement, info);
  }

  setElementClass(dynamic renderElement, String className, bool isAdd) {
    return this._delegate.setElementClass(renderElement, className, isAdd);
  }

  setElementStyle(dynamic renderElement, String styleName, String styleValue) {
    return this._delegate.setElementStyle(renderElement, styleName, styleValue);
  }

  invokeElementMethod(
      dynamic renderElement, String methodName, List<dynamic> args) {
    return this._delegate.invokeElementMethod(renderElement, methodName, args);
  }

  setText(dynamic renderNode, String text) {
    return this._delegate.setText(renderNode, text);
  }
}
