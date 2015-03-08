package com.parser

{
	import components.Operands;
	
	import containers.DisplayContainer;
	import containers.FractionBox;
	import containers.GlobalData;
	import containers.NumberBox;
	import containers.OperandBox;
	import containers.SqrtBox;
	
	import mx.containers.Canvas;
	import mx.controls.Label;
	
	import shapes.FenceBox;
	import shapes.MaxOperator;
	import shapes.OverUnderBox;
	import shapes.RootBox;
	import shapes.SuperSubBox;	
	//import com.parser.BitmapHandler;
	public class XmlOperation3
	{
		public	var fontSize:uint=30;
		public 	var temp_canvas:Canvas;
		public var expandWidth:uint=0;
		public var bufferXml:XML=new XML("<mi>&*</mi>");
		public var skipNode:Boolean=false;
		public function XmlOperation3(tCanvas:Canvas)
		{
			temp_canvas=tCanvas;
			
		}
		 public function getChildIndexAt(xml_node:XML,index:uint):XML{
		 	var inde:uint=0;
		 	 for each (var d:XML in xml_node.children())
				 {
				 	inde++;
				 	if(inde==index)
				 	   {
				 	   	return d;
				 	   }				 	
				 }
				 return null;
		 }
	 public function loadNode(node:XML,drawObject:DisplayContainer):DisplayContainer{
		// currentParent=node;
		//GlobalData._currentContainer=drawObject;
		 	var name:String=node.localName();
		 	if(name=='math')
		  	{
		 		drawObject=loadNode(getChildIndexAt(node,1),drawObject);
		 	}
		 	if (name=='mrow')
		 	{		 		
		 		drawObject=loadMRow(node,drawObject);
			}
			if(name=='mi')
		 	{
		 		drawObject=loadMi(node,drawObject);
		 	}	
		 	if(name=='mo')
		 	{
		 		drawObject=loadMo(node,drawObject);
		 	}	 
		 	if(name=='mn')
		 	{
		 		drawObject=loadMn(node,drawObject);
		 	}	 
		 	if(name=='msup')
		 	{
		 		drawObject=loadMSup(node,drawObject);
		 	}
		 	if(name=='msub')
		 	{
		 		drawObject=loadMSub(node,drawObject);
		 	}
		 	if(name=='munder')
		 	{
		 		drawObject=loadMunder(node,drawObject);
		 	}
		 	if(name=='mover')
		 	{
		 		drawObject=loadMover(node,drawObject);
		 	}
		 	if(name=='mfrac')
		 	{
		 		drawObject=loadMFrac(node,drawObject);
		 	}
		 	if(name=='munderover')
		 	{
		 		drawObject=loadMunderover(node,drawObject);
		 	}
			if(name=='msqrt')
		 	{
		 		drawObject=loadSqrt1(node,drawObject);
		 	}
		 	if(name=='mfenced')
		 	{
		 		drawObject=loadMfence(node,drawObject);
		 	}
		 	if(name=='mtable')
		 	{
		 		drawObject=load_mTable(node,drawObject);
		 	}
		 	if(name=='mtr')
		 	{
		 		drawObject=load_mtRow(node,drawObject);
		 	}
		 	if(name=='mtd')
		 	{
		 		drawObject=load_mtd(node,drawObject);
		 	}
		 	if(name=='mroot')
		 	{
		 		drawObject=load_MRoot(node,drawObject);
		 	}
		 	return drawObject;
		 }
		 public function loadMRow(node:XML,drawObject:DisplayContainer):DisplayContainer{
			var rowContainer:DisplayContainer=new DisplayContainer();
		 	rowContainer.initHBox();
		 	rowContainer.dContainer.setStyle('horizontalGap','0');
		 	rowContainer.dContainer.setStyle('verticalAlign','middle');
			GlobalData.addNodetoTable('mrow',node.childIndex(),drawObject.countid,GlobalData._currentContainer.countid);
			for each (var childNode:XML in node.children())
		 		{
		 			//	if(childNode.nodeKind()=='element')
		 			//	{
		 					rowContainer.assignId();	rowContainer.setBorder();	 rowContainer.initHBox();	
		 					rowContainer.setHorizontalAlign();rowContainer.setVerticalAlign();
		 					GlobalData._currentContainer=drawObject;
		 					//Alert.show('current container '+GlobalData._currentContainer.countid+' child node'+node.localName());
		 					rowContainer=loadNode(childNode,rowContainer);
		 					drawObject.setChildContainer(rowContainer);
		 
		 			//	}
		 		}
		 		GlobalData._currentContainer=drawObject;
		/*	}
			else
				skipNode=false;
		 */	
		 	//drawObject.setChildContainer(rowContainer);
		 
		 	return drawObject;
		 }
		 
		public function loadSqrt1(node:XML,drawObject:DisplayContainer):DisplayContainer{
		  	/* var sqrtBox:SqrtBoxM=new SqrtBoxM();
		 	for each (var child_node:XML in node.children())
			{
				loadNode(child_node,sqrtBox.itemBox);
			}
			//Get the Width of the Exp with square root to draw the line over it
			var width:uint=getWidthContainer(sqrtBox.itemBox);
		 	var boxheight:uint=getHeightContainer(sqrtBox.itemBox);
		 	var bitmHand:BitmapHandler1=new BitmapHandler1();		 	
			var sqrtLbl:Label=bitmHand.drawRoot(boxheight,'√');
		 	sqrtBox.sqrt.dContainer.addChild(sqrtLbl);
			sqrtBox.lineBox=drawMedian(width,sqrtBox.lineBox);
			drawObject.setChildContainer(sqrtBox.setSquareRoot()); 
		 	return drawObject;  */
		 	var sqrtBox:SqrtBox=new SqrtBox();
		 	sqrtBox.addMathML();
		 	var rowContainer:DisplayContainer=new DisplayContainer();
		 	rowContainer.initHBox();
		 	sqrtBox.drawTopLine();
		 	for each (var child_node:XML in node.children())
			{
				GlobalData._currentContainer=sqrtBox.baseBox;
				rowContainer.assignId();
				loadNode(child_node,rowContainer);
				sqrtBox.baseBox.setChildContainer(rowContainer);
			}
			sqrtBox.drawSqrt();
			drawObject.setChildContainer(sqrtBox.parent)
			return drawObject;
		 }
		 public function load_MRoot(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 	var rBox:RootBox=new RootBox();
		 	decreaseFontSize();
		 	rBox.root=loadNode(getChildIndexAt(node,1),rBox.root);
		 	increaseFontSize();
		 	var nXml:XML=new XML('<msqrt></msqrt>');
		 	nXml.appendChild(getChildIndexAt(node,2));
		 	nXml.appendChild(getChildIndexAt(node,3));
		 	rBox.itemBox=loadNode(nXml,rBox.itemBox);
		 	drawObject.setChildContainer(rBox.setRoot());
		 	return drawObject;
		 }
		
		 public function loadMSup(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 	var supContainer:SuperSubBox=new SuperSubBox();
		 	supContainer.base=loadNode(getChildIndexAt(node,1),supContainer.base);
		 	decreaseFontSize();
		 	supContainer.top=loadNode(getChildIndexAt(node,2),supContainer.top);
		 	supContainer.middle=loadNode(bufferXml,supContainer.middle);
		 	supContainer.middle.dContainer.height=getHeightContainer(supContainer.base);
		 //	supContainer.bottom=loadNode(getChildIndexAt(node,1),supContainer.bottom);
		 	supContainer.setParent();
		 	supContainer.setSuperScript();
		 	drawObject.setChildContainer(supContainer.parent);
		 	increaseFontSize();
		 	return drawObject;
		 }
		 public function loadMSub(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 	var supContainer:SuperSubBox=new SuperSubBox();
		 	supContainer.base=loadNode(getChildIndexAt(node,1),supContainer.base);
		 	decreaseFontSize();
		 	supContainer.top=loadNode(bufferXml,supContainer.top);
		 	//Set the height of the top Conatiner
		 	supContainer.top=loadNode(bufferXml,supContainer.top);
		 	supContainer.top.dContainer.height=getHeightContainer(supContainer.base);
		 	supContainer.middle=loadNode(getChildIndexAt(node,2),supContainer.middle);
		 //	supContainer.bottom=loadNode(getChildIndexAt(node,1),supContainer.bottom);
		 	supContainer.setParent();
		 	supContainer.setSubScript();
		 	drawObject.setChildContainer(supContainer.parent);
		 	increaseFontSize();
		 	return drawObject;
		 }
		 public function loadMFrac(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 	var fractBox:FractionBox=new FractionBox();
		 	fractBox=fractBox.Display();
		 	GlobalData._currentContainer=fractBox.parent;
		 	fractBox.numBox=loadNode(getChildIndexAt(node,1),fractBox.numBox);
		 	GlobalData._currentContainer=fractBox.parent;		 	
		 	fractBox.denBox=loadNode(getChildIndexAt(node,2),fractBox.denBox);			
			drawObject.setChildContainer(fractBox.parent);
		 	/* var fracBox:FracBox=new FracBox();		 	
		 	var numWidth:uint=0;var denWidth:uint=0;
		    fracBox.numBox=loadNode(getChildIndexAt(node,1),fracBox.numBox);
		    numWidth=getWidthContainer(fracBox.numBox);		    
		    fracBox.denBox=loadNode(getChildIndexAt(node,2),fracBox.denBox);
		    denWidth=getWidthContainer(fracBox.denBox);
		  	fracBox.median= drawMedian(Math.max(numWidth,denWidth)+10,fracBox.median);
		    drawObject.setChildContainer(fracBox.setFraction()); */
		    return drawObject;
		 }		 
		 public function loadMunder(node:XML,drawObject:DisplayContainer):DisplayContainer{
			var overBox:OverUnderBox=new OverUnderBox();
		    overBox.top=loadNode(new XML(""),overBox.top);
		    overBox.middle=loadNode(getChildIndexAt(node,1),overBox.middle);
		    decreaseFontSize();
		    overBox.bottom=loadNode(getChildIndexAt(node,2),overBox.bottom);
		    increaseFontSize();
		    overBox.setTop();
		    overBox.setOverParent();
		    drawObject.setChildContainer(overBox.parent);
		 	return drawObject;
		 }
		  public function loadMover(node:XML,drawObject:DisplayContainer):DisplayContainer{
			var overBox:OverUnderBox=new OverUnderBox();
			decreaseFontSize();
		    overBox.top=loadNode(getChildIndexAt(node,2),overBox.top);
		    increaseFontSize();
		    overBox.middle=loadNode(getChildIndexAt(node,1),overBox.middle);
		    overBox.bottom=loadNode(new XML(""),overBox.bottom);//loadNode(getChildIndexAt(node,2),overBox.bottom);
		    overBox.setBottom();
		    overBox.setOverParent();
		    drawObject.setChildContainer(overBox.parent);
		 	return drawObject;
		 }
		 public function loadMunderover(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 	var overBox:OverUnderBox=new OverUnderBox();
		    decreaseFontSize();
		    overBox.top=loadNode(getChildIndexAt(node,3),overBox.top);
		    overBox.bottom=loadNode(getChildIndexAt(node,2),overBox.bottom);
		    increaseFontSize();
		    overBox.middle=loadNode(getChildIndexAt(node,1),overBox.middle);
		    overBox.setOverParent();
		    drawObject.setChildContainer(overBox.parent);
		 	return drawObject;
		 }
		  public function loadMi(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 GlobalData.addNodetoTable('mrow',node.childIndex(),drawObject.countid,GlobalData._currentContainer.countid);	
		 GlobalData._currentContainer=drawObject;
		//  var operandBox:OperandBox=new OperandBox(GlobalData._currentContainer);
		  var operandBox:OperandBox=new OperandBox(drawObject);
		  if(node.text().toString().charAt(0)=='&')
				{
				var moOperator:Operands=new Operands();
				var operatorValue:String=node.valueOf().toString();
				operatorValue=operatorValue.slice(1,operatorValue.length-1);
				var mo_Xml:XML= moOperator.moXML();
			//	return operandBox.drawSymbol(mo_Xml.descendants(operatorValue).valueOf().toString()),drawObject,fontSize);
				drawObject.setChildContainer(operandBox.drawSymbol(mo_Xml.descendants(operatorValue).valueOf().toString()).parent);
				return drawObject;
				}				
				else
				{
				//GlobalData._currentContainer.setChildContainer(operandBox.drawSymbol(node.text().toString()).parent);
				drawObject.setChildContainer(operandBox.drawSymbol(node.text().toString()).parent);
				
				//operandBox.custlblObj.setMiNodeEdit()
				GlobalData.addNodetoTable('mi',node.childIndex(),operandBox.custlblObj.opndBox.countid,GlobalData._currentContainer.countid,node.text());
		  		
				return drawObject;//GlobalData._currentContainer;// drawObject;
				}
				
		 }
		  public function loadMo(node:XML,drawObject:DisplayContainer):DisplayContainer
		  {
	//	  	 var mo:Moperators=new Moperators();
			 var oprBox:DisplayContainer=new DisplayContainer();
			 oprBox.initHBox();
			 if(node.text().toString().charAt(0)=='&')
		  	  {
		 // 	  	if(mo.specialO.indexOf(node.text()))
		  	  		return loadSpecialMo(node,drawObject);
		  //	  	else
		 // 	   return drawSymbol(mo.operators[node.text()],drawObject,fontSize);
		  	  }
		  	GlobalData._currentContainer.setChildContainer(this.drawSymbol(node.text(),oprBox,30));
		  	GlobalData.addNodetoTable('mo',node.childIndex(),GlobalData.assignOprId--,GlobalData._currentContainer.countid,node.text());
		  	
		  	return drawObject;//drawObject;//loadMi(node,drawObject);
		 }	
		
		 public function loadSpecialMo(node:XML,drawObject:DisplayContainer):DisplayContainer
		 {

			var maxO:MaxOperator=new MaxOperator();
			var parent:XML=new XML(node.parent().toXMLString());
			var indeX:int=node.childIndex();
			var afterChild:XML=getChildIndexAt(parent,indeX+2);			
			loadNode(afterChild,maxO.child);			
			var boxheight:uint=getHeightContainer(maxO.child);
		 	var bitmHand:BitmapHandler1=new BitmapHandler1();		 	
		 	var moOperator:Operands=new Operands();		 	
		 	var operatorValue:String=node.valueOf().toString();
		 	operatorValue=operatorValue.slice(1,operatorValue.length-1);
		 	var mo_Xml:XML= moOperator.moXML();		 	
		 	var parent_Xml:XML=XML(mo_Xml.descendants(operatorValue).parent())
	//	 	Alert.show("node parent"+parent_Xml.name().toString()+"node val"+mo_Xml.descendants(operatorValue).valueOf().toString());
		 	var symbolLbl:Label
		 	if(parent_Xml.name().toString()=='integral')
		 	{
		 		symbolLbl=bitmHand.integralSymbol(mo_Xml.descendants(operatorValue).valueOf().toString(),boxheight,40,165,200,false);
		 	}
		 	else
		 	{
		 		boxheight=boxheight;//+(boxheight/2);
		 		symbolLbl=bitmHand.bitmapHandler(mo_Xml.descendants(operatorValue).valueOf().toString(),boxheight,35,135,100,true);
		 	}		 	
		 	maxO.opr.dContainer.addChild(symbolLbl);
			drawObject.setChildContainer(maxO.setOperator()); 
//		 	skipNode=true;		 	
		 	return drawObject;
		 }
		 //Load Constant
		 public function loadMn(node:XML,drawObject:DisplayContainer):DisplayContainer{
		 	 var numBox:NumberBox=new NumberBox(GlobalData._currentContainer);
		 	 GlobalData._currentContainer.setChildContainer(numBox.setNumber(node.text().toString()).parent);
			 return drawObject;				
		 }
		//Load Fence Box
	 	public function loadMfence(node:XML,drawObject:DisplayContainer):DisplayContainer{
		var fenceBox:FenceBox=new FenceBox();
		for each (var child_node:XML in node.children())
		{
			loadNode(child_node,fenceBox.child);
		}
		var hgt:Number=getHeightContainer(fenceBox.child);
		var openFence:String=node.attribute('open').toString();
		var closeFence:String=node.attribute('close').toString();
		drawObject.setChildContainer(fenceBox.drawFence(openFence,closeFence,hgt));    
		return drawObject;
		}
		//Load Matrix table
		public function load_mTable(node:XML,drawObject:DisplayContainer):DisplayContainer{
		
			var columnContainer:DisplayContainer=new DisplayContainer();
		 	columnContainer.initGrid();
				 	
			for each (var child_node:XML in node.children())
			{
				loadNode(child_node,columnContainer);
			}
		
			drawObject.setChildContainer(columnContainer);    
			return drawObject;
		}	
		//Load matrix Row
		public function load_mtRow(node:XML,drawObject:DisplayContainer):DisplayContainer{
		
			var columnContainer:DisplayContainer=new DisplayContainer();
		 	columnContainer.initGridRow();
		
			columnContainer.dContainer.setStyle('horizontalAlign','center');
			columnContainer.dContainer.setStyle('verticalAlign','middle');
		
			for each (var child_node:XML in node.children())
			{
				loadNode(child_node,columnContainer);
			}
			drawObject.setChildContainer(columnContainer);    
			return drawObject;
		}
		//Load Matrix Cell
		public function load_mtd(node:XML,drawObject:DisplayContainer):DisplayContainer{
		
			var columnContainer:DisplayContainer=new DisplayContainer();
		 	columnContainer.initGridItem();
		
			columnContainer.dContainer.setStyle('horizontalAlign','center');
			columnContainer.dContainer.setStyle('verticalAlign','middle');
			columnContainer.dContainer.setStyle('horizontalGap','-10');
		
			for each (var child_node:XML in node.children())
			{
				loadNode(child_node,columnContainer);
			}
			drawObject.setChildContainer(columnContainer);    
			return drawObject;
		}
		 
		  public function drawSymbol(symbol:String,containerHandler:DisplayContainer,fontSize:uint):DisplayContainer{
		 	var my_label:Label=new Label();		
		   	my_label.text=symbol;my_label.setStyle('fontSize',fontSize);
		    my_label.setStyle('textAlign','center');
		    temp_canvas.addChild(my_label);
		    temp_canvas.validateNow();
		    expandWidth+=my_label.textWidth;
		    containerHandler.dContainer.addChild(my_label);
			my_label.validateNow();
			return containerHandler;
		 } 
		 public function decreaseFontSize():void{
		 	fontSize=fontSize-7;
		 }
		 public function increaseFontSize():void{
		 	fontSize=fontSize+7;
		 }
		public function drawMedian(wdt:Number,drawingBoard:DisplayContainer):DisplayContainer{
			drawingBoard.dContainer.setStyle('backgroundColor','#000000');
			drawingBoard.dContainer.width=wdt;
			drawingBoard.dContainer.minHeight=2;
		 	return drawingBoard;
		 }
		 public function getWidthContainer(containerHandler:DisplayContainer):int{
			temp_canvas.removeAllChildren();
			temp_canvas.addChild(containerHandler.dContainer);
		 	temp_canvas.validateNow();
		 	return temp_canvas.getBounds(temp_canvas).width;
		 }
		public function getHeightContainer(containerHandler:DisplayContainer):int{
			temp_canvas.removeAllChildren();
		 	temp_canvas.addChild(containerHandler.dContainer);
		 	temp_canvas.validateNow();
		 	return temp_canvas.getBounds(temp_canvas).height;
		 }
	}
}