package containers
{
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	
	import mx.core.Application;	
	public class MathXmlGenerator
	{
	    public var nodearray:Array=new Array();
		public var mathml:XMLDocument=new XMLDocument();
		public function MathXmlGenerator()
		{
		}
		public function writeXML():void
		{
			mathml=new XMLDocument();
		   var parent:MathNode=searchNodeArray('nodeparent',0).pop();
		   var nodeT:XMLNode=getchildXML(parent);
		   var mathtag:XMLNode=new XMLNode(XMLNodeType.ELEMENT_NODE,'math');
		   mathtag.attributes.xmlns='http://www.w3.org/1998/Math/MathML';
		   mathtag.appendChild(nodeT);
		   mathml.appendChild(mathtag);
		   trimMrowNodes(mathml);	
		}
		public function getchildXML(nodeP:MathNode):XMLNode
		{
			var nodeY:XMLNode=toXML(nodeP);			
			var searchResults:Array=searchNodeArray('nodeparent',nodeP.nodeid);
			for each(var t:MathNode in searchResults)
			{
				nodeY.appendChild(getchildXML(t));
			}			 
			return  nodeY;
		}
		public function toXML(nodeM:MathNode):XMLNode
		{
			var nodeT:XMLNode;
			if ((nodeM.nodetype!='mo') && (nodeM.nodetype!='mi') && (nodeM.nodetype!='mn'))
			 {
			 nodeT=new XMLNode(XMLNodeType.ELEMENT_NODE,nodeM.nodetype);	
			 if(nodeM.attribute.length!=0)
				{
				var i:int=0;
			    nodeT.attributes.open=nodeM.attribute[0].value;
			    nodeT.attributes.close=nodeM.attribute[1].value;
		     	}
			 }
			 else
			 {
			 	var nodeText:XMLNode=new XMLNode(XMLNodeType.TEXT_NODE,nodeM.nodetext);
			 	nodeT=new XMLNode(XMLNodeType.ELEMENT_NODE,nodeM.nodetype);
			 	
			 	nodeT.appendChild(nodeText);	
			 }	
			 return nodeT;
		}
		public function searchNodeArray(searchCategory:String,searchValue:Number):Array
		{
			var searchResults:Array=new Array();
			if(searchCategory=='nodeparent')
			{
				for each(var t:MathNode in nodearray)
				{
					if(t.nodeparent==searchValue)
					   searchResults.push(t);
				}
			}
			if(searchCategory=='nodeid')
			{
				for each(t in nodearray)
				{
					if(t.nodeid==searchValue)
					   searchResults.push(t);
				}
			}
		  searchResults.sortOn("nodeposition",Array.NUMERIC);
		  	return searchResults;
		}
		public function trimMrowNodes(xmldoc:XMLDocument):void
		{
			var mrownodes:Array=xmldoc.childNodes;
			for each(var t:XMLNode in mrownodes)
			{
				if(t.nodeName=='mrow' && t.childNodes.length)
				     {
				if(t.childNodes.length==1)
					{
					//	var firstChild:XMLNode=t.firstChild.cloneNode(true);
				//		xmldoc.insertBefore(firstChild,t);
						
		//	Alert.show('the children is '+xmldoc.childNodes.length.toString());
						t.removeNode();
					}
				     }
			}
			Application.application.mathInput.text=new XML(xmldoc.toString()).toXMLString();
		//	Application.application.symbols_canvas.removeAllChildren();
			
		}
	}
}