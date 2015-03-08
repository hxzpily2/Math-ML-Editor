package containers
{
	import mx.controls.Label;
	import mx.events.ResizeEvent;
	
	public class SubSupCanvas
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var sup:DisplayContainer=new DisplayContainer();
		public var base:DisplayContainer=new DisplayContainer();
		public var hidBase:DisplayContainer=new DisplayContainer();
		public var exp:DisplayContainer=new DisplayContainer();
		public function SubSupCanvas()
		{
			parent.initHBox();
			parent.dContainer.setStyle('horizontalAlign','right');
			parent.dContainer.setStyle('verticalAlign','middle');
			parent.dContainer.setStyle('horizontalGap','-20');
			parent.assignId();
			sup.initVBox();sup.dContainer.setStyle('verticalAlign','top');
			sup.dContainer.setStyle('verticalGap','-20');
			hidBase.initHBox();
			base.initHBox();
			exp.initHBox();
			setIdentifier();
			handleSizeChange();
			}
		public function setIdentifier():void
		{
			base.assignId();
			base.addtoTable('mrow',parent.countid);
			exp.assignId();
			exp.addtoTable('mrow',parent.countid);
			base.addEffects();
			exp.addEffects();
		}
		public function handleSizeChange():void
		{
			base.dContainer.addEventListener(ResizeEvent.RESIZE,baseExpanded);
	
		}
		public function baseExpanded(event:ResizeEvent):void
		{
		
		}
		public function drawSuperScript():SubSupCanvas
		{
		//	base.dContainer.addChild(getLabel('base'));
		GlobalData.addNodetoTable('msup',parent.countid,GlobalData._currentContainer.countid);
			
			base.initializeBox();//base.setBorder();
			hidBase.dContainer.addChild(getLabel('*&'));
		//	exp.dContainer.addChild(getLabel('exp'));
			exp.initializeBox();//exp.setBorder();
			sup.setChildContainer(exp);
			sup.setChildContainer(hidBase);
			hidBase.dContainer.visible=false;
			parent.initializeParentBox();
			parent.setChildContainer(base);
			parent.setChildContainer(sup);
			return this;
		}
		public function drawSubScript():SubSupCanvas
		{
			GlobalData.addNodetoTable('msub',parent.countid,GlobalData._currentContainer.countid);
			
			base.initializeBox();
			hidBase.dContainer.addChild(getLabel('&*'));
			exp.initializeBox();
			sup.setChildContainer(hidBase);
			sup.setChildContainer(exp);			
			hidBase.dContainer.visible=false;
			parent.initializeParentBox();
			parent.setChildContainer(base);
			parent.setChildContainer(sup);
			return this;
		}
		public function getLabel(str:String):Label
		{
			var my_label:Label=new Label();
			my_label.x=0;
			my_label.y=0;
			my_label.text=str;
			my_label.minHeight=50;my_label.minWidth=50;
			my_label.setStyle('fontSize','15');
			my_label.name='buffer';
			return my_label;
		}	
	}
}