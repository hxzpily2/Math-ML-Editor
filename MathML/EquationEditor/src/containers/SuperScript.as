package containers
{
	import flash.events.FocusEvent;
	
	import mx.controls.Alert;
	import mx.events.ResizeEvent;
	
	public class SuperScript
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var bottom:DisplayContainer=new DisplayContainer();
		public var bottom1:DisplayContainer=new DisplayContainer();
		public var top:DisplayContainer=new DisplayContainer();
		public var exp:DisplayContainer=new DisplayContainer();
		public function SuperScript()
		{
			parent.initVBox();//parent.setBorder();
			parent.assignId();
			bottom.initHBox();			
			bottom1.initHBox();			
			top.initHBox();			
			exp.initHBox();			
			setAlignmentStyle();
			GlobalData.addNodetoTable('msup',0,parent.countid,GlobalData._currentContainer.countid);
		}
		public function setAlignmentStyle():void{
			parent.dContainer.setStyle('horizontalAlign','left');
			top.dContainer.setStyle('horizontalAlign','left');
			top.dContainer.setStyle('verticalAlign','bottom');
			top.dContainer.setStyle('horizontalGap','-5');
			parent.dContainer.setStyle('verticalGap','-10');
		}
		public function drawSuperScript():void
		{
			bottom1.initializeBox();bottom1.setBorder();
			GlobalData.identityArray[GlobalData.index]=(bottom.countid)
			GlobalData.index++;
			
			bottom.initializeBox(30);exp.initializeBox(30,30);
			exp.assignId();
			
			exp.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusReceived);
			exp.dContainer.addEventListener(FocusEvent.FOCUS_OUT,focusLost);
			GlobalData.addNodetoTable('mrow',1,exp.countid,parent.countid);
			top.setChildContainer(bottom);
			top.setChildContainer(exp);exp.setBorder()
			GlobalData.identityArray[GlobalData.index]=(exp.countid)
			GlobalData.index++;
			
			parent.setChildContainer(top);bottom1.addEffects();
			top.removeEffect();
			//top.removeBorder();
			bottom1.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusLost);
			bottom1.dContainer.addEventListener(ResizeEvent.RESIZE,handleSizeChange);
			bottom1.assignId();
			GlobalData.addNodetoTable('mrow',0,bottom1.countid,parent.countid);
			parent.setChildContainer(bottom1);exp.addEffects();
		}
		public function handleSizeChange(event:ResizeEvent):void
		{
			bottom.dContainer.width=bottom1.dContainer.width;
		}
		public function focusReceived(event:FocusEvent):void{
			GlobalData.minMode=true;
		}
		public function focusLost(event:FocusEvent):void{
			
			GlobalData.minMode=false;
		}
	}
}