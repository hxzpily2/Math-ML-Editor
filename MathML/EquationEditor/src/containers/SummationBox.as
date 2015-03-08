package containers
{
		import mx.events.ResizeEvent;
		
	public class SummationBox extends DisplayContainer
	{
		public var parent:DisplayContainer=new DisplayContainer();
		public var summationSymbol:DisplayContainer=new DisplayContainer();
		public var baseBox:DisplayContainer=new DisplayContainer();
		
		public function SummationBox()
		{
			parent.initHBox();parent.dContainer.setStyle('verticalAlign','top');
			parent.dContainer.setStyle('horizontalGap','-13');
			summationSymbol.initHBox();
			summationSymbol.addEffects();
			summationSymbol.assignId();
			GlobalData.addNodetoTable('mo',0,summationSymbol.countid,GlobalData._currentContainer.countid,"&sum;");
			baseBox.initHBox();baseBox.initializeBox();baseBox.setBorder();baseBox.addEffects();
			baseBox.assignId();
			GlobalData.identityArray[GlobalData.index]=(baseBox.countid)
			GlobalData.index++;			
			GlobalData.addNodetoTable('mrow',1,baseBox.countid,GlobalData._currentContainer.countid);
			baseBox.dContainer.addEventListener(ResizeEvent.RESIZE,baseSizeChanged);
		}
		
		public function displaySymbol():void{
			var bitMap_hgt:Number=baseBox.dContainer.height;
			bitMap_hgt=2*bitMap_hgt;//+(bitMap_hgt/2)+(bitMap_hgt/4);
		    summationSymbol.dContainer.addChild(new BitmapHandler1().bitmapHandler('Σ',bitMap_hgt,50,135,70));
		    summationSymbol.dContainer.width=50;
		    parent.setChildContainer(summationSymbol);
		    parent.setChildContainer(baseBox);		   
		}		
			public function baseSizeChanged(event:ResizeEvent):void{
			var bitMap_hgt:Number=baseBox.dContainer.height;
			bitMap_hgt=2*bitMap_hgt;//+(bitMap_hgt/2)+(bitMap_hgt/4);
			summationSymbol.dContainer.removeAllChildren();
			summationSymbol.dContainer.addChild(new BitmapHandler1().bitmapHandler('Σ',bitMap_hgt,50,135,70));
		 }

	}
}