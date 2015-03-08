/*package components
{
	import containers.MatrixBox;
	
	import flash.events.MouseEvent;
	
	public class MatrixPanel
	{
		   	import mx.containers.TitleWindow;
           	import mx.containers.Canvas;
			import mx.controls.Label;
			import mx.containers.GridRow;
			import mx.containers.GridItem;
			import mx.containers.Grid;
			import mx.containers.HBox;
			import mx.controls.Alert;
			import containers.GlobalData;
			
			[Bindable]
			public var gridItem:GridItem;
			public var gridRow:GridRow;
			public var grid:Grid;
			public var mItem:HBox;
			public var mItemArray:Array=new Array(15);
			public var xlen:Number;
			public var ylen:Number;
			
			public var cnt:Number=1;
			public var matrixSelector:TitleWindow;

               public function handleMouseMove(event:MouseEvent):void{

			    	           if(event.stageX<100)
								{
									        matrixSelector.width=100;
								}   
						    	else if(event.stageX<328&&event.stageX>100)
						    	{
						    		matrixSelector.width = event.stageX;
					        	 }
                      if(event.stageY<350&&event.stageY>120)
                      {
           				matrixSelector.height = event.stageY;
           			}
          		    else if(event.stageY<100)
						{
							 		matrixSelector.height=100;
						}   
					matrixSelector.horizontalScrollPolicy="off";
                	matrixSelector.verticalScrollPolicy="off";

               }
               
			public function initMat():void
			{
			//Alert.show('initMatrix');
			matrixSelector=new TitleWindow();
			grid=new Grid();
			grid.setStyle('verticalGap','0');
			grid.setStyle('horizontalGap','0');
			
			for (var i:Number=0;i<15;i++)
			{
				gridRow=new GridRow();
				mItemArray[i]=new Array(15);
				for(var j:Number=0;j<15;j++)
				{
					gridItem=new GridItem();
					mItem=new HBox();
					mItem.minHeight=20;
					mItem.minWidth=20;
					mItem.id=i+","+j;
					mItemArray[i][j]=mItem;
					mItem.addEventListener(MouseEvent.MOUSE_OVER,highlightMatrix);
					mItem.addEventListener(MouseEvent.MOUSE_DOWN,fixMatrix);
					mItem.setStyle('borderColor','#dad8d8');
					mItem.setStyle('borderThickness','2');
					mItem.setStyle('borderStyle','solid');
					gridItem.addChild(mItem);
					gridRow.addChild(gridItem);
				}
				grid.addChild(gridRow);
			}
			matrixSelector.addChild(grid);
			}

			public function highlightMatrix(evt:MouseEvent):void
			{
						var mItem:HBox=HBox(evt.target);
						var mid:Array = mItem.id.split(",",2);
						var i:Number=0;
						var j:Number=0;
						ylen=int(mid.pop());
						xlen=int(mid.pop());
						matrixSelector.title=(xlen+1)+'X'+(ylen+1)+' Matrix';
						for(i=0;i<15;i++)
						{
							for( j=0;j<15;j++)
							{
		
								var clearItem:HBox = HBox( mItemArray[i][j] );
								clearItem.clearStyle('backgroundColor');
							}
						}
						for(i=0;i<=xlen;i++)
						{
							for(j=0;j<=ylen;j++)
							{
								var setItem:HBox = HBox( mItemArray[i][j] );
								setItem.setStyle('backgroundColor','#012345');
							}
						}

			}

			public function fixMatrix(evt:MouseEvent):void
			{
				
						var mItem:HBox=HBox(evt.target);
						var mid:Array = mItem.id.split(",",2);
						ylen=int(mid.pop());
						xlen=int(mid.pop());
						var matrixBoxObj:MatrixBox=new MatrixBox(xlen,ylen);
						GlobalData._currentContainer.dContainer.addChild(matrixBoxObj.parent.dContainer);
						reinitialise();
			}
			
public function reinitialise():void
{
var i:Number;
var j:Number;
	for(i=0;i<15;i++)
{
	for( j=0;j<15;j++)
	{
	
		var clearItem:HBox = HBox( mItemArray[i][j] );
		clearItem.setStyle('backgroundColor','#FFFFFF');
		matrixSelector.title='';
	}
}
}
         
    public function addResizeListeners():TitleWindow{
	                   matrixSelector.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove)
    
                       return matrixSelector
               }


	}
}*/
package components
{
	import containers.MatrixBox;
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import mx.core.Application;
	import mx.events.CloseEvent;
	
	public class MatrixPanel
	{
		   	import mx.containers.TitleWindow;
           	import mx.containers.Canvas;
			import mx.controls.Label;
			import mx.containers.GridRow;
			import mx.containers.GridItem;
			import mx.containers.Grid;
			import mx.containers.HBox;
			import mx.controls.Alert;
			import containers.GlobalData;
			
			[Bindable]
			public var gridItem:GridItem;
			public var gridRow:GridRow;
			public var grid:Grid;
			public var mItem:HBox;
			public var mItemArray:Array=new Array(15);
			public var xlen:Number;
			public var ylen:Number;
			
			public var cnt:Number=1;
			public var matrixSelector:TitleWindow;

               public function handleMouseMove(event:MouseEvent):void{

			   	           if(event.stageX<100)
								{
									        matrixSelector.width=100;
								}   
						    	else if(event.stageX<400&&event.stageX>100)
						    	{
						    		matrixSelector.width = event.stageX-60;
					        	 }
                      if(event.stageY<360&&event.stageY>120)
                      {
           				matrixSelector.height = event.stageY;
           			}
          		    else if(event.stageY<100)
						{
							 		matrixSelector.height=100;
						}   
			
					matrixSelector.horizontalScrollPolicy="off";
                	matrixSelector.verticalScrollPolicy="off";

               }
               
			public function initMat():void
			{
			//Alert.show('initMatrix');
			matrixSelector=new TitleWindow();
			grid=new Grid();
			grid.setStyle('verticalGap','0');
			grid.setStyle('horizontalGap','0');
			
			for (var i:Number=0;i<15;i++)
			{
				gridRow=new GridRow();
				mItemArray[i]=new Array(15);
				for(var j:Number=0;j<15;j++)
				{
					gridItem=new GridItem();
					mItem=new HBox();
					mItem.minHeight=20;
					mItem.minWidth=20;
					mItem.id=i+","+j;
					mItemArray[i][j]=mItem;
					mItem.addEventListener(MouseEvent.MOUSE_OVER,highlightMatrix);
					mItem.addEventListener(MouseEvent.MOUSE_DOWN,fixMatrix);
					mItem.setStyle('borderColor','#dad8d8');
					mItem.setStyle('borderThickness','2');
					mItem.setStyle('borderStyle','solid');
					gridItem.addChild(mItem);
					gridRow.addChild(gridItem);
				}
				grid.addChild(gridRow);
			}
			matrixSelector.addChild(grid);
			}

			public function highlightMatrix(evt:MouseEvent):void
			{
						var mItem:HBox=HBox(evt.target);
						var mid:Array = mItem.id.split(",",2);
						var i:Number=0;
						var j:Number=0;
						ylen=int(mid.pop());
						xlen=int(mid.pop());
						matrixSelector.title=(xlen+1)+'X'+(ylen+1)+' Matrix';
						for(i=0;i<15;i++)
						{
							for( j=0;j<15;j++)
							{
		
								var clearItem:HBox = HBox( mItemArray[i][j] );
								clearItem.clearStyle('backgroundColor');
							}
						}
						for(i=0;i<=xlen;i++)
						{
							for(j=0;j<=ylen;j++)
							{
								var setItem:HBox = HBox( mItemArray[i][j] );
								setItem.setStyle('backgroundColor','#012345');
							}
						}

			}

			public function fixMatrix(evt:MouseEvent):void
			{
				
						var mItem:HBox=HBox(evt.target);
						var mid:Array = mItem.id.split(",",2);
						ylen=int(mid.pop());
						xlen=int(mid.pop());
						var matrixBoxObj:MatrixBox=new MatrixBox(xlen,ylen);
						GlobalData._currentContainer.dContainer.addChild(matrixBoxObj.parent.dContainer);
						reinitialise();
			}
			
public function reinitialise():void
{
var i:Number;
var j:Number;
	for(i=0;i<15;i++)
{
	for( j=0;j<15;j++)
	{
	
		var clearItem:HBox = HBox( mItemArray[i][j] );
		clearItem.setStyle('backgroundColor','#FFFFFF');
		matrixSelector.title='';
	}
}
}
        
        public function closeMatrixWindow(event:Event):void
        {
        	Application.application.removeChild(event.currentTarget);
        } 
        
    public function addResizeListeners():TitleWindow
    {
    	matrixSelector.showCloseButton=true;
    	matrixSelector.addEventListener(CloseEvent.CLOSE,closeMatrixWindow)
		matrixSelector.addEventListener(MouseEvent.MOUSE_OVER, handleMouseMove)
    	matrixSelector.addEventListener(MouseEvent.CLICK,closeMatrixWindow);
//    	matrixSelector.addEventListener(CloseEvent.CLOSE,closeMatrixWindow)
        return matrixSelector
     }
	

	}
	
}