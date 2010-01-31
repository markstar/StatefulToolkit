package {
	import com.bit101.components.PushButton;
	
	import couk.markstar.examples.ui.CircleContainer;
	import couk.markstar.statefultoolkit.utils.ClipboardUtil;
	import couk.markstar.statefultoolkit.utils.FileUtil;
	import couk.markstar.statefultoolkit.utils.IClipboardUtil;
	import couk.markstar.statefultoolkit.utils.IFileUtil;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	[SWF( backgroundColor='#F3F3F3',frameRate='30',width='592',height='300' )]
	public class ClipboardExample extends Sprite
	{
		protected var _saveButton:PushButton;
		protected var _loadButton:PushButton;
		
		protected var _circleContainer:CircleContainer;
		protected var _fileUtil:IFileUtil;
		protected var _clipboardUtil:IClipboardUtil;
		
		/**
		 * Create the save and load buttons to save and load the state. Then create the circle container and register it with the FileUtil.
		 * By registering the container with the FileUtil it means the FileUtil knows which statable object to retrieve and set the state on
		 * when save and load are executed.
		 * Register the container with the ClipboardUtil so it can capture keyboard shortcuts.
		 */
		
		public function ClipboardExample():void
		{
			// PushButton( parent, x, y, label, MouseEvent.CLICK event listener )
			_saveButton = new PushButton( this, 196, 275, "Save", saveClickListener );
			_loadButton = new PushButton( this, 295, 275, "Load", loadClickListener );
			
			_circleContainer = new CircleContainer();
			
			_fileUtil = new FileUtil();
			_fileUtil.registerObject( _circleContainer );
			
			// ClipboardUtil requires reference to the stage so it can manage the keyboard shortcuts
			_clipboardUtil = new ClipboardUtil( stage );
			_clipboardUtil.registerContainer( _circleContainer );
			
			addChild( _circleContainer );
			
			initDefaultState();
		}
		
		protected function saveClickListener( e:MouseEvent ):void
		{
			_fileUtil.save();
		}
		
		protected function loadClickListener( e:MouseEvent ):void
		{
			_fileUtil.load();
		}
		
		/**
		 * Initialise the circle container with four circles
		 */
		protected function initDefaultState():void
		{
			var defaultState:String = '<container>';
			defaultState += '<object><x>196</x><y>100</y></object>';
			defaultState += '<object><x>196</x><y>200</y></object>';
			defaultState += '<object><x>396</x><y>100</y></object>';
			defaultState += '<object><x>396</x><y>200</y></object>';
			defaultState += '</container>';
			
			_circleContainer.setState( new XML( defaultState ) );
		}
	}
}

