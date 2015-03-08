package containers
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.containers.HBox;
	import mx.controls.Label;
	import mx.events.ResizeEvent;	
	public class FractionBox  extends DisplayContainer
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var numBox:DisplayContainer=new DisplayContainer();
		public var denBox:DisplayContainer=new DisplayContainer();
		public var median:DisplayContainer=new DisplayContainer();
		public function FractionBox():void{
			parent.initVBox();					
			parent.assignId();
			parent.addtoTable('mfrac',0,GlobalData._currentContainer.countid);
			numBox.initHBox();numBox.assignId();numBox.addEffects();numBox.addtoTable('mrow',0,parent.countid);numBox.setBorder()
			GlobalData.identityArray[GlobalData.index]=(numBox.countid)
			GlobalData.index++;				
			median.initHBox();median.assignId();				
			denBox.initHBox();denBox.assignId();denBox.addEffects();denBox.addtoTable('mrow',1,parent.countid);
			GlobalData.identityArray[GlobalData.index]=(denBox.countid)
			GlobalData.index++;					
			initialize();	denBox.setBorder()	
			numBox.setHorizontalAlign();numBox.setVerticalAlign();
			denBox.setHorizontalAlign();denBox.setVerticalAlign();
			addEvents();
		}
		public function addEvents():void{
			numBox.dContainer.addEventListener(ResizeEvent.RESIZE,sizeChanged);
			denBox.dContainer.addEventListener(ResizeEvent.RESIZE,sizeChanged);
		}
		public function addChild1():void{
		this.parent.setChildContainer(numBox);
		drawMedian();
		this.parent.setChildContainer(median);
		this.parent.setChildContainer(denBox);
		}
		public function Display():FractionBox{
			this.addChild1();
			return this;
		}
		public function initialize():void{
			numBox.initializeBox();
			denBox.initializeBox();
			parent.initializeParentBox();
				}
		
		
		public function sizeChanged(event:ResizeEvent):void
		{
			median.dContainer.width=Math.max(numBox.dContainer.width,denBox.dContainer.width);
			parent.dContainer.setStyle('verticalAlign','middle');
			parent.dContainer.setStyle('horizontalAlign','center');
		}
		public function getLabel():Label{
			var my_label:Label=new Label();
			my_label.name='buffer';
			my_label.x=0;my_label.y=0;
			my_label.text='text';
			return  my_label;
		}
		public function drawMedian():void
		{
			this.median.dContainer.setStyle('backgroundColor','#000000');
			this.median.dContainer.minHeight=2;
			this.median.dContainer.minWidth=30;
			//Alert.show(Math.max(this.numBox.dContainer.width,this.denBox.dContainer.width).toString());
		
		}		
	}
}