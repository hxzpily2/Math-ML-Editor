package containers
{
	import components.Custom_Operand;
	
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	
	import mx.controls.Label;
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
		public function OperandBox(curr:DisplayContainer)
		{
			this.current=curr;
			parent.initHBox();parent.assignId();//parent.countid=gb.countId+1;gb.countId=gb.countId+1;
			parent.addEffects();
			parent.initializeParentBox();
			parent.dContainer.setStyle('horizontalGap','-5');
			}
		public   function drawSymbol(opr:String):OperandBox{
			index=getChildIndex();
			var custlblObj:Custom_Operand=new Custom_Operand(this.current,index);
			custlblObj.initOperand(opr);
			parent.dContainer=custlblObj.containerHbox;
			GlobalData.addNodetoTable('mi',0,parent.countid,GlobalData._currentContainer.countid,opr);
			//parent.dContainer.addChild(custlblObj.containerHbox);
			parent.dContainer.addEventListener(MouseEvent.CLICK,jusClick)
			return this;
		}
		 /* public function draw(opr:String):Label{
			var my_label:Label=new Label();
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
			return my_label;
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
		} */
		public function getChildIndex():uint{
			return this.current.dContainer.getChildren().length;
		}
		public function jusClick(event:MouseEvent):void{
		//	Alert.show('jus index is ' +this.getChildIndex().toString());
		}
	}
}