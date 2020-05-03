import 'package:uuid/uuid.dart';

var uuid = Uuid();

String getUuid(){
  return uuid.v1();
}