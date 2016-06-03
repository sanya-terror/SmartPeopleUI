import 'package:redstone/redstone.dart' as app;
import 'dart:io';

@app.Group("/api")
class DemoService {

  @app.Route("authorize", methods: const [app.POST])
  authorize(@app.Body(app.JSON) Map body) {
    Map credentials = body['credentials'];
    return { 'token': '${credentials['user']}_${credentials['password']}' };
  }

  @app.Route("authorize", methods: const [app.OPTIONS])
  authorizeOptions() {
    return 123;
  }
}

@app.ErrorHandler(HttpStatus.NOT_FOUND)
@app.ErrorHandler(HttpStatus.BAD_REQUEST)
handleNotFoundError() => app.redirect("/");

main() {
  app.setupConsoleLog();

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  app.start(port: port);
}
