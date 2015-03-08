package com.messageservice
{
	import flash.xml.XMLNode;
	
	public class InfoMessageService
	{
		public var errorIcon:String="icons/Error.png";
		public var infoIcon:String="icons/Info.png";
		public var beforeIcon:String="icons/Forward.png";
		public var afterIcon:String="icons/Backward.png";
		public var saveIcon:String="icons/FileSave.png";
		public var editIcon:String="icons/Edit.png";
		public var warningIcon:String="icons/Warning.png";
		public var helpIcon:String="icons/Info.png";
		public var afterOperandMessage:String="Insert only an Operator after the operand";
		public var beforeOperandMessage:String="Insert only an Operator before the operand";
		public var OperandMessage:String="Insert an Operand.";
		public var Error:String="Action not permitted";
		
		public function InfoMessageService()
		{
		}
		public function sendAfterOperatorMessage():XML{
			var xmlMess1:XML=<info/>;
			xmlMess1.appendChild('<icon>'+afterIcon+'</icon>');
			xmlMess1.appendChild('<message>'+afterOperandMessage+'</message>');
			return xmlMess1;
		}
		public function sendBeforeOperatorMessage():XML{
			var xmlMess1:XML=<info/>;
			xmlMess1.appendChild('<icon>'+beforeIcon+'</icon>');
			xmlMess1.appendChild('<message>'+beforeOperandMessage+'</message>');
			return xmlMess1;
		}
		public function sendOperandMessage():XML{
			var xmlMess1:XML=<info/>;
			xmlMess1.appendChild('<icon>'+infoIcon+'</icon>');
			xmlMess1.appendChild('<message>'+OperandMessage+'</message>');
			return xmlMess1;
		}
		public function ErrorMessage():XML{
			var xmlMess1:XML=<info/>;
			xmlMess1.appendChild('<icon>'+errorIcon+'</icon>');
			xmlMess1.appendChild('<message>'+Error+'</message>');
			return xmlMess1;
		}
	}
}