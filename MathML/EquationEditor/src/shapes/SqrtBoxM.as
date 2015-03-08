package shapes
{
	import mx.controls.Alert;
		import containers.DisplayContainer;
	public class SqrtBoxM
	{ 
		public var baseBox:DisplayContainer=new DisplayContainer();
		public var sqrt:DisplayContainer=new DisplayContainer();
		public var lineBox:DisplayContainer=new DisplayContainer();
		public var parent:DisplayContainer=new DisplayContainer();
		public var itemBox:DisplayContainer=new DisplayContainer();
		
		public function SqrtBoxM()
		{
			parent.initHBox();//parent.setBorder();
			sqrt.initHBox();//sqrt.setBorder();
			baseBox.initVBox();
			baseBox.dContainer.setStyle('verticalAlign','middle');
			//baseBox.setBorder();
			lineBox.initHBox();
			itemBox.initHBox();//itemBox.setBorder();
			//Alert.show('hieie');
		}
		public function setSquareRoot():DisplayContainer{
			parent.setChildContainer(sqrt);
			sqrt.dContainer.setStyle('horizontalAlign','left');
			parent.dContainer.setStyle('horizontalGap','19');
			baseBox.setChildContainer(lineBox);
			baseBox.dContainer.setStyle('verticalGap','3');
			baseBox.setChildContainer(itemBox);
			parent.setChildContainer(baseBox);
			return parent;
		}

	}
}