package
{
	import flash.events.Event;

	public class EQEvent extends Event
	{
		public var payload: Object;
		
		public function EQEvent(type:String, local_payload: Object = null, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			//TODO: implement function
			super(type, bubbles, cancelable);
			
			payload = local_payload;		
		}
		
	}
}