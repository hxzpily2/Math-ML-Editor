package containers
{
	import components.Custom_Operand;
	import components.Operands;
	
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	
	import mx.controls.ToolTip;
	import mx.events.ToolTipEvent;
		
		
	public class OperandBox extends DisplayContainer
	{		[Embed(source='Fonts/STIXGeneral.otf',
		fontName='myStixFont', fontWeight='Normal',
		mimeType='application/x-font'
)]
private var font1:Class;
		public var parent:DisplayContainer=new DisplayContainer();
		public var myStyle:StyleSheet=new StyleSheet();
		public var current:DisplayContainer;
		public var index:uint;
		public var custlblObj:Custom_Operand;
		public function OperandBox(curr:DisplayContainer)
		{
			this.current=curr;
			//Alert.show(this.current.countid.toString());			
			parent.initHBox();parent.assignId();//parent.countid=gb.countId+1;gb.countId=gb.countId+1;
			parent.addEffects();
			parent.initializeParentBox();
			parent.dContainer.setStyle('horizontalGap','-5');
		}
		public   function drawSymbol(opr:String):OperandBox{
			index=getChildIndex();
			custlblObj=new Custom_Operand(this.current,index);
			custlblObj.initOperand(opr);
			parent.dContainer=custlblObj.containerHbox.dContainer;
			//parent.dContainer.addChild(custlblObj.containerHbox);
			parent.dContainer.addEventListener(MouseEvent.CLICK,jusClick)
			return this;
		}
		public function setMiNodeEdit():void{
			//GlobalData.addNodetoTable('mi',this.parent.dContainer.getChildIndex(this.containerHbox.dContainer),opndBox.countid,GlobalData._currentContainer.countid,new Operands().operandsC[2][indexVal]);
			GlobalData.addNodetoTable('mi',0,custlblObj.opndBox.countid,GlobalData._currentContainer.countid,new Operands().operandsC[2][custlblObj.indexVal]);
			//Alert.show('set table'+this.parent.dContainer.getChildIndex(this.containerHbox.dContainer).toString());
		}	
		 public function draw(opr:String):void{
			/* var my_label:Label=new Label();
			my_label.x=0;
			my_label.y=0;
			my_label.text=opr;
			my_label.toolTip=my_label.text;
		//	my_label.setStyle('styleName','plaintext');
			my_label.setStyle('fontFamily','myStixFont');
			my_label.setStyle('fontSize',GlobalData.fontSizeO);
			my_label.setStyle('textAlign','center')
			my_label.addEventListener(ToolTipEvent.TOOL_TIP_SHOWN,showToolTip);
			my_label.addEventListener(MouseEvent.CLICK,setLabelFocus)
			return my_label; */
			this.custlblObj.drawLabel(opr);
		} 
		public function showToolTip(event:ToolTipEvent):void
		{
			var tool:ToolTip=ToolTip(event.toolTip);
			tool.minHeight=50
			tool.minWidth=50
			tool.setStyle('fontSize',40);
			tool.setStyle('textAlign','center');				 
		}
		public function setLabelFocus(event:MouseEvent):void
		{
			parent.dContainer.setFocus();
			parent.dContainer.drawFocus(true);
			GlobalData._currentContainer=parent;
				//	EqnEditor2.operandFlag=false;
		} 
		public function getChildIndex():uint{
			return this.current.dContainer.getChildren().length;
		}
		public function jusClick(event:MouseEvent):void{
		//	Alert.show('jus index is ' +this.getChildIndex().toString());
		}
	}
}