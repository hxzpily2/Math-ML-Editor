package containers
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import mx.containers.Grid;
	import mx.containers.GridItem;
	import mx.containers.GridRow;

	public class MatrixBox extends DisplayContainer
	{
		
		public var parent:DisplayContainer=new DisplayContainer();
		public var grid:Grid=new Grid();
		public var gridRow:GridRow;
		public var gridItem:GridItem;
		public var mItem:DisplayContainer;
	
		public function MatrixBox(row_No:int,column_No:int)
		{
			parent.initHBox();
			parent.initializeParentBox();
			parent.dContainer.addChild(grid);
			parent.assignId();
			GlobalData.addNodetoTable('mtable',0,parent.countid,GlobalData._currentContainer.countid);
			for (var rowCounter:int=0;rowCounter<=row_No;rowCounter++)
			{
				var gridContainer:DisplayContainer=new DisplayContainer();
				gridContainer.initGridRow();
				gridContainer.assignId();
				GlobalData.addNodetoTable('mtr',rowCounter,gridContainer.countid,parent.countid);
				
				for (var columnCounter:int=0;columnCounter<=column_No;columnCounter++)
				{
				   var	gridItem:GridItem=new GridItem();
				    gridItem.setStyle('horizontalAlign','center');
					gridItem.setStyle('verticalAlign','middle');
					mItem=new DisplayContainer();
					mItem.initHBox();mItem.assignId();
					GlobalData.identityArray[GlobalData.index]=(mItem.countid)
					GlobalData.index++;
					
					mItem.initializeBox();
					mItem.addEffects();
					mItem.setBorder();
					GlobalData.identityArray[GlobalData.index]=(mItem.countid)
					GlobalData.index++;
		
					mItem.dContainer.addEventListener(KeyboardEvent.KEY_DOWN,setKeyBoardvalue);
					GlobalData.addNodetoTable('mtd',columnCounter,mItem.countid,gridContainer.countid);
					gridItem.addChild(mItem.dContainer);
					gridContainer.dContainer.addChild(gridItem);
					
				}
				grid.addChild(gridContainer.dContainer);
			}
		}
/*		public function addChild1(opr:String):void{
		this.parent.setChildContainer(first);		
		getOperator(opr);
		this.parent.setChildContainer(operator);
		this.parent.setChildContainer(second);
		}
*/		public function Display(opr:String):MatrixBox{
			
	    	 parent.initializeParentBox();
			 parent.dContainer.name='hbox';
			 parent.dContainer.setStyle('borderStyle','inset');
			 parent.dContainer.setStyle('verticalAlign','middle');
			 parent.dContainer.setStyle('horizontalAlign','center');						
//			 addChild1(opr);
			return this;		
		}		
/*		public function initialize():void{
			//first.dContainer.addChild(getLabel());
			//second.dContainer.addChild(getLabel());	
			parent.initializeParentBox();
			first.initializeBox();
			second.initializeBox();
			operator.initializeBox();
			operator.dContainer.addEventListener(MouseEvent.CLICK,setFocusOperator);
		}
		
		public function getOperator(opr:String):void{
			var my_label:Label=new Label();
			my_label.id='buf';
			my_label.x=0;my_label.y=0;
			my_label.minHeight=30;
			my_label.setStyle('fontSize','30');
			my_label.minWidth=30;
			my_label.text=''+opr+'';
//			operator.dContainer.addChild(my_label);
		}
	*/	public function setFocusOperator(event:MouseEvent):void
		{
			
			event.target.parent.setFocus()
			event.target.parent.drawFocus(true)
//			GlobalData._currentContainer=operator;
			EquationEditor.operatorFlag=false;
		}

	}
}