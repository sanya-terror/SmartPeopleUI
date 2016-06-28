import 'package:angular2/core.dart';

@Component(
selector: 'sp-not-found-error',
templateUrl: 'not-found-error.component.html',
styleUrls: const['not-found-error.component.css'])
class NotFoundErrorComponent implements OnDestroy{
   
  @override
  ngOnDestroy() {
    // TODO: implement state clen up
  }
}
