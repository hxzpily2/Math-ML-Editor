package shapes
{
	import mx.messaging.AbstractConsumer;
		import containers.DisplayContainer;
	public class SuperSubBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var base:DisplayContainer=new DisplayContainer();
		public var exp:DisplayContainer=new DisplayContainer();
		public var top:DisplayContainer=new DisplayContainer();
		public var middle:DisplayContainer=new DisplayContainer();
		public var bottom:DisplayContainer=new DisplayContainer();
		public function SuperSubBox()
		{
			parent.initHBox();
			parent.dContainer.setStyle('horizontalAlign','right');
			parent.dContainer.setStyle('verticalAlign','middle');
			base.initHBox();
			base.dContainer.setStyle('horizontalAlign','right');
			base.dContainer.setStyle('verticalAlign','middle');
			exp.initVBox();
			exp.dContainer.setStyle('verticalAlign','top');
			top.initHBox();
			middle.initHBox();
			bottom.initHBox();
		}
		public function setParent():void{
			this.exp.setChildContainer(this.top);
			this.exp.setChildContainer(this.middle);
			this.middle.dContainer.visible=true;
			//this.exp.setChildContainer(this.bottom);
			this.exp.dContainer.setStyle('verticalGap','-5');
			this.parent.setChildContainer(this.base);
			this.parent.setChildContainer(this.exp);
			this.parent.dContainer.setStyle('horizontalGap','-5');
		}
		public function setSuperScript():void{
			this.middle.dContainer.visible=false;
		}
		public function setSubScript():void{
			this.top.dContainer.visible=false;
		}
		
	}
}