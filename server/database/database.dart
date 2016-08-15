library database;

import 'dart:async';
import 'dart:io';

import 'package:postgresql/postgresql.dart' as db;

class Database {

  db.Connection connection;

  Future<db.Connection> connect() async {

    var uri = Platform.environment['CONNECTION_STRING'];
    uri ??= 'postgres://postgres:1q2w3e4r@localhost:5432/postgres';

    connection = await db.connect(uri);

    return connection;
  }

  Future<int> execute(String sql, [values]) => connection.execute(sql, values);

  Stream<db.Row> query(String sql, [values]) => connection.query(sql, values);

  void close() => connection.close();
}