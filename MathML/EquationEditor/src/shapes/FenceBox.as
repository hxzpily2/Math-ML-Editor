package shapes
{
	import mx.core.Container;
	import containers.DisplayContainer;
	import com.parser.BitmapHandler;
	public class FenceBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var openF:DisplayContainer=new DisplayContainer();
		public var closeF:DisplayContainer=new DisplayContainer();
		public var child:DisplayContainer=new DisplayContainer();
		public function FenceBox()
		{
			parent.initHBox();
			openF.initHBox();openF.initializeBox();
			closeF.initHBox();
			child.initHBox();
			setProperty();
		}
		public function setProperty():void
		{
			child.dContainer.setStyle('verticalAlign','middle');
			child.dContainer.setStyle('horizontalAlign','centre');
		}
		public function drawFence(open:String,close:String,height:int):DisplayContainer
		{
			var btmpHand:BitmapHandler=new BitmapHandler();
			openF.dContainer.addChild(btmpHand.bitmapHandler(height,open));
			closeF.dContainer.addChild(btmpHand.bitmapHandler(height,close));
			return	setChild();
		}
		public function setChild():DisplayContainer
		{
			parent.setChildContainer(openF);
			parent.setChildContainer(child);
			parent.setChildContainer(closeF);
			return this.parent;
		}
	}
}