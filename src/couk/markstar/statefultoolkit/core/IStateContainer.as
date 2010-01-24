package couk.markstar.statefultoolkit.core
{
	
	public interface IStateContainer extends IStatable
	{
		function addObjectByState( state:XML ):void
		function hasSelectedObject():Boolean
		function retrieveSelectedObject():IStatable
	}
}

