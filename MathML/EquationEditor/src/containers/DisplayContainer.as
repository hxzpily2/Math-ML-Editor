package containers
{
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import mx.containers.Canvas;
	import mx.containers.Grid;
	import mx.containers.GridItem;
	import mx.containers.GridRow;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.core.Container;
	import mx.managers.FocusManager;
	public class DisplayContainer
	{
		
		public var dContainer:Container=new Container();
		public var clickCounter:int=0;
		public var glob:GlobalData;
		public var countid:int=0;
		public var fontSizeC:int=0;
		public var minMode:Boolean;
		public function DisplayContainer()
		{
			this.dContainer.name=this.countid.toString();
		}		
		public function initHBox():void{
			this.dContainer=new HBox();
		//	this.dContainer.addEventListener(
			this.dContainer.setStyle('horizontalGap','0');
			this.dContainer.setStyle('horizontalAlign','center');
			this.dContainer.horizontalScrollPolicy='off';
			this.dContainer.verticalScrollPolicy='off';
			
		}
		public function initVBox():void{
			this.dContainer=new VBox();
			this.dContainer.horizontalScrollPolicy='off';
			this.dContainer.verticalScrollPolicy='off';
		}
		public function initCanvas():void{
			this.dContainer=new Canvas();
		}
		public function initGrid():void{
			this.dContainer=new Grid();
		}
		public function initGridRow():void{
			this.dContainer=new GridRow();
		}
		public function initGridItem():void{
			this.dContainer=new GridItem();
		}
		public function setChildContainer(childContainer:DisplayContainer):void{
//			this.removeBorder();
			this.dContainer.addChild(childContainer.dContainer);
		}
		public function setChildContainerAt(childContainer:DisplayContainer,index:uint):void{
//			this.removeBorder();
			this.dContainer.addChildAt(childContainer.dContainer,index);
		}
		public function addEffects():void{
		//this.glob=gb;
		this.dContainer.addEventListener(MouseEvent.CLICK,setEffect);
		this.dContainer.addEventListener(MouseEvent.ROLL_OVER,displayT);
		}
		public function assignId():void
		{
			GlobalData._counterId++;
			this.countid=GlobalData._counterId;
			this.dContainer.name=this.countid.toString();
		}
		public function addtoTable(nodetype:String,nodeposition:uint,nodeparent:Number=-1):void
		{
			if(nodeparent==-1)
			GlobalData.addNodetoTable(nodetype,nodeposition,this.countid);
			else
			GlobalData.addNodetoTable(nodetype,nodeposition,this.countid,nodeparent); 	
		}
		public function displayT(event:MouseEvent):void{
		this.dContainer.toolTip=countid.toString();
		}
		public function removeChildLabelListeners():void
		{
			var childs:Array=this.dContainer.getChildren();
		
			for each(var t:Object in childs)
			{
				if(t.name=='buffer')
				      {				      
				      t.removeEventListener(MouseEvent.CLICK,setEffect);
				      }
			}
		}
		
		public function setEffect(event:MouseEvent):void{
			//Alert.show('clicked!!!');
	//	Alert.show('targer '+event.target.toString(),'current target '+event.currentTarget.toString());
		
		/* if(event.target.toString()==event.currentTarget.toString())
	     {
	     if(clickCounter%2==0)
		  {
			dContainer.setStyle('borderColor','#000000');
			dContainer.setStyle('borderThickness','2');
			dContainer.setStyle('borderStyle','solid');
			this.glob.count=this;
		 }
		  else
		  {
		  	dContainer.setStyle('borderColor','#FFFFFF');
			dContainer.setStyle('borderThickness','2');
			dContainer.setStyle('borderStyle','solid');
		  }
		   if(event.type.toString()=='click')
		  {		 
			clickCounter++;
		  } 
	     }
	    
	     else
	     {
	     	event.currentTarget.setStyle('borderColor','#FFFFFF');
			event.currentTarget.setStyle('borderThickness','2');
			event.currentTarget.setStyle('borderStyle','solid');
	     }		 */
	     if(event.target==event.currentTarget)
			{	
			event.target.setFocus()			
			event.target.drawFocus(true)
			
			GlobalData._currentContainer=this;
			GlobalData.resetOperatorFlag();
			}
			//reset the before and after flags to accept both operands
			//BP 		21 Oct
			//
		}	
		public function removeParentEffects(par:Object):void{			
			par.parent.setStyle('borderColor','#FFFFFF');
			par.parent.setStyle('borderThickness','2');
			par.parent.setStyle('borderStyle','solid');
		}
		public function removeEffect():void{
			dContainer.setStyle('borderColor','#FFFFFF');
			dContainer.setStyle('borderThickness','2');
			dContainer.setStyle('borderStyle','solid');
		}	
		public function changeParentEffect():void{
			var childs:Array=this.dContainer.getChildren();
			for each(var c:Container in childs)
			{				
				if(c.getStyle('borderColor').toString()=='#0EEDF5')
				{
				//	Alert.show('effect is set');
				}
			}
		}		
		public function styleChanged(pt:Point):void
		 {
		 	//Alert.show('style changed called');
		 	//var par:DisplayObjectContainer=this.dContainer.parent;
		 	//this.dContainer.setFocus();
		 	//this.dContainer.drawFocus(true);
			//Alert.show('nestlevel'+this.dContainer.drawFocus(true).toString());
		 }
		 public function checkChildExists():void{
		 	var childs:Array=this.dContainer.getChildren();
		 	for each(var c:DisplayObject in childs)
		 	{
		  	if(c.name.toString()=='buffer')
		 	  {
				   this.dContainer.removeChild(c);		 	  	
		 	     
		 	  }
		 	}
		 }
		 public function initializeBox(minH:int=50,minW:int=50):void
		 {
		 	//Alert.show('the minmode is set'+GlobalData.minMode);
		 	if(minH==50 && GlobalData.minMode)
		 		{
		 			minH=30;
		 			minW=30;
		 		}
		 	//Alert.show(minH.toString());
		 	this.dContainer.minHeight=minH;
		 	this.dContainer.minWidth=minW;
		 }
		 public function initializeParentBox():void
		 {
		 	this.dContainer.setStyle('backgroundColor','#FFFFFF');
		 }
		 public function setBorder(thick:Number=2):void
		 {
		 	this.dContainer.setStyle('borderColor','#dad8d8');
			this.dContainer.setStyle('borderThickness','2');
			this.dContainer.setStyle('borderStyle','solid');
		 }
	/* 	 public function removeBorder():void
		 {
		 	this.dContainer.setStyle('borderColor','#ffffff');
			this.dContainer.setStyle('borderThickness','0');
			this.dContainer.setStyle('borderStyle','none');
		 } */
		 public function decreaseFontSize():void
		 {
		 	this.dContainer.setStyle('fontSize','10');
		 }
		 public function setFontSize():void
		 {
		 	this.dContainer.setStyle('fontSize','50');
		 }
		public function setKeyBoardvalue(event:KeyboardEvent):void
		{
			
			if(event.target==event.currentTarget)
			{
				var hbox:HBox=HBox(event.target)
			var string:String=String.fromCharCode(event.charCode)
			
			 if(event.charCode==Keyboard.SHIFT||string>='a'&&string<='z'||string>='A'&&string<='Z'||string>='0'&&string<='9')
			{
				var label1:Label=new Label();
				label1.text=string
				label1.setStyle('fontSize',GlobalData.fontSizeO);
				label1.setStyle('textAlign','center')
				hbox.addChild(label1)
			}
			}
		}
		public function setHorizontalAlign():void
		{
			this.dContainer.setStyle('horizontalAlign','center');
		}
		public function setVerticalAlign():void
		{
			this.dContainer.setStyle('verticalAlign','middle');
		}
	}
}