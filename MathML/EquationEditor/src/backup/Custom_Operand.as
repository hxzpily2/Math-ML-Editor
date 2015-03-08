package components
{
	import containers.DisplayContainer;
	import containers.GlobalData;
	
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.controls.ToolTip;
	import mx.events.ToolTipEvent;
	
	public class Custom_Operand
	{
	public	var containerHbox:HBox=new HBox();
	public	var beforeLabel:HBox;
	public	var afterLabel:HBox;
	public var parent:DisplayContainer;
	public var ind:uint=5;
		public function Custom_Operand(par:DisplayContainer,index:uint)
		{
			this.parent=par;
			this.ind=index;
		}
		public function initOperand(opr:String):void
		{
			beforeLabel=new HBox();beforeLabel.name='before';
			afterLabel=new HBox();afterLabel.name='after';
			var lblText:Label=drawLabel(opr);
			beforeLabel.minHeight=30;afterLabel.minHeight=30;
			beforeLabel.width=4;afterLabel.width=4;
			afterLabel.setStyle('backgroundColor','#000000');
			beforeLabel.setStyle('backgroundColor','#000000');
			afterLabel.visible=false;beforeLabel.visible=false;
			beforeLabel.addEventListener(MouseEvent.CLICK,settingfocus);
			afterLabel.addEventListener(MouseEvent.CLICK,settingfocus);
			containerHbox.addEventListener(MouseEvent.MOUSE_OVER,visibleCursor);
			containerHbox.setStyle('verticalAlign','middle');
			containerHbox.setStyle('horizontalGap','0');
			containerHbox.addEventListener(MouseEvent.MOUSE_OUT,invisibleCusor);
			containerHbox.addChild(beforeLabel);
			containerHbox.addChild(lblText);
			containerHbox.addChild(afterLabel);
		}		
		public function visibleCursor(event:MouseEvent):void
		{
			beforeLabel.visible=true;
			afterLabel.visible=true;
		}
		public function invisibleCusor(event:MouseEvent):void
		{
			beforeLabel.visible=false;
			afterLabel.visible=false;
		}
		public function drawLabel(opr:String):Label
		{
			var lblText:Label=new Label();
//			lblText.minHeight=40;
			lblText.truncateToFit=true;
			lblText.text=opr;
			lblText.toolTip=lblText.text;
			lblText.setStyle('fontFamily','myStixFont');
			lblText.setStyle('fontSize',GlobalData.getFont());
			lblText.setStyle('textAlign','center')
			lblText.addEventListener(ToolTipEvent.TOOL_TIP_SHOWN,showToolTip);
			return lblText;
		}
		public function showToolTip(event:ToolTipEvent):void
		{
			var tool:ToolTip=ToolTip(event.toolTip);
			tool.minHeight=50
			tool.minWidth=50
			tool.setStyle('fontSize',GlobalData.getFont());
			tool.setStyle('textAlign','center');				 
		}
		public function settingfocus(event:MouseEvent):void
		{
			var selectLbl:HBox=HBox( event.currentTarget );
			selectLbl.drawFocus(true);
			//Alert.show('the current index is '+this.parent.dContainer.getChildIndex(this.containerHbox).toString());
			EquationEditor.currentIndex=this.parent.dContainer.getChildIndex(this.containerHbox);
			GlobalData._currentContainer=this.parent;
			EquationEditor.operandFlag=false;
			if(event.target.name=='after')
			{
				 EquationEditor.afterFlag=true;
				 EquationEditor.beforeFlag=false;
			 }
			if(event.target.name=='before')
			{ 
				EquationEditor.afterFlag=false;
				EquationEditor.beforeFlag=true;
			}
		}
	}
}