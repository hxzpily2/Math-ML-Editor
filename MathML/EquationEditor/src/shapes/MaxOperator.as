package shapes
{
		import containers.DisplayContainer;
	public class MaxOperator
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var opr:DisplayContainer=new DisplayContainer();
		public var child:DisplayContainer=new DisplayContainer();
		public function MaxOperator()
		{
			parent.initHBox();
			parent.dContainer.setStyle('horizontalAlign','center');
			parent.dContainer.setStyle('verticalAlign','middle');
			opr.initHBox();
			child.initHBox();
		}
		public function setOperator():DisplayContainer
		{
			this.parent.setChildContainer(opr);
	//		this.parent.setChildContainer(child);
			return this.parent;
		}
	}
}