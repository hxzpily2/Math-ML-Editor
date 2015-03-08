package containers
{
	import flash.events.MouseEvent;
	
	import mx.events.ResizeEvent;
	
	public class SqrtBox extends DisplayContainer
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var root:DisplayContainer=new DisplayContainer();
		public var topLine:DisplayContainer=new DisplayContainer();
		public var baseBox:DisplayContainer=new DisplayContainer();
		public var right:DisplayContainer=new DisplayContainer();
		public function SqrtBox()
		{
			parent.initHBox();parent.dContainer.setStyle('verticalAlign','top');
			parent.setBorder(5);
			parent.addEffects();
			GlobalData.identityArray[GlobalData.index]=(parent.countid)
			GlobalData.index++;
			parent.dContainer.setStyle('horizontalGap','5');
			parent.assignId();
			root.initHBox();root.initializeBox();//root.setBorder();root.addEffects();
			root.dContainer.setStyle('horizontalAlign','left');
			right.initVBox();
			baseBox.initHBox();baseBox.initializeBox();baseBox.setBorder();baseBox.addEffects();
			baseBox.dContainer.addEventListener(MouseEvent.CLICK,setOperatorFocus);
			GlobalData.identityArray[GlobalData.index]=(baseBox.countid)
			GlobalData.index++;
			baseBox.assignId();
			topLine.initHBox();drawTopLine();
		}
		public function addMathML():void
		{
			GlobalData.addNodetoTable('msqrt',0,parent.countid,GlobalData._currentContainer.countid);
			GlobalData.addNodetoTable('mrow',0,baseBox.countid,parent.countid);
		}
		public function drawTopLine():void
		{
			topLine.dContainer.height=3;
			topLine.dContainer.width=50;//=baseBox.dContainer.width;
			topLine.dContainer.setStyle('backgroundColor','#000000');
			root.dContainer.addChild(new BitmapHandler1().drawRoot(baseBox.dContainer.height,'√'));
		    baseBox.dContainer.addEventListener(ResizeEvent.RESIZE,baseSizeChanged);
		}
		public function drawSqrt():void{
			root.dContainer.addChild(new BitmapHandler1().drawRoot(baseBox.dContainer.height,'√'));
		    root.dContainer.width=35;
		    right.setChildContainer(topLine);
		    right.setChildContainer(baseBox);
		    parent.setChildContainer(root);
		    parent.setChildContainer(right);
		   
		}
		public function baseSizeChanged(event:ResizeEvent):void{
			topLine.dContainer.width=baseBox.dContainer.width;
			root.dContainer.removeAllChildren();
			root.dContainer.addChild(new BitmapHandler1().drawRoot(right.dContainer.height,'√'));
		 }
		//BP 30  Oct added to reset the flags when the empty baseBox is Clicked
		
		 public function setOperatorFocus(event:MouseEvent):void
		{
			EquationEditor.operatorFlag=true;
			EquationEditor.operandFlag=true;
		}

	}
}