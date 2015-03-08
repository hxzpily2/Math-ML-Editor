package components
{
	import flash.events.FocusEvent;
	
	import mx.containers.HBox;
	import mx.containers.TitleWindow;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	public class PopupPanel extends TitleWindow
	{
		public var myHbox:HBox;
		public function PopupPanel()
		{
			
		}
		public function createPop():void
		{
			myHbox=new HBox();
			this.minWidth=400;this.minHeight=400;
			this.showCloseButton=true;
			this.addEventListener(CloseEvent.CLOSE, closePopUpCloseEvent);
			this.title='Equation Title';
			this.addEventListener(FocusEvent.FOCUS_OUT,changeFocus);
			this.setStyle('horizontalAlign','center');
			this.setStyle('verticalAlign','middle');
		//	myCanvas.x=10;myCanvas.y=10;
			//myCanvas.width=380;myCanvas.height=200;
			myHbox.setStyle('horizontalAlign','center');
			myHbox.setStyle('verticalAlign','middle');
			this.addChild(myHbox);
		}
		private function closePopUpCloseEvent(evt:CloseEvent):void{
		PopUpManager.removePopUp(this);
	}
	public function changeFocus(event:FocusEvent):void{
		Alert.show('focus is changed');
	}

	}
}