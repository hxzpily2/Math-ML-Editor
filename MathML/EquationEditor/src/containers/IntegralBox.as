package containers
{
	import components.Operands;
	
	import mx.controls.Alert;
	import mx.events.ResizeEvent;
	
	public class IntegralBox
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var integralSymbol:DisplayContainer=new DisplayContainer();
		public var baseBox:DisplayContainer=new DisplayContainer();
		public var integral_operator:String;

		public function IntegralBox(opr:String)
		{
			this.integral_operator=opr;
			parent.initHBox();parent.dContainer.setStyle('verticalAlign','top');
			parent.dContainer.setStyle('horizontalGap','-13');
			integralSymbol.initHBox();
			integralSymbol.addEffects();
			integralSymbol.assignId();
			var indexVal:Number;
			var oprand_Obj:Operands=new Operands();
			indexVal= oprand_Obj.integralTypes[1].indexOf(opr);
			//Alert.show(integralSymbol.countid+" id "+GlobalData._currentContainer.countid);
			GlobalData.addNodetoTable('mo',0,integralSymbol.countid,GlobalData._currentContainer.countid,"&"+new Operands().integralTypes[2][indexVal]+";");
			baseBox.initHBox();baseBox.initializeBox();baseBox.setBorder();baseBox.addEffects();
			
			baseBox.assignId();baseBox.setHorizontalAlign();baseBox.setVerticalAlign();
			GlobalData.identityArray[GlobalData.index]=(baseBox.countid)
			GlobalData.index++;
			
			GlobalData.addNodetoTable('mrow',1,baseBox.countid,GlobalData._currentContainer.countid);
			baseBox.dContainer.addEventListener(ResizeEvent.RESIZE,baseSizeChanged);
		}
	
		public function displaySymbol():void
		{
			var bitMap_hgt:Number=baseBox.dContainer.height;
			bitMap_hgt=bitMap_hgt+(bitMap_hgt/4);
		    integralSymbol.dContainer.addChild(new BitmapHandler1().bitmapHandler(integral_operator,bitMap_hgt,50,165,200,false));
		    integralSymbol.dContainer.width=50;
		    parent.setChildContainer(integralSymbol);
		    parent.setChildContainer(baseBox);
		   
		}
		
		public function baseSizeChanged(event:ResizeEvent):void
		{
			var bitMap_hgt:Number=baseBox.dContainer.height;
			bitMap_hgt=bitMap_hgt+(bitMap_hgt/4);
			integralSymbol.dContainer.removeAllChildren();
			integralSymbol.dContainer.addChild(new BitmapHandler1().bitmapHandler(integral_operator,bitMap_hgt,50,165,200,false));
		 }


	}
}