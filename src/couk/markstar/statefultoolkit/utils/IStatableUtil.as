package couk.markstar.statefultoolkit.utils
{
	import couk.markstar.statefultoolkit.core.IStatable;
	
	public interface IStatableUtil
	{
		function registerObject( container:IStatable ):void
		function unRegisterObject():void
	}
}

