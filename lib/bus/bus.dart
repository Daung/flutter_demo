import 'package:event_bus/event_bus.dart';

//1, 引入event_bus
//2，创建全局的event_bus
//3, 事件监听

var eventBus = EventBus();

typedef EventBusCallback<T> = void Function(T data);

class EventBusHelper {
  static void fire(dynamic event) {
    eventBus.fire(event);
  }

  static void listen<T>({EventBusCallback<T> callback}) {
    eventBus.on<T>().listen((data) {
      if (callback != null) {
        callback(data);
      }
    });
  }
}
