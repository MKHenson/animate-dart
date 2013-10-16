import 'dart:html' hide Event;
import 'package:animate_gui/animate_gui.dart';
import 'package:animate_core/animate_core.dart';

void main()
{
  Component comp = new Component( query("#sample_text_id" ) );
  
  print( onEvent );
  comp.addEventListener("HELLO", onEvent );
  comp.dispatchEvent(new Event("HELLO") );
  
  comp.removeEventListener("HELLO", onEvent );
  comp.dispatchEvent(new Event("HELLO") );
}

void onEvent( Event e, Object sender )
{
  print(e.eventName);
  print(sender);
}