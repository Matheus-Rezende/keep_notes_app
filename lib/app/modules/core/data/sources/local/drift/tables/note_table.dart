import 'package:drift/drift.dart';

class NoteTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get contentJson => text()();
  DateTimeColumn get createdAt => dateTime()();
}
