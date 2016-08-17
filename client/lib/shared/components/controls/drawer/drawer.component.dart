import 'package:angular2/angular2.dart' show Component, Input;
import 'package:angular2/router.dart' show ROUTER_DIRECTIVES;

@Component(selector: 'sp-drawer', directives: const [ROUTER_DIRECTIVES], templateUrl: 'drawer.component.html')
class DrawerComponent {
  @Input()
  String title;
  @Input()
  List<Link> links;
}

class Link {
  String title;
  List<String> route;

  Link(this.title, this.route);
}
