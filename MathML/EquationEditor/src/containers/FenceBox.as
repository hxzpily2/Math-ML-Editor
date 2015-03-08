package containers
{	import mx.controls.Label;
	import mx.events.ResizeEvent;
	import mx.messaging.management.Attribute;
	public class FenceBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var left:DisplayContainer=new DisplayContainer();
		public var right:DisplayContainer=new DisplayContainer();
		public var child:DisplayContainer=new DisplayContainer();
		public var open:String;
		public var close:String;
		public function FenceBox()
		{
		left.initHBox();left.initializeBox(50,30);left.addEffects();
		child.initHBox();child.addEffects();child.assignId();
		right.initHBox();right.addEffects();
		parent.initHBox();
		child.assignId();
		}
		public function drawFenceT(o:String,c:String):void
		{
		    this.open=o;this.close=c;
			left.dContainer.addChild(new BitmapHandler1().bitmapHandler(open,50,35));
			right.dContainer.addChild(new BitmapHandler1().bitmapHandler(close,50,35,135,40,true,true));
			child.initializeBox();
			parent.setChildContainer(left);
			parent.setChildContainer(child);child.setBorder();
			GlobalData.identityArray[GlobalData.index]=(child.countid)
			GlobalData.index++;
			parent.setChildContainer(right);
			GlobalData.addNodetoTable('mfenced',0,child.countid,GlobalData._currentContainer.countid,'',getAttributes());
			child.dContainer.addEventListener(ResizeEvent.RESIZE,fenceSizeChanged);
		}
		public function drawLabel(opr:String):Label
		{
			var my_label:Label=new Label();
			my_label.x=0;my_label.y=0;
			my_label.text=opr;
			my_label.setStyle('fontSize','30');
			return my_label;	
		}
		public function fenceSizeChanged(event:ResizeEvent):void
		{
			left.dContainer.removeAllChildren();
			right.dContainer.removeAllChildren();
			left.initializeBox(50,30);
			var bitMap_hgt:Number=child.dContainer.height;
			bitMap_hgt=2*bitMap_hgt;//+(bitMap_hgt/2);
			left.dContainer.addChild(new BitmapHandler1().bitmapHandler(open,bitMap_hgt,35));
			right.dContainer.addChild(new BitmapHandler1().bitmapHandler(close,bitMap_hgt,35,135,40,true,true));
		}
		public function getAttributes():Array{
			var array:Array=new Array();
			var att1:Attribute=new Attribute();
			att1.name='open';att1.value=this.open;
			array.push(att1);
			var att2:Attribute=new Attribute();
			att2.name='close';att2.value=this.close;
			array.push(att2);
			return array;
		}
	}
}