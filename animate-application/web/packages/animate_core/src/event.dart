part of animate_core;

/**
 * The base class for all event objects in Animate. 
 * Primarily used in the [EventDispatcher] class when calling dispatch event.
 */
class Event
{
  String _eventName;
  
  /**
   * Creates an instance of the [Event] class
   */
  Event( this._eventName )
  {
    
  }
  
  /// Gets the event name associated with this [Event]
  String get eventName => _eventName;
}