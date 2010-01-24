package couk.markstar.statefultoolkit.utils
{
	
	public interface IFileUtil extends IStatableUtil
	{
		function save( filename:String = "state.xml" ):void
		function load():void
	}
}

