library smartpeople_server.api;

import 'package:redstone/redstone.dart' as app;

@app.Install(urlPrefix: '/users')
import 'src/api/users/users_config.dart';
