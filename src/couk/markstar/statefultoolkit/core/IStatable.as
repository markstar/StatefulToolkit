package couk.markstar.statefultoolkit.core
{
	
	public interface IStatable
	{
		function retrieveState():String
		function setState( state:XML ):void
	}
}