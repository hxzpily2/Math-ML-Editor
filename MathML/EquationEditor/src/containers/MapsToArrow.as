package containers
{
	import mx.containers.HBox;
	import mx.events.ResizeEvent;
	
	public class MapsToArrow
	{
		public var mapsTo:UnderOver
		public function MapsToArrow()
		{
			mapsTo=new UnderOver();
			mapsTo.setProperty();
	//		mapsTo.middle.removeBorder();
			
	//		mapsTo.middle.removeBorder();
			mapsTo.middle.dContainer.addChild(new BitmapHandler1().bitmapHandler('→',50));
		}
		
		public function expandArrow(event:ResizeEvent):void
		{
			var dContainer:HBox=HBox( event.target );
			var wdt:Number= dContainer.width;
			mapsTo.middle.dContainer.removeAllChildren();
			if(wdt>=50)
				mapsTo.middle.dContainer.width=wdt+wdt/4;
			else
				mapsTo.middle.dContainer.width=50;
			mapsTo.middle.dContainer.addChild(new BitmapHandler1().bitmapHandler('→',40,(wdt+wdt/4)));
			mapsTo.parent.dContainer.setStyle('verticalGap','-10');
		}
		
		public function setOverText():void
		{
			mapsTo.drawOver()
			mapsTo.top.dContainer.addEventListener(ResizeEvent.RESIZE,expandArrow);
		}
		
		public function setUnderText():void
		{
			mapsTo.drawUnder()
			mapsTo.bottom.dContainer.addEventListener(ResizeEvent.RESIZE,expandArrow);
		}
		
		public function setOverUnderText():void
		{
			mapsTo.drawOver()
			mapsTo.drawUnder()
			mapsTo.top.dContainer.addEventListener(ResizeEvent.RESIZE,expandArrow);
			mapsTo.bottom.dContainer.addEventListener(ResizeEvent.RESIZE,expandArrow);
		}

	}
}