package couk.markstar.statefultoolkit.utils
{
	import couk.markstar.statefultoolkit.core.IStatable;
	import couk.markstar.statefultoolkit.core.IStateContainer;
	
	import flash.events.Event;
	import flash.net.FileReference;
	
	public class FileUtil implements IFileUtil
	{
		protected var _container:IStatable;
		
		protected var _fileReference:FileReference;
		
		public function FileUtil():void
		{
		}
		
		public function registerObject( container:IStatable ):void
		{
			_container = container;
		}
		
		public function unRegisterObject():void
		{
			_container = null;
			
			if( _fileReference )
			{
				_fileReference.removeEventListener( Event.SELECT, loadSelectListener );
				_fileReference.removeEventListener( Event.CANCEL, dialogCancelListener );
				_fileReference.removeEventListener( Event.COMPLETE, loadCompleteListener );
				_fileReference = null;
			}
		}
		
		public function save( filename:String = "state.xml" ):void
		{
			_fileReference = new FileReference();
			_fileReference.save( _container.retrieveState(), filename );
			_fileReference.addEventListener( Event.CANCEL, dialogCancelListener );
		}
		
		public function load():void
		{
			if( _container )
			{
				_fileReference = new FileReference();
				_fileReference.addEventListener( Event.SELECT, loadSelectListener );
				_fileReference.addEventListener( Event.CANCEL, dialogCancelListener );
				_fileReference.browse();
			}
		}
		
		protected function dialogCancelListener( e:Event ):void
		{
			_fileReference.removeEventListener( Event.SELECT, loadSelectListener );
			_fileReference.removeEventListener( Event.CANCEL, dialogCancelListener );
			_fileReference = null;
		}
		
		protected function loadSelectListener( e:Event ):void
		{
			_fileReference.removeEventListener( Event.SELECT, loadSelectListener );
			_fileReference.removeEventListener( Event.CANCEL, dialogCancelListener );
			_fileReference.addEventListener( Event.COMPLETE, loadCompleteListener );
			_fileReference.load();
		}
		
		protected function loadCompleteListener( e:Event ):void
		{
			_fileReference.removeEventListener( Event.COMPLETE, loadCompleteListener );
			_container.setState( new XML( _fileReference.data.toString() ) );
			_fileReference = null;
		}
	}
}

