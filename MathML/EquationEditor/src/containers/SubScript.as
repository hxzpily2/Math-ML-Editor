package containers
{
	import flash.events.FocusEvent;
	
	import mx.events.ResizeEvent;
	
	public class SubScript
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var base:DisplayContainer=new DisplayContainer();
		public var exp:DisplayContainer=new DisplayContainer();
		public var top:DisplayContainer=new DisplayContainer();
		public var middle:DisplayContainer=new DisplayContainer();
		public var bottom:DisplayContainer=new DisplayContainer();
		public function SubScript()
		{
			
			parent.initHBox();parent.initializeParentBox();
			parent.assignId();
			GlobalData.addNodetoTable('msub',0,parent.countid,GlobalData._currentContainer.countid);
			parent.dContainer.setStyle('horizontalAlign','right');
			parent.dContainer.setStyle('verticalAlign','middle');
			base.initHBox();
			base.dContainer.setStyle('horizontalAlign','right');
			base.dContainer.setStyle('verticalAlign','middle');
			exp.initVBox();
			exp.dContainer.setStyle('verticalAlign','top');
			top.initHBox();top.initializeBox();
			middle.initHBox();
			bottom.initHBox();
			}
		public function setParent():void{
			this.exp.setChildContainer(this.top);
			this.exp.setChildContainer(this.middle);
			this.middle.dContainer.visible=true;
			base.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusLost);
			this.exp.dContainer.setStyle('verticalGap','-10');
			this.base.setBorder();this.base.initializeBox();this.base.addEffects();this.base.assignId();
			this.base.dContainer.addEventListener(ResizeEvent.RESIZE,handleSizeChange);
			GlobalData.addNodetoTable('mrow',0,this.base.countid,parent.countid);		
			this.parent.setChildContainer(this.base);
			this.parent.setChildContainer(this.exp);
			this.parent.dContainer.setStyle('horizontalGap','-10');
		}
		public function setSuperScript():void{
			this.top.addEffects();
			this.top.setBorder();
			GlobalData.identityArray[GlobalData.index]=(top.countid)
			GlobalData.index++;
		
			this.middle.dContainer.visible=false;
		}
		public function setSubScript():void{
			this.middle.setBorder();this.middle.addEffects();this.middle.assignId();
			this.middle.initializeBox(30,30);this.middle.assignId();
			middle.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusReceived);
			middle.dContainer.addEventListener(FocusEvent.FOCUS_OUT,focusLost);
			GlobalData.addNodetoTable('mrow',1,this.middle.countid,parent.countid);		
			this.top.dContainer.visible=false;
		}
		public function focusReceived(event:FocusEvent):void{
			GlobalData.minMode=true;
		}
		public function focusLost(event:FocusEvent):void{
			GlobalData.minMode=false;
		}
		public function handleSizeChange(event:ResizeEvent):void
		{
			top.dContainer.height=base.dContainer.height;
		}
	}
}