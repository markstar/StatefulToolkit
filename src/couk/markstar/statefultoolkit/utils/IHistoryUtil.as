package couk.markstar.statefultoolkit.utils
{
	
	public interface IHistoryUtil extends IContainerUtil
	{
		function undo():void
		function redo():void
		function enable():void
		function disable():void
	}
}

