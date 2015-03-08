package shapes
{
	import mx.core.Container;
	import containers.DisplayContainer;
	public class FracBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var numBox:DisplayContainer=new DisplayContainer();
		public var denBox:DisplayContainer=new DisplayContainer();
		public var median:DisplayContainer=new DisplayContainer();
		public function FracBox()
		{
			parent.initVBox();
			numBox.initHBox();
			denBox.initHBox();
			median.initHBox();
			parent.dContainer.setStyle('verticalGap','0');
//		    fracContainer.dContainer.setStyle('verticalAlign','middle');
		   parent.dContainer.setStyle('horizontalAlign','center'); 
		}
		public function setFraction():DisplayContainer{
			parent.setChildContainer(numBox);
			parent.setChildContainer(median);
			parent.setChildContainer(denBox);
			return parent;
		}

	}
}