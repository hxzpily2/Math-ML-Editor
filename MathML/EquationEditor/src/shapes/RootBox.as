package shapes
{
	import mx.core.Container;
		import containers.DisplayContainer;
	public class RootBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var root:DisplayContainer=new DisplayContainer();
		public var itemBox:DisplayContainer=new DisplayContainer();
		public function RootBox()
		{
			parent.initHBox();parent.dContainer.setStyle('horizontalGap','-25');
			parent.dContainer.setStyle('horizonalAlign','center');
			parent.dContainer.setStyle('verticalAlign','top');
			root.initHBox();
			itemBox.initHBox();
		}
		public function setRoot():DisplayContainer{
			parent.setChildContainer(root);
			parent.setChildContainer(itemBox);
			return parent;
		}
	}
}