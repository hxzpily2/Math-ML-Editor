package shapes
{
	import mx.controls.Alert;
		import containers.DisplayContainer;
	public class OverUnderBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var top:DisplayContainer=new DisplayContainer();
		public var bottom:DisplayContainer=new DisplayContainer();
		public var middle:DisplayContainer=new DisplayContainer();
		public function OverUnderBox()
		{
			parent.initVBox();
			parent.dContainer.setStyle('horizontalAlign','center');
			parent.dContainer.setStyle('verticalGap','-5');
			top.initHBox();
			bottom.initHBox();
			middle.initHBox();
		}
		public function setOverParent():void{
			this.parent.setChildContainer(this.top);
			this.parent.setChildContainer(this.middle);
			this.parent.setChildContainer(this.bottom);
			this.parent.dContainer.validateNow();			
    	}
    	public function setBottom():void{
    		this.bottom.dContainer.visible=false;
    	}
    	public function setTop():void{
    		
    		this.top.dContainer.visible=false;
    	}
	}
}