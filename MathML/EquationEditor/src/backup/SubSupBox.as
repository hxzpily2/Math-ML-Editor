package containers
{
	import mx.controls.Label;
	
	public class SubSupBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var base:DisplayContainer=new DisplayContainer();
		public var exp:DisplayContainer=new DisplayContainer();
		public var top:DisplayContainer=new DisplayContainer();
		public var middle:DisplayContainer=new DisplayContainer();
		public var bottom:DisplayContainer=new DisplayContainer();
	    var gb:GlobalData=new GlobalData();
		public function SubSupBox(gb1:GlobalData)
		{
			gb=gb1;
			parent.initHBox();parent.addEffects(gb);
			parent.countid=gb.countId+1;gb.countId=gb.countId+1;
			parent.dContainer.setStyle('horizontalAlign','right');
			parent.dContainer.setStyle('verticalAlign','middle');
			base.initHBox();base.addEffects(gb);
			base.countid=gb.countId+1;gb.countId=gb.countId+1;
			base.dContainer.setStyle('horizontalAlign','right');
			base.dContainer.setStyle('verticalAlign','middle');
			exp.initVBox();base.addEffects(gb);
			exp.dContainer.setStyle('verticalAlign','top');
			top.initHBox();
			middle.initHBox();
			bottom.initHBox();
		}
		public function drawSuperScript():SubSupBox{
			base.dContainer.addChild(getLabel());
			top.dContainer.addChild(getLabel());
			top.addEffects(gb);
			top.countid=gb.countId+1;gb.countId=gb.countId+1;
			this.addBaseExp();
			this.middle.dContainer.visible=false;
			return this;
		}
		public function addBaseExp():void{
			this.parent.setChildContainer(base);
			this.exp.setChildContainer(top);
			this.exp.setChildContainer(middle);
			this.exp.setChildContainer(bottom);
			this.parent.setChildContainer(exp);
		}
		public function drawSubScript():void{
			bottom.addEffects(gb);
			this.top.dContainer.visible=false;
		}
		public function getLabel():Label{
			var my_label:Label=new Label();
			my_label.name='buffer';
			my_label.x=0;my_label.y=0;
			my_label.text='text';
			return  my_label;
		}

	}
}