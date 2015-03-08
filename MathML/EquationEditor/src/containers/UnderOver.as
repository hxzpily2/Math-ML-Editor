package containers
{
	import flash.events.FocusEvent;
	public class UnderOver
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var top:DisplayContainer=new DisplayContainer();
		public var middle:DisplayContainer=new DisplayContainer();
		public var bottom:DisplayContainer=new DisplayContainer();
		public function UnderOver()
		{
			parent.initVBox();parent.addEffects();parent.initializeParentBox();
			parent.assignId();
			GlobalData.identityArray[GlobalData.index]=(parent.countid)
			GlobalData.index++;
			
			top.initHBox();
			GlobalData.identityArray[GlobalData.index]=(top.countid)
			GlobalData.index++;
			
			middle.initHBox();middle.initializeBox();middle.setBorder();middle.addEffects();
			middle.assignId();
			GlobalData.identityArray[GlobalData.index]=(middle.countid)
			GlobalData.index++;
		
			bottom.initHBox();
			GlobalData.identityArray[GlobalData.index]=(bottom.countid)
			GlobalData.index++;
			
			setProperty();
		}
		public function setProperty():void{
			parent.dContainer.setStyle('horizontalAlign','center');
			parent.dContainer.setStyle('verticalAlign','middle');
			parent.dContainer.setStyle('verticalGap','-2');
			top.dContainer.setStyle('horizontalAlign','center');
			top.dContainer.setStyle('fontSize','10');
			bottom.dContainer.setStyle('horizontalAlign','center');
			bottom.dContainer.setStyle('fontSize','10');
		}
		public function drawUnder():UnderOver{
			parent.setChildContainer(middle);
			parent.setChildContainer(bottom);
			GlobalData.addNodetoTable('munder',0,parent.countid,GlobalData._currentContainer.countid);
			bottom.initializeBox(20,20);bottom.assignId();
			GlobalData.addNodetoTable('mrow',0,middle.countid,parent.countid);
			GlobalData.addNodetoTable('mrow',1,bottom.countid,parent.countid);
			bottom.setBorder();
			bottom.addEffects();
			middle.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusLost);
			bottom.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusReceived);
			bottom.dContainer.addEventListener(FocusEvent.FOCUS_OUT,focusLost);
			return this;
		}
		public function drawOver():UnderOver{
			parent.setChildContainer(top);
			parent.setChildContainer(middle);
			GlobalData.addNodetoTable('mover',0,parent.countid,GlobalData._currentContainer.countid);
			top.initializeBox(20,20);
			top.setBorder();
			top.addEffects();top.assignId();
			GlobalData.addNodetoTable('mrow',0,middle.countid,parent.countid);
			GlobalData.addNodetoTable('mrow',1,top.countid,parent.countid);
			middle.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusLost);
			top.dContainer.addEventListener(FocusEvent.FOCUS_IN,focusReceived);
			top.dContainer.addEventListener(FocusEvent.FOCUS_OUT,focusLost);
			return this;
		}
		public function focusReceived(event:FocusEvent):void{
			GlobalData.minMode=true;
		}
		public function focusLost(event:FocusEvent):void{
			GlobalData.minMode=false;
			parent.dContainer.setStyle('verticalGap','-5');
		}
	}
}