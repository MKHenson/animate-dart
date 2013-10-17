part of animate_core;

typedef void TargetFunction(Event event, EventDispatcher sender );

/**
 * A simple holder class for events and event names.
 */
class FunctionPair
{
  TargetFunction callback;
  String eventName;
  
  FunctionPair(this.eventName, this.callback)
  {
  }
}

/**
 * The [EventDispatcher] class is an abstract class that is used to dispatch
 * and listen for [Event] objects. 
 */
class EventDispatcher
{
  List<FunctionPair> _listeners;
  
  /**
   * Creates an instance of the [EventDispatcher] class
   */
  EventDispatcher()
  {
    _listeners = new List<FunctionPair>();
  }
  
  /**
   * Adds a listener to the dispatcher. [eventName] is any valid event name and [callback]  is the function to call when the [Event] is fired.
   */
  void addEventListener( String eventName, TargetFunction callback )
  {
    _listeners.add( new FunctionPair( eventName, callback ) );
  }
  
  /**
   * Removes all listeners from the dispatcher.
   */
  void removeAllListeners()
  {
    _listeners.removeRange(0, _listeners.length);
  }
  
  /**
   * Removes a listeners from the dispatcher by its [eventName] and [callback] function
   */
  void removeEventListener( String eventName, TargetFunction callback )
  {
    assert( callback != null );
    
    int len = _listeners.length;
    for ( int i = 0; i < len; i++ )
    {
      if ( _listeners[i].eventName == eventName &&  _listeners[i].callback == callback )
      {
        _listeners.removeAt(i);
        return;
      }
    };
  }
  
  /**
   * Use this method to dispatch an event to all listeners attached to this object. Only listeners associated with using the same eventName will be
   * notified.
   */
  void dispatchEvent( Event event )
  {
    int len = _listeners.length;
    for ( int i = 0; i < len; i++ )
    {
      if ( _listeners[i].eventName == event.eventName )
        _listeners[i].callback( event, this );
    };
  }
}