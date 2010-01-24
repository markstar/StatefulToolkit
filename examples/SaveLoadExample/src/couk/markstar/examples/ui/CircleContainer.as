package couk.markstar.examples.ui
{
	import couk.markstar.statefultoolkit.core.IStatable;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class CircleContainer extends Sprite implements IStatable
	{
		protected var _circles:Vector.<Circle>;
		
		protected var _currentCircle:Circle;
		protected var _dragOffset:Point;
		
		/**
		 * The constructor the vector containing the circles shown in the container
		 */
		public function CircleContainer():void
		{
			_circles = new Vector.<Circle>();
			super();
		}
		
		/**
		 * Add an object to the container by it's state.
		 *
		 * @param state The state of the object to add, in this case the circle
		 */
		public function addObjectByState( state:XML ):void
		{
			var circle:Circle = new Circle();
			circle.addEventListener( MouseEvent.MOUSE_DOWN, circleDownListener );
			circle.setState( state );
			addChild( circle );
			
			// Faster than Vector.push()
			_circles[ _circles.length ] = circle;
		}
		
		/**
		 * Retrieve the state of the container and all contained circles
		 *
		 * @return The current state of the container, including the state's of all circles
		 */
		public function retrieveState():String
		{
			var xml:String = "<container>";
			
			for( var i:uint = 0; i < _circles.length; i++ )
			{
				xml += _circles[ i ].retrieveState();
			}
			xml += "</container>";
			return xml;
		}
		
		/**
		 * Set the state of the container by adding all circles contained within the state. The container will be cleared first.
		 *
		 * @param state The new state of the container
		 */
		public function setState( state:XML ):void
		{
			clearContainer();
			
			for( var i:uint = 0; i < state.object.length(); i++ )
			{
				addObjectByState( XML( state.object[ i ] ) );
			}
		}
		
		/**
		 * Clear the container of all circles
		 *
		 */
		protected function clearContainer():void
		{
			for( var i:uint = 0; i < _circles.length; i++ )
			{
				removeChild( _circles[ i ] );
			}
			_circles.splice( 0, _circles.length );
		}
		
		/*
		 * The following methods are all event listeners to enable the circles to be positioned
		 */
		protected function circleDownListener( e:MouseEvent ):void
		{
			_currentCircle = Circle( e.currentTarget );
			stage.addEventListener( MouseEvent.MOUSE_MOVE, circleMouseMoveListener );
			stage.addEventListener( MouseEvent.MOUSE_UP, circleMouseUpListener );
			_dragOffset = new Point( _currentCircle.x - mouseX, _currentCircle.y - mouseY );
		}
		
		protected function circleMouseMoveListener( e:MouseEvent ):void
		{
			_currentCircle.x = mouseX + _dragOffset.x;
			_currentCircle.y = mouseY + _dragOffset.y;
			e.updateAfterEvent();
		}
		
		protected function circleMouseUpListener( e:MouseEvent ):void
		{
			stage.removeEventListener( MouseEvent.MOUSE_MOVE, circleMouseMoveListener );
			stage.removeEventListener( MouseEvent.MOUSE_UP, circleMouseUpListener );
		}
	}
}

