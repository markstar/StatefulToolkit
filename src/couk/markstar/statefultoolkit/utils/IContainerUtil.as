package couk.markstar.statefultoolkit.utils
{
	import couk.markstar.statefultoolkit.core.IStateContainer;
	
	public interface IContainerUtil
	{
		function registerContainer( container:IStateContainer ):void
		function unRegisterContainer():void
	}
}

