package containers
{
	import components.Operands;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.Label;
	
	public class ArrowBox extends DisplayContainer
	{
				[Embed(source='Fonts/STIXGeneral.otf',
		fontName='myStixFont', fontWeight='Normal',
		mimeType='application/x-font'
		)]
		private var font1:Class;
		
		public var parent:DisplayContainer=new DisplayContainer();
		public var first:DisplayContainer=new DisplayContainer();
		public var second:DisplayContainer=new DisplayContainer();
		public var operator:Label=new Label();
		
		public function ArrowBox()
		{
			parent.initHBox();
				GlobalData.identityArray[GlobalData.index]=(parent.countid)
			GlobalData.index++;
		
			if(EquationEditor.beforeFlag && EquationEditor.afterFlag)
			{
				parent.assignId();
			}
		    first.initHBox();first.assignId();
		     GlobalData.identityArray[GlobalData.index]=(first.countid)
			GlobalData.index++;
					
			second.initHBox();second.assignId();
			 GlobalData.identityArray[GlobalData.index]=(second.countid)
				GlobalData.index++;
					
			first.addEffects();second.addEffects();parent.addEffects();
			//parent.removeBorder();
			parent.setHorizontalAlign();parent.setVerticalAlign();
			initialize();
		}
		
		public function addChild1(opr:String):DisplayContainer
		{
			var targetContainer:DisplayContainer=this.parent;
			if(!EquationEditor.beforeFlag || !EquationEditor.afterFlag)
			{
				targetContainer=GlobalData._currentContainer;
			}
			else
			{
				targetContainer.addtoTable('mrow',0,GlobalData._currentContainer.countid);
			}
			if(EquationEditor.beforeFlag)
			{
				GlobalData.shiftNodesRight(targetContainer.countid);
				GlobalData.shiftNodesRight(targetContainer.countid);
				first.addtoTable('mrow',EquationEditor.currentIndex,targetContainer.countid);first.setBorder();
				targetContainer.setChildContainerAt(first,EquationEditor.currentIndex);
			}
			
			getOperator(opr);
			targetContainer.dContainer.addChildAt(operator,EquationEditor.currentIndex+1);
			
			if(EquationEditor.afterFlag)
			{
				GlobalData.shiftNodesRight1(targetContainer.countid);
				GlobalData.shiftNodesRight1(targetContainer.countid);
				second.addtoTable('mrow',EquationEditor.currentIndex+2,targetContainer.countid);second.setBorder();
				targetContainer.setChildContainerAt(second,EquationEditor.currentIndex+2);
			}
			var mo_opr:Operands=new Operands();
			var mo_Xml:XML=mo_opr.moXML()
//			Alert.show(mo_Xml.elements(opr).toXMLString());
			var indexid:int=mo_opr.arrows[1].indexOf(opr)
//			Alert.show(mo_opr.arrows[1][indexid].toString()+mo_opr.arrows[2][indexid].toString());
			GlobalData.addNodetoTable('mo',EquationEditor.currentIndex+1,GlobalData.assignOprId--,targetContainer.countid,'&'+mo_opr.arrows[2][indexid].toString()+';');
			
			return targetContainer;
			}
			
		public function Display(opr:String):DisplayContainer
		{
			 parent.dContainer.id='hbox';
			 parent.dContainer.setStyle('borderStyle','inset');
			 parent.setHorizontalAlign();
			 parent.setVerticalAlign();					
		
			 return  addChild1(opr);		
		}		
		
		public function initialize():void
		{
			parent.initializeParentBox();
			first.initializeBox();first.setVerticalAlign();
			second.initializeBox();second.setVerticalAlign();
			first.dContainer.addEventListener(MouseEvent.CLICK,setOperatorFocus);
			first.dContainer.addEventListener(KeyboardEvent.KEY_DOWN,setKeyBoardvalue)
			second.dContainer.addEventListener(MouseEvent.CLICK,setOperatorFocus);
			second.dContainer.addEventListener(KeyboardEvent.KEY_DOWN,setKeyBoardvalue)
			operator.addEventListener(MouseEvent.CLICK,setFocusOperator);
			
		}
		
		public function getOperator(opr:String):void
		{
			var my_label:Label=new Label();
			my_label.id='buf';
			my_label.x=0;my_label.y=0;
			my_label.minHeight=30;
			my_label.setStyle('fontSize','30');
			my_label.minWidth=30;
			my_label.text=''+opr+'';
			operator=my_label;
		}
		
		public function setFocusOperator(event:MouseEvent):void
		{
			event.target.parent.setFocus()
			event.target.parent.drawFocus(true)
			
			GlobalData._currentLabel=operator;
			EquationEditor.operatorFlag=false;
		}
		
		public function setOperatorFocus(event:MouseEvent):void
		{
			EquationEditor.operatorFlag=true;
		}
		
	}
}