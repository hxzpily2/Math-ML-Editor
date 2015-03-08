package containers
{
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.TextInput;
	
	public class RootBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var root:DisplayContainer=new DisplayContainer();
		public var sqrtB:SqrtBox=new SqrtBox();
		public var leafNodeID:int;
		public var rootT:TextInput;
		public function RootBox()
		{
			rootT=new TextInput();
			parent.initHBox();parent.addEffects();parent.assignId();
			root.initHBox();root.assignId();//root.initializeBox();
			GlobalData.addNodetoTable('mroot',0,parent.countid,GlobalData._currentContainer.countid);
			GlobalData.addNodetoTable('mrow',1,sqrtB.baseBox.countid,parent.countid);
			rootT.width=20;rootT.height=30;rootT.move(5,10);
			rootT.text='';
			rootT.maxChars=1;rootT.setStyle('fontSize','15');
		}
		public function drawRoot():void{
			parent.dContainer.setStyle('horizontalAlign','center');
			parent.dContainer.setStyle('verticalAlign','middle');
			parent.dContainer.setStyle('horizontalGap','-15');
			//parent.dContainer.addChild(root);
			sqrtB.drawSqrt();
			root.dContainer.addChild(rootT);
			rootT.move(5,10);
			//sqrtB.root.setChildContainer(root);
			sqrtB.root.dContainer.setStyle('verticalAlign','middle');
			parent.setChildContainer(root);
			parent.setChildContainer(sqrtB.parent);
			//root.addEventListener(TextEvent.TEXT_INPUT,inputText);
			rootT.addEventListener(MouseEvent.MOUSE_OUT,inputText);
		}
		public function inputText(event:MouseEvent):void
		{
			var ind:int=0;
			GlobalData.addNodetoTable('mn',1,root.countid,parent.countid,rootT.text);
		}
	}
}