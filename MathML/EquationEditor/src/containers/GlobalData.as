package  containers{
	import components.Custom_Operand;
	
	import mx.controls.Alert;
	import mx.controls.Label;
	
public class GlobalData {
  public static  var _currentContainer:DisplayContainer;
  public static  var _currentLabel:Label;
  public static var _counterId:uint;
  public static var index:int=0;
  public var nodeM:MathNode=new MathNode();
  public static var assignOprId:Number=100;
  public static  var setTable:Array=new Array();
  public static var fontSizeO:int=30;
  public static var minMode:Boolean=false;
  public static var currentOperandBox:Custom_Operand;
  public static var identityArray:Array=new Array();

	public function GlobalData( ) 
	{
		_currentContainer= new DisplayContainer();
		_counterId=0;
	}
	public function get countId( ): uint 
	{
			return _counterId;
	}	
	public function set countId(value:uint):void 
	{
		_counterId = value;
	}
	public static function deleteChildrenOf(nodeid:Number):void{
		var indexA:int=0;
		Alert.show('before count'+setTable.length.toString());
		 for each(var t:MathNode in setTable)
		{
			 if(t.nodeparent==nodeid)
			 {
			 //setTable.splice(indexA,1);
			 delete setTable[t.nodeid];
			 } 
			 indexA++;
		} 
		Alert.show('after count'+setTable.length.toString());
	}
  	public static function addNodetoTable(nodetype:String,nodeposition:uint,nodeid:Number=-1,nodeparent:Number=-1,nodetext:String='',nodeattribute:Array=null):void
 	{
		  	var nodeM:MathNode=new MathNode();
		  	nodeM.nodeposition=nodeposition;
		  	if(nodeparent==-1)
		  	  	nodeM.nodeparent=_counterId;
		  	else 
		  	    nodeM.nodeparent=nodeparent;
		  	nodeM.nodetype=nodetype;
		  	if(nodeid==-1)
		  	nodeM.nodeid=_counterId;
			else
			nodeM.nodeid=nodeid;
			
			if(nodeattribute!=null)
			{
				nodeM.attribute=nodeattribute;
			}
		  	nodeM.nodetext=nodetext;
		  	setTable[nodeid]=nodeM;
		  	
 	} 
 
	 public static function shiftNodesRight(nodeparentid:Number):void{
	 		for each(var t:MathNode in GlobalData.setTable)
	 		{
	 		if(t.nodeparent==nodeparentid && t.nodeposition>=EquationEditor.currentIndex)
	 			t.nodeposition++;
	 		}
	 }
	 public static function shiftNodesRight1(nodeparentid:Number):void{
	for each(var t:MathNode in GlobalData.setTable)
	{
	if(t.nodeparent==nodeparentid && t.nodeposition>EquationEditor.currentIndex)
	t.nodeposition=t.nodeposition+1;
	}
	}

	public static function decreaseFontSize():void{
	 	fontSizeO-=5;
	}
	public static function increaseFontSize():void{
		fontSizeO+=5;
	}
	public static function getFont():int{
	 	if(minMode)
	 		return 20;
	 	else 
	 		return 30;
	}
	public static function getMathNode(nodeid:Number):MathNode{
	return MathNode(setTable[nodeid]);
	}
	public static function resetOperatorFlag():void{
				EquationEditor.afterFlag=true;
				EquationEditor.beforeFlag=true;
	}
	public static function refreshState():void{
		resetOperatorFlag();
		GlobalData.assignOprId=100;
		GlobalData._counterId=0;
		GlobalData.setTable=new Array();
		EquationEditor.operandFlag=true;
	}
		
	}
		
}