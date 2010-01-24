package couk.markstar.statefultoolkit.utils
{
	import couk.markstar.statefultoolkit.core.IStateContainer;
	
	import flash.desktop.Clipboard;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	
	public class ClipboardUtil implements IClipboardUtil
	{
		private static const CLIPBOARD_FORMAT:String = "StatefulToolkitClipboardFormat";
		
		protected var _container:IStateContainer;
		protected var _stage:Stage;
		
		public function ClipboardUtil( stage:Stage ):void
		{
			_stage = stage;
		}
		
		public function registerContainer( container:IStateContainer ):void
		{
			_container = container;
			enable();
		}
		
		public function unRegisterContainer():void
		{
			disable();
			_container = null;
		}
		
		public function enable():void
		{
			_stage.addEventListener( KeyboardEvent.KEY_DOWN, keyDownListener );
			_stage.addEventListener( Event.COPY, copyListener );
			_stage.addEventListener( Event.PASTE, pasteListener );
		}
		
		public function disable():void
		{
			_stage.removeEventListener( KeyboardEvent.KEY_DOWN, keyDownListener );
			_stage.removeEventListener( Event.COPY, copyListener );
			_stage.removeEventListener( Event.PASTE, pasteListener );
		}
		
		protected function copyListener( e:Event ):void
		{
			if( _container.hasSelectedObject() )
			{
				Clipboard.generalClipboard.setData( CLIPBOARD_FORMAT, _container.retrieveSelectedObject().retrieveState() );
			}
		}
		
		protected function pasteListener( e:Event ):void
		{
			if( Clipboard.generalClipboard.hasFormat( CLIPBOARD_FORMAT ) )
			{
				_container.addObjectByState( XML( Clipboard.generalClipboard.getData( CLIPBOARD_FORMAT ) ) );
			}
		}
		
		protected function keyDownListener( e:KeyboardEvent ):void
		{
			if( !( _stage.focus is TextField ) )
			{
				_stage.focus = _stage;
			}
		}
	}
}

