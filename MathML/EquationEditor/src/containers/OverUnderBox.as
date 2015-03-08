package containers
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	public class OverUnderBox extends DisplayContainer
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
				GlobalData.identityArray[GlobalData.index]=(top.countid)
			GlobalData.index++;
			bottom.initHBox();
				GlobalData.identityArray[GlobalData.index]=(bottom.countid)
			GlobalData.index++;
			middle.initHBox();middle.initializeBox();middle.addEffects();middle.setBorder();
				GlobalData.identityArray[GlobalData.index]=(middle.countid)
			GlobalData.index++;
			
		}
		public function setOverParent():void{
			this.parent.setChildContainer(this.top);
			this.parent.setChildContainer(this.middle);
			this.parent.setChildContainer(this.bottom);
			this.parent.dContainer.validateNow();			
    	}
    	public function setBottom():void{
    		
    		this.bottom.initializeBox(30,30);this.bottom.setBorder();this.bottom.addEffects();
    	    this.bottom.dContainer.addEventListener(MouseEvent.CLICK,decreaseFontSizeO);
    	     
    		this.top.dContainer.visible=false;
    		
    	}
    	public function setTop():void{
    		
    		this.top.initializeBox(30,30);this.top.setBorder();this.top.addEffects();
    		this.top.decreaseFontSize();
    		this.bottom.dContainer.visible=false;
    	}
    	public function decreaseFontSizeO(event:MouseEvent):void
    	{
    		GlobalData.fontSizeO=10;
    	}
    	
	}
}