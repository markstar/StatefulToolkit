package couk.markstar.examples.ui
{
	import couk.markstar.statefultoolkit.core.IStatable;
	
	import flash.display.Sprite;
	
	public class Circle extends Sprite implements IStatable
	{
		/**
		 * The constructor draws the circle with a grey outline
		 */
		public function Circle():void
		{
			super();
			
			drawCircle( 0x999999 );
		}
		
		/**
		 * Change the display of the circle to show it's selected
		 */
		public function select():void
		{
			drawCircle( 0x990000 );
		}
		
		/**
		 * Change the display of the circle to the default
		 */
		public function deselect():void
		{
			drawCircle( 0x999999 );
		}
		
		/**
		 * Retrieve the state of the circle storing the x and y properties
		 *
		 * @return The current state of the circle as an XML string
		 */
		public function retrieveState():String
		{
			var xml:String = '<object>';
			xml += '<x>' + x + '</x>';
			xml += '<y>' + y + '</y>';
			xml += '</object>';
			return xml;
		}
		
		/**
		 * Set the state of the circle by getting it's x and y values from the xml
		 *
		 * @param state The new state of the circle
		 */
		public function setState( state:XML ):void
		{
			x = Number( state.x );
			y = Number( state.y );
		}
		
		/**
		 * Used internally for creating the circles' graphics
		 * 
		 * @param lineColor The color of the line around the circle
		 */
		protected function drawCircle( lineColor:uint ):void
		{
			graphics.clear();
			graphics.lineStyle( 1, lineColor )
			graphics.beginFill( 0xFFFFFFF );
			graphics.drawCircle( 0, 0, 10 );
			graphics.endFill();
		}
	}
}