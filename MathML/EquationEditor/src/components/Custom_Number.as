package components
{
	import com.messageservice.InfoMessageService;
	
	import containers.DisplayContainer;
	import containers.GlobalData;
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.containers.HBox;
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.controls.TextInput;
	import mx.core.Application;
	public class Custom_Number
	{
	public	var containerHBox:DisplayContainer=new DisplayContainer();
	public	var before:DisplayContainer=new DisplayContainer();
	public	var after:DisplayContainer=new DisplayContainer();
	public var parent:DisplayContainer=new DisplayContainer();
	public var ind:uint=5;
		public function Custom_Number(par:DisplayContainer,index:uint)
		{
			this.parent=par;
			this.ind=index;
			containerHBox.initHBox();containerHBox.assignId();
			before.initHBox();before.dContainer.name='before';
			after.initHBox();after.dContainer.name='after';
			before.dContainer.minHeight=GlobalData.getFont()+5;after.dContainer.minHeight=GlobalData.getFont()+5;
			before.dContainer.width=4;after.dContainer.width=4;
			after.dContainer.setStyle('backgroundColor','#000000');
			before.dContainer.setStyle('backgroundColor','#000000');
		}
		public function initNumber():void
		{
			after.dContainer.visible=false;before.dContainer.visible=false;
			before.dContainer.addEventListener(MouseEvent.CLICK,settingfocus);
			after.dContainer.addEventListener(MouseEvent.CLICK,settingfocus);
			before.dContainer.addEventListener(FocusEvent.FOCUS_OUT,loseFocus);
			after.dContainer.addEventListener(FocusEvent.FOCUS_OUT,loseFocus);
			containerHBox.dContainer.addEventListener(MouseEvent.MOUSE_OVER,visibleCursor);
			containerHBox.dContainer.addEventListener(MouseEvent.MOUSE_OUT,invisibleCusor);
			containerHBox.setChildContainer(before);
			
			containerHBox.setChildContainer(after);
		}		
		public function drawNumBox():void{
			var uiT:TextInput=new TextInput();
			uiT.width=23;
			uiT.setStyle('fontSize',GlobalData.getFont());
			uiT.restrict='0-9';
			uiT.addEventListener(KeyboardEvent.KEY_DOWN,checkEnterPressed);
			uiT.addEventListener(FocusEvent.FOCUS_OUT,checkEnterPressed);
			containerHBox.dContainer.addChildAt(uiT,1);
			//valid.source=uiT;
		}
		public function setNumBox(num:String):void{
			var uiT:Label=new Label();
			uiT.text=num;
			uiT.width=uiT.textWidth;
			uiT.setStyle('fontSize',GlobalData.getFont());
			//uiT.restrict='0-9';
			uiT.addEventListener(MouseEvent.CLICK,showTextInput);
			containerHBox.dContainer.addChildAt(uiT,1);
			containerHBox.dContainer.validateNow();
			GlobalData.addNodetoTable('mn',0,containerHBox.countid,this.parent.countid,uiT.text);

		}
		public function checkEnterPressed(event:Event):void{
			var tI:TextInput=TextInput(event.target.parent);
			var uiT:Label=new Label();
			
		if(event.type.toString()==KeyboardEvent.KEY_DOWN.toString())
		  {
		  	var evt:KeyboardEvent=KeyboardEvent(event);
		   	if(evt.keyCode==Keyboard.BACKSPACE)
		   	tI.width-=15;
		   	if(evt.keyCode>=48  && evt.keyCode<=57)
		   	tI.width+=15;
		   	if(evt.keyCode==Keyboard.ENTER)
		    {
		   	uiT.text=event.target.parent.text;
		 	uiT.setStyle('fontSize',GlobalData.getFont());
			uiT.addEventListener(MouseEvent.CLICK,showTextInput);
			containerHBox.dContainer.removeChild(tI);
			containerHBox.dContainer.addChildAt(uiT,1);
		    }
		 }
		 if(event.type==FocusEvent.FOCUS_OUT)
		   {
		   	uiT.setStyle('fontSize',GlobalData.getFont());
			uiT.addEventListener(MouseEvent.CLICK,showTextInput);
		   	uiT.text=event.target.parent.text;
			containerHBox.dContainer.removeChild(tI);
			containerHBox.dContainer.addChildAt(uiT,1);
		   }  
		   GlobalData.addNodetoTable('mn',0,containerHBox.countid,this.parent.countid,uiT.text);
	}
		public function showTextInput(event:MouseEvent):void{
				var uiT:Label=Label(event.target.parent);
				var tI:TextInput=new TextInput();
				tI.text=uiT.text;
				tI.setStyle('fontSize',GlobalData.getFont());
				tI.restrict='0-9';
				tI.addEventListener(KeyboardEvent.KEY_DOWN,checkEnterPressed);
			  	tI.addEventListener(FocusEvent.FOCUS_OUT,checkEnterPressed);
			  	containerHBox.dContainer.removeChild(uiT);
			  	containerHBox.dContainer.addChildAt(tI,1);
				containerHBox.dContainer.validateNow();
				tI.width=tI.textWidth+15;
			}
		public function visibleCursor(event:MouseEvent):void
		{
			before.dContainer.visible=true;
			after.dContainer.visible=true;
		}
		public function invisibleCusor(event:MouseEvent):void
		{
			before.dContainer.visible=false;
			after.dContainer.visible=false;
		}
		/* public function drawLabel(opr:String):Label
		{
			var lblText:Label=new Label();
//			lblText.minHeight=40;
			lblText.truncateToFit=true;
			lblText.text=opr;
			lblText.toolTip=lblText.text;
			lblText.setStyle('fontFamily','myStixFont');
			lblText.setStyle('fontSize',GlobalData.fontSizeO);
		//	lblText.width=20;
			lblText.setStyle('textAlign','center')
			lblText.addEventListener(ToolTipEvent.TOOL_TIP_SHOWN,showToolTip);
//			lblText.addEventListener(MouseEvent.CLICK,setLabelFocus)
			return lblText;
		}
		public function showToolTip(event:ToolTipEvent):void
		{
			var tool:ToolTip=ToolTip(event.toolTip);
			tool.minHeight=50
			tool.minWidth=50
			tool.setStyle('fontSize',40);
			tool.setStyle('textAlign','center');				 
		} */
		public function settingfocus(event:MouseEvent):void
		{
			var selectLbl:HBox=HBox( event.currentTarget );
			selectLbl.setFocus();
			selectLbl.drawFocus(true);
			EquationEditor.currentIndex=this.parent.dContainer.getChildIndex(this.containerHBox.dContainer);
			GlobalData._currentContainer=this.parent;
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
		public function loseFocus(event:FocusEvent):void{
			
		}
	}
}