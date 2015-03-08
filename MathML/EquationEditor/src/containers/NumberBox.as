package containers
{
	import components.Custom_Number;
	public class NumberBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
	
		public var current:DisplayContainer;
		public var index:uint;
		public function NumberBox(curr:DisplayContainer)
		{
			this.current=curr;
			parent.initHBox();parent.assignId();//parent.countid=gb.countId+1;gb.countId=gb.countId+1;
			parent.addEffects();
			parent.initializeParentBox();
			parent.dContainer.setStyle('horizontalGap','-5');
		}
		public   function drawNumber():NumberBox{
			index=getChildIndex();
			var custlblObj:Custom_Number=new Custom_Number(this.current,index);
			custlblObj.initNumber();
			custlblObj.drawNumBox();
			parent.dContainer=custlblObj.containerHBox.dContainer;
			return this;
		}
		public function setNumber(num:String):NumberBox{
			index=getChildIndex();
			var custlblObj:Custom_Number=new Custom_Number(this.current,index);
			custlblObj.initNumber();
			custlblObj.setNumBox(num);
			parent.dContainer=custlblObj.containerHBox.dContainer;
			return this;
		}
			public function getChildIndex():uint{
			return this.current.dContainer.getChildren().length;
		}
	}
}