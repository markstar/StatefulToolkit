package couk.markstar.examples.ui
{
	import couk.markstar.statefultoolkit.core.IStatable;
	import flash.display.Sprite;
	
	public class Circle extends Sprite implements IStatable
	{
		/**
		 * The constructor draws the circle
		 */
		public function Circle():void
		{
			super();
			graphics.clear();
			graphics.lineStyle( 1, 0x999999 )
			graphics.beginFill( 0xFFFFFFF );
			graphics.drawCircle( 0, 0, 10 );
			graphics.endFill();
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
	}
}