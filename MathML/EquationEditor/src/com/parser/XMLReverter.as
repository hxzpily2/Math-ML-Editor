package com.parser
{
	import containers.GlobalData;
	import containers.MathNode;
	
	import mx.controls.Alert;
	
	public class XMLReverter
	{
		public var mathMl:XML;
		public var countId:int=1;
		public function XMLReverter()
		{
		}
		public function loadMathTable():void{
			GlobalData.setTable=new Array();
			//Add node for parent
			var mathP:MathNode=new MathNode();
			mathP.nodeid=1;mathP.nodeparent=0;mathP.nodetype=mathMl.localName();
			mathP.nodeposition=0;mathP.nodetext="";
			GlobalData.setTable[mathP.nodeid]=mathP;
			loadChildren(mathMl,1);
		}
		public function loadChildren(node:XML,par:int):void{
			
			var position:int=0
			if(node.nodeKind()!="text")
			{
			for each(var t:XML in node.children() )
			{
				if(t.nodeKind()=='element')
				{
				var mathN:MathNode=new MathNode();
				mathN.nodeid=++countId;mathN.nodeparent=par;mathN.nodeposition=position++;
				mathN.nodetype=t.localName();
				if(!((mathN.nodetype!='mo') && (mathN.nodetype!='mi') && (mathN.nodetype!='mn')))
				{
					mathN.nodetext=t.text();
				}
				GlobalData.setTable[mathN.nodeid]=mathN;
				loadChildren(t,mathN.nodeid);
				}
			} 
			}
		}

	}
}