part of animate_gui;

/**
 * The [Component] class is the base class for all Animate GUI objects. The component acts as a wrapper for a HTML dom element. 
 * You can access the dom element by referencing the [_element] get property. Each subclass of Component will create a specific 
 * html element and have functions designed to interact with the element.
 */
class Component extends EventDispatcher
{
  /// The global ID counter for all GUI elements in Animate
  static int GUI_ID = 0;
  
  /// The DOM [Element] associated with this component. 
  Element _element;
  int _id = 0;
  
  /**
   * Creates an instance of [Component]
   */
  Component( this._element ) : super()
  {
    GUI_ID++;
    _id = GUI_ID;
    
    //Associate the ID of this component with the page element.
    _element.attributes["cid"] = _id.toString();
  }
  
  /// Gets the ID of this [Component].
  int get id => _id;
  
  /// Gets the [Element] of this [Component].
  Element get element => _element;
}