library users;

import 'package:redstone/redstone.dart' as app;

@app.Install(urlPrefix: '/')
import 'users_service.dart';

@app.Install(urlPrefix: '/restore-access')
import 'restore_access_service.dart';

@app.Install(urlPrefix: '/sign-up')
import 'sign_up_service.dart';