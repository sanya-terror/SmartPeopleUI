library smartpeople_server.database.users;

import 'dart:async';
import 'database.dart';

class UsersRepository {
  DatabaseConnection db;

  UsersRepository(this.db);

  Future<int> insert(Map<String, dynamic> user) async {
    return db.execute('insert into users values (@id, @name, @email, @password)',
        {'id': user['id'], 'name': user['name'], 'email': user['email'], 'password': user['password']});
  }
}
