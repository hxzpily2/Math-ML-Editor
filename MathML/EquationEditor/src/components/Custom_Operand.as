package components
{
	import com.messageservice.InfoMessageService;
	
	import containers.DisplayContainer;
	import containers.GlobalData;
	
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import mx.containers.HBox;
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.controls.ToolTip;
	import mx.core.Application;
	import mx.events.ToolTipEvent;
	
	public class Custom_Operand
	{
	public var opndBox:DisplayContainer=new DisplayContainer();
	public	var containerHbox:DisplayContainer=new DisplayContainer();
	public	var beforeLabel:HBox;
	public	var afterLabel:HBox;

	public var parent:DisplayContainer;
	public var ind:uint=5;
	public  var indexVal:Number;
	private var oprand_Obj:Operands=new Operands();
		public function Custom_Operand(par:DisplayContainer,index:uint)
		{
			this.parent=par;
			//Alert.show(this.parent.countid.toString());
			this.ind=index;
			opndBox.initHBox();
			beforeInit();						
		}
		public function beforeInit():void
		{
			containerHbox.initHBox();
			beforeLabel=new HBox();beforeLabel.name='before';
			afterLabel=new HBox();afterLabel.name='after';
			afterLabel.setStyle('backgroundColor','#000000');
			beforeLabel.setStyle('backgroundColor','#000000');
			beforeLabel.minHeight=GlobalData.getFont()+5;afterLabel.minHeight=GlobalData.getFont()+5;
			beforeLabel.width=4;afterLabel.width=4;
			opndBox.initHBox();opndBox.assignId();opndBox.addEffects();
			opndBox.dContainer.setStyle('cornerRadius','4');
			opndBox.dContainer.addEventListener(FocusEvent.FOCUS_IN,operandPersistFocus);
			opndBox.setBorder(4);
			opndBox.dContainer.height=40;opndBox.dContainer.width=40;//initializeBox(10,10);
			opndBox.setHorizontalAlign();opndBox.setVerticalAlign();
			//Alert.show('height is'+opndBox.dContainer.height.toString());
		}
		public function initOperand(opr:String):void
		{
			//Add the event listeners
			addEvents();
			var lblText:Label=drawLabel(opr);
			opndBox.dContainer.addChild(lblText);
			afterLabel.visible=false;beforeLabel.visible=false;
			containerHbox.dContainer.setStyle('verticalAlign','middle');
			containerHbox.dContainer.setStyle('horizontalGap','2');
			containerHbox.dContainer.addChild(beforeLabel);
			containerHbox.dContainer.addChild(opndBox.dContainer);
			containerHbox.dContainer.addChild(afterLabel);
			
			indexVal= oprand_Obj.operandsC[1].indexOf(opr);
			//GlobalData.addNodetoTable('mi',0,opndBox.countid,GlobalData._currentContainer.countid,new Operands().operandsC[2][indexVal]);
		}
			
		public function addEvents():void{
			beforeLabel.addEventListener(MouseEvent.CLICK,settingfocus);
			afterLabel.addEventListener(MouseEvent.CLICK,settingfocus);
			beforeLabel.addEventListener(MouseEvent.MOUSE_OVER,highlightMarker);
			afterLabel.addEventListener(MouseEvent.MOUSE_OVER,highlightMarker);
			beforeLabel.addEventListener(MouseEvent.MOUSE_OUT,reverselightMarker);
			afterLabel.addEventListener(MouseEvent.MOUSE_OUT,reverselightMarker);
			//beforeLabel.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,resettingfocus);
			afterLabel.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,resettingfocus);
			containerHbox.dContainer.addEventListener(MouseEvent.MOUSE_OVER,visibleCursor);
			containerHbox.dContainer.addEventListener(MouseEvent.MOUSE_OUT,invisibleCusor);
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
			lblText.truncateToFit=true;
			lblText.text=opr;
			lblText.toolTip=lblText.text;
			lblText.setStyle('fontFamily','myStixFont');
			lblText.setStyle('fontSize',GlobalData.getFont());
			lblText.setStyle('textAlign','center')
			lblText.addEventListener(ToolTipEvent.TOOL_TIP_SHOWN,showToolTip);
			lblText.addEventListener(MouseEvent.CLICK,editLabel);
			//lblText.addEventListener(FocusEvent.FOCUS_IN,editLabel);
			//lblText.addEventListener(FocusEvent.FOCUS_OUT,operandLostFocus)
			return lblText;
		}
		public function editLabel(event:MouseEvent):void{
			opndBox.setBorder();opndBox.dContainer.setFocus();opndBox.dContainer.drawFocus(true);
			GlobalData.currentOperandBox=this;//opndBox;
			EquationEditor.operandFlag=false;
			Alert.show('curretn container'+GlobalData._currentContainer.countid);
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
			selectLbl.setFocus();
			selectLbl.drawFocus(true);
			/* Alert.show('this parent'+this.parent.dContainer.toString());
			Alert.show('this container'+this.containerHbox.dContainer.toString());
			Alert.show('index '+this.parent.dContainer.getChildIndex(this.containerHbox.dContainer).toString());
			 */
			EquationEditor.currentIndex=this.parent.dContainer.getChildIndex(this.containerHbox.dContainer);
			//Alert.show(EquationEditor.currentIndex.toString());
			GlobalData._currentContainer=this.parent;
			//Alert.show(GlobalData._currentContainer.countid.toString());
			EquationEditor.operandFlag=false;
			if(event.target.name=='after')
			{
				 EquationEditor.afterFlag=true;
				 EquationEditor.beforeFlag=false;
				 Application.application.infoPanel.mess=new InfoMessageService().sendAfterOperatorMessage();
				 Application.application.infoPanel.addMessage();
			 }
			if(event.target.name=='before')
			{ 
				EquationEditor.afterFlag=false;
				EquationEditor.beforeFlag=true;
				Application.application.infoPanel.mess=new InfoMessageService().sendBeforeOperatorMessage();
				Application.application.infoPanel.addMessage();
			}
			EquationEditor.operandFlag=true;
		}
		public function resettingfocus(event:FocusEvent):void{
			//Alert.show('check13234');
			//Application.application.testArea.text=event.relatedObject.toString();
			
			//EquationEditor.afterFlag=true;
			//EquationEditor.beforeFlag=true;
		}
		public function operandPersistFocus(event:FocusEvent):void{
		//Application.application.testArea.text='lost focus';
		EquationEditor.operandFlag=false;
		}
		public function highlightMarker(event:MouseEvent):void{
			var marker:HBox=HBox(event.target);
			marker.setStyle('backgroundColor','#00DDDE');
		}
		public function reverselightMarker(event:MouseEvent):void{
			var marker:HBox=HBox(event.target);
			marker.setStyle('backgroundColor','#000000');
		}
	}
}