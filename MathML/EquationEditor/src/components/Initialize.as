		import com.messageservice.InfoMessageService;
		import com.parser.XmlOperation3;
		
		import components.*;
		
		import containers.*;
		
		import flash.events.MouseEvent;
		import flash.ui.ContextMenu;
		import flash.ui.ContextMenuItem;
		
		import mx.containers.*;
		import mx.controls.*;
		import mx.core.Application;
		import mx.effects.Rotate;
		import mx.effects.easing.*;
		import mx.effects.effectClasses.ResizeInstance;
		import mx.events.MenuEvent;
		import mx.events.ToolTipEvent;
		import mx.graphics.codec.PNGEncoder;
		import mx.managers.ToolTipManager;
		import mx.rpc.events.FaultEvent;
		import mx.rpc.events.ResultEvent;
		import mx.utils.UIDUtil;
 		[Bindable]
 		public var mathG:MathXmlGenerator=new MathXmlGenerator();
 		public var _containerCopy:DisplayObject
 		public var label1:Label=new Label()
 		public var label_height:int=0;
 		public var temporary:String;
 		public var operands_object:Operands=new Operands();
 		public var popup_button_label:String=new String();
 		public var hbox:HBox=new HBox();
  		public var flag:int=0;
  		public var toggle:Boolean=false;
  		public static var operatorFlag:Boolean=true;
  		public static var operandFlag:Boolean=true;
		public var req:URLRequest
        public var fileRef:FileReference=new FileReference()
        public var rotate:Rotate
  		public var strURL:String;
		public var myGlobal:GlobalData=new GlobalData();
		public var myDisplay:DisplayContainer=new DisplayContainer();
		public var menu_label:String='Advanced';
		public var popup_arithmetic:CustomToggleButtonBar
		public var button_label:String;
        public var matrixPanel_obj:MatrixPanel;
  		public static var beforeFlag:Boolean=true
  		public static var afterFlag:Boolean=true;
  		public static var currentIndex:uint=0;
		public var loginPanel:Panel;
		public var mainPanel:CustomPanel=new CustomPanel();
		public var logincontrol:ControlBar;
		[Bindable]
		public var eqDisplay:PopupPanel;
		[Bindable]
		public var storeuser:String
		public var _titlePanel:Panel;
		public var _control:ControlBar
		public var _titlevalue:TextInput
		public var loginvalue:TextInput;
		public var _closeflag:int=0;
		public var PNG:PNGEncoder=new PNGEncoder()
		public var List_of_titles:Array
		public var bitmapData:BitmapData
		public 	var matrixWindow:TitleWindow;		
		[Bindable]
		public var bytearray:ByteArray
		[Bindable]
		public var storeMathML:String;
		[Bindable]
		public var UID:String
		[Bindable]
 		public var username:String
 		[Bindable]
 		public var equationtitle:String
 		public var resizeInst:ResizeInstance;
 		public var DeleteContextMenu:ContextMenuItem
 		public var EditContextMenu:ContextMenuItem
 		public var ListContextMenu:ContextMenu		
		public function createCustom(evt:MouseEvent):void
		{			
			if(flag==1)
			this.removeChild(popup_arithmetic);
			flag=1;
			popup_arithmetic=new CustomToggleButtonBar();
			popup_arithmetic.y=100
			
			popup_arithmetic.setStyle('fontFamily',"myStixFont");
			popup_arithmetic.setStyle('fontStyle',"normal");
			var currentButton:Button=Button(evt.target);
			popup_arithmetic.label=currentButton.label;
			this.addChild(popup_arithmetic);	
			button_label=evt.target.label
			initialize_operands(button_label);
		}

		
		public function drawEquation():void{
				//eqDisplay;
			eqDisplay=new PopupPanel()
			eqDisplay.createPop();
			GlobalData.refreshState();
			var containerHandler:DisplayContainer=new DisplayContainer();
			containerHandler.initHBox();containerHandler.assignId();
			containerHandler.setHorizontalAlign();containerHandler.setVerticalAlign();
			GlobalData._currentContainer.countid=0;//containerHandler;//=containerHandler;
			//GlobalData.addNodetoTable('math',0,containerHandler.countid,0);
			var xmlO:XmlOperation3=new XmlOperation3(temp_canvas);
			var MathML:XML=new XML(mathInput.text);
			containerHandler=xmlO.loadNode(MathML,containerHandler);
			
			symbols_canvas.removeAllChildren();
			symbols_canvas.addChild(containerHandler.dContainer);
			//drawingBoard.addChild(containerHandler.dContainer);
			//eqDisplay.myHbox.addChild(containerHandler.dContainer);
			//PopUpManager.addPopUp(eqDisplay,this,false);
			//PopUpManager.centerPopUp(eqDisplay);
		}
 		public function initialize_menu(event:MenuEvent):void
 		{
 		menu_label=event.label
 			if(menu_label=="Save")
 			doSave();
 			initialize_operands(button_label)
 			
 		}
 		public function initList():void
 		{
 			var param:Object=new Object();
 			var serviceobj:HTTPService=new HTTPService();
 			param.username=storeuser
 			serviceobj.addEventListener(FaultEvent.FAULT,onFault);
 			serviceobj.addEventListener(ResultEvent.RESULT,onResult)
 			serviceobj.url="/../blazeds/EquationEditorFinal-debug/Retrieve.jsp"
 			serviceobj.useProxy=false;
 			serviceobj.resultFormat="e4x"
 			serviceobj.send(param);
 		} 		
 		public function showLogin():void
 		{
 			
	 		// mainPanel=PopUpManager.createPopUp(this,CustomPanel,true) as CustomPanel;
 			 //PopUpManager.centerPopUp(mainPanel); 
 		  	// loginvalue=mainPanel.text1;		  	 		  	
 		}
 		public  function getUser(event:MouseEvent):void
 		{
 			
 		/* 	if(loginvalue.text!="")
 			{
 			storeuser=loginvalue.text;	
 			PopUpManager.removePopUp(mainPanel);
 			
 			} */
 			initDisplayBoard();
 		} 		
 		public function initContextMenu():void
 		{
 			ListContextMenu=new ContextMenu()
 			ListContextMenu.hideBuiltInItems();
 			EditContextMenu=new ContextMenuItem("Edit");
 			ListContextMenu.customItems.push(EditContextMenu);
 			//Alert.show('created');
 			DeleteContextMenu=new ContextMenuItem("Delete");
 			ListContextMenu.customItems.push(DeleteContextMenu);
 			equationNames.contextMenu=ListContextMenu;
 		}
 		public function initDisplayBoard():void{
 			initList();
 			initContextMenu();
			myDisplay.initHBox();myDisplay.assignId();
			myDisplay.setVerticalAlign();
			myDisplay.setHorizontalAlign();myDisplay.dContainer.percentHeight=100;
			symbols_canvas.addChild(myDisplay.dContainer);
			GlobalData._currentContainer=myDisplay;			
			GlobalData.addNodetoTable('mrow',0,myDisplay.countid,0);
		}
 		public function func(event:EQEvent):void
 		{ 			
 			var popup_Button_Control: CustomToggleButtonBar = CustomToggleButtonBar ( event.payload );
 			popup_button_label = popup_Button_Control.label;
 			temporary=popup_arithmetic.temp; 			
			 if(popup_button_label=='+')
 			 	 displayOperator();
 			 if(popup_button_label=='=')
 			 	 displayOperator();
 			 if(!(afterFlag && beforeFlag) &&	(popup_button_label!='+')&&(popup_button_label!='=')) 
 			 { 			 	
 			    Application.application.infoPanel.mess=new InfoMessageService().ErrorMessage();
				Application.application.infoPanel.addMessage();
 			 }
 			  if(afterFlag && beforeFlag)
 			{
 			 if(popup_button_label=='Operands')
 				 displayOperand(temporary);
  		     if(popup_button_label=='Numbers')
 	 			 displayNumbers(temporary);	
 			 if(popup_button_label=='Relational')
 			  	displayOperator()
 			 if(popup_button_label=='Arrow')
 				displayArrow();
 			 if(popup_button_label=='greek')
 				 displayOperand(temporary);
 			 if(popup_button_label=='Fence')
 				 displayFence(temporary);
 			 if(popup_button_label=='MathMl')
 			 	displayMathML(temporary);	
 			 if(popup_button_label=='mapsTo')
 			 	displayMapping(temporary);
 			 if(popup_button_label=='Integral')
 			 	displayIntegral(temporary);
 			}
 			
 		}
 		public function displayMapping(mathtag:String):void
 		{
  			var mapping:MapsToArrow=new MapsToArrow();
 			//mapsTo.displaySymbol();

			if(mathtag=='mapOver')
				mapping.setOverText();				
 			if(mathtag=='mapUnder')
 				mapping.setUnderText();
 			if(mathtag=='mapOverUnder')
 				mapping.setOverUnderText();
 			GlobalData._currentContainer.dContainer.addChild(mapping.mapsTo.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();  		
 		}
 		public function displayMathML(mathtag:String):void
 		{
 			if(afterFlag && beforeFlag)
 			{ 			
 			if(mathtag=='Fraction')
 				displayFraction();
 			if(mathtag=='SuperScript')
 				displaySuperScript();
 			if(mathtag=='SubScript')
 				displaySubScript();
 			if(mathtag=='Sqrt')
 				displaySqrt();
 			if(mathtag=='Root')
 				displayRoot();
 			if(mathtag=='Under')
 				displayUnder();
 			if(mathtag=='Over')
 				displayOver();				
 			} 			
 		}
 		public function displayFraction():void
 		{
 			var fractBox:FractionBox=new FractionBox();				
			GlobalData._currentContainer.dContainer.addChild(fractBox.Display().parent.dContainer);
			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displaySuperScript():void
 		{
 			var supBox:SuperScript=new SuperScript();
 			supBox.drawSuperScript();
			GlobalData._currentContainer.dContainer.addChild(supBox.parent.dContainer);
			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displaySubScript():void
 		{
 			var subBox:SubScript=new SubScript();
 			subBox.setParent();
 			subBox.setSubScript();
			GlobalData._currentContainer.dContainer.addChild(subBox.parent.dContainer);
			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displaySqrt():void
 		{
 			var sqrtBox:SqrtBox=new SqrtBox();
 			sqrtBox.drawSqrt();
 			sqrtBox.addMathML();
 			GlobalData._currentContainer.dContainer.addChild(sqrtBox.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displayRoot():void
 		{
 			var rootBox:RootBox=new RootBox();
 			rootBox.drawRoot();
 			GlobalData._currentContainer.dContainer.addChild(rootBox.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displaySummation():void
 		{
 			var summationBox:SummationBox=new SummationBox();
 			summationBox.displaySymbol();
 			GlobalData._currentContainer.dContainer.addChild(summationBox.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displayIntegral(opr:String):void
 		{
 			var integralBox:IntegralBox=new IntegralBox(opr);
 			integralBox.displaySymbol();
 			GlobalData._currentContainer.dContainer.addChild(integralBox.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displayFence(fence:String):void
 		{	var fenceBox:FenceBox=new FenceBox();
 			fenceBox.drawFenceT(fence.substring(0,1),fence.substring(1,2));	
 			GlobalData._currentContainer.dContainer.addChild(fenceBox.parent.dContainer);
			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displayUnder():void
 		{
 			var underBox:UnderOver=new UnderOver();
 			underBox.setProperty();underBox.drawUnder();
 			GlobalData._currentContainer.dContainer.addChild(underBox.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displayOver():void
 		{
 			var overBox:UnderOver=new UnderOver();
 			overBox.setProperty();overBox.drawOver();
 			GlobalData._currentContainer.dContainer.addChild(overBox.parent.dContainer);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}
 		public function displayNumbers(num:String):void
 		{
 			
 			var numBox:NumberBox=new NumberBox(GlobalData._currentContainer);
 		//	numBox.drawNumBox();
 		//	GlobalData._currentContainer.dContainer.addChild(numBox.parent.dContainer);
 			GlobalData._currentContainer.setChildContainer(numBox.drawNumber().parent);
 			GlobalData._currentContainer.dContainer.validateNow();
 		}

		public function displayOperand(opr:String):void
		{
		var oprdBox:OperandBox=new OperandBox(GlobalData._currentContainer);
		if(!operandFlag)
		{
		var CusOp:Custom_Operand=GlobalData.currentOperandBox;
		var lblText:Label=CusOp.drawLabel(opr);
		CusOp.opndBox.dContainer.removeAllChildren();
		CusOp.opndBox.dContainer.addChild(lblText);
		//Alert.show('the count id is '+CusOp.opndBox.countid);
		var oldM:MathNode=GlobalData.getMathNode(CusOp.opndBox.countid);
		oldM.nodetext=opr;
		GlobalData.setTable[CusOp.opndBox.countid]=oldM;
		//GlobalData.addNodetoTable('mi',oldM.nodeposition,oldM.nodeid,oldM.nodeparent,opr);
		
		//GlobalData._currentContainer.dContainer.focusManager.hideFocus();
		Application.application.focusManager.hideFocus();
		//operandFlag=true;
		}
		else
		{
		var disp:DisplayContainer=new DisplayContainer();
		disp=oprdBox.drawSymbol(opr).parent;
		oprdBox.setMiNodeEdit();
		GlobalData._currentContainer.setChildContainer(disp);
		operandFlag=true;
		}
		GlobalData._currentContainer.dContainer.validateNow();
		}

		public function generateMathML():void
			{
				myGrid.dataProvider=GlobalData.setTable;
				for each(var t:MathNode in GlobalData.setTable)
				{
				}
			    mathG.nodearray=GlobalData.setTable;
			    mathG.writeXML();			    
			}
			
		public function checkOperator(operator:String):Boolean
		{
			for(var index:int=0;index<operands_object.operands[1].length;index++)
			{
			if(operator==operands_object.operands[index])
			return true;
			}
			return false
		}

		public function initializeToolTip():void
		{
			ToolTipManager.showEffect=rotate
			ToolTipManager.showDelay=1000;
		}
		public function showToolTip(event:ToolTipEvent):void
		{
			initializeToolTip();
			var tool:ToolTip=ToolTip(event.toolTip)
			tool.minHeight=50
			tool.minWidth=50
			tool.setStyle('fontSize',30);		
	
		}
		public function displayOperator():void
		{
				var oprBox:OperatorBox=new OperatorBox();
				if(operatorFlag)
				{
					if(!afterFlag || !beforeFlag) 
					GlobalData._currentContainer=oprBox.Display(temporary);
					else
					GlobalData._currentContainer.dContainer.addChildAt(oprBox.Display(temporary).dContainer,0);
			  	}
				else
				{
				operatorFlag=true;
				}
				GlobalData.resetOperatorFlag();
				GlobalData._currentContainer.dContainer.validateNow();
		}	
			
 		public function displayArrow():void
		{
			var oprBox:ArrowBox=new ArrowBox();
			if(operatorFlag)
			{
				if(!afterFlag || !beforeFlag) 
					GlobalData._currentContainer=oprBox.Display(temporary);
				else
					GlobalData._currentContainer.dContainer.addChildAt(oprBox.Display(temporary).dContainer,0);
			}
			else
			{
				operatorFlag=true;
			}
			GlobalData.resetOperatorFlag();
			GlobalData._currentContainer.dContainer.validateNow();
		}
		public function deleteElement():void{
			var deleteSel:DisplayContainer=GlobalData._currentContainer;
			GlobalData.deleteChildrenOf(deleteSel.countid);
			deleteSel.dContainer.removeAllChildren();
			deleteSel.initializeBox();
		}
		public function setLabelFocus(event:MouseEvent):void
		{
			var hbox:HBox=HBox(event.target.parent)
			if(event.target==event.currentTarget)
			{
			hbox.setFocus()
			hbox.drawFocus(true)
			}
		}
		public function setFocusHbox(event:MouseEvent):void
		{
			if(event.target==event.currentTarget)
			{
			event.target.setFocus()
			event.target.drawFocus(true)
			}		
		}
		public function clearCanvas(event:MouseEvent):void
		{
			symbols_canvas.removeAllChildren();
			flag=0;
		}
 		public function initialize_operands(customlabel:String):void
 		{
 			
 			if(customlabel=='Numbers')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 					popup_arithmetic.rp.dataProvider=operands_object.numbers[1];
 			}
 			if(customlabel=='Operands')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 					popup_arithmetic.rp.dataProvider=operands_object.operands[1]
 			}
 			if(customlabel=='+')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 				{
 					popup_arithmetic.rp.dataProvider=operands_object.arithmetic[1]
 				}
 			}
 	 		if(customlabel=='=')
 	 		{
 	 	
 	 			if(menu_label=='Basic')
 	 			{
 	 		    
 	 			popup_arithmetic.rp.dataProvider=operands_object.relational[0];
 	 			}
 	 			else
 	 			{
 	 		
 	 			popup_arithmetic.rp.dataProvider=operands_object.relational[1];
 	 			}
 	 		}
 			if(customlabel=='Arrow')
 			{
 				if(menu_label=='Basic')
 					popup_arithmetic.rp.dataProvider=operands_object.arrows[0];
 				else
 				{
 					popup_arithmetic.rp.dataProvider=operands_object.arrows[1];	
 				}
 				
 			}
 			if(customlabel=='greek')
 			{
 				if(menu_label=='Basic')
					popup_arithmetic.rp.dataProvider=operands_object.greekCharacters[0];
				else
				{
					popup_arithmetic.rp.dataProvider=operands_object.greekCharacters[0];
					popup_arithmetic.rp.dataProvider=operands_object.greekCharacters[1];	
				}
				
			}
 			if(customlabel=='MathMl')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 					popup_arithmetic.rp.dataProvider=operands_object.mathTags[1];
 			}
 			if(customlabel=='Fence')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 					popup_arithmetic.rp.dataProvider=operands_object.fence[1];
 			}
 			if(customlabel=='mapsTo')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 					popup_arithmetic.rp.dataProvider=operands_object.mappingTypes[1];
 			}
 			if(customlabel=='Integral')
 			{
 				if(menu_label=='Basic'||menu_label=='Advanced')
 					popup_arithmetic.rp.dataProvider=operands_object.integralTypes[1];
 			}
 			addEventListener('value',func);	
 			
 		}
 		public function saveMathMLCode():void
 		{
 		var fR:FileReference=new FileReference();
 			//fR.
 		}
 		
 		public function getMathML():void
 		{
 			var param:Object=new Object();
 			var serviceobj:HTTPService=new HTTPService();
 			var index:int=equationNames.selectedIndex
 			param.EquationTitle=List_of_titles[index]
 			serviceobj.addEventListener(FaultEvent.FAULT,onFault);
 			serviceobj.addEventListener(ResultEvent.RESULT,resultHandler)
 			serviceobj.url="/../blazeds/EquationEditorFinal-debug/RetrieveMathML.jsp"
 			serviceobj.useProxy=false;
 			serviceobj.resultFormat="text"
 			serviceobj.send(param);
		 }
		 
		 public function resultHandler(event:ResultEvent):void
 		 {
		 	 var ResultValue:String=(event.result.toString());
		 //	 Alert.show('the mathml is '+ResultValue.toString());
		 	var displayMathML:EquationEditor=EquationEditor(Application.application);
		 	displayMathML.mathInput.text=new XML(ResultValue).toXMLString();
		}
 		public function doSave():void
 		{
 			var _url:URLLoader=new URLLoader();
 			strURL='/../blazeds/Upload files/image1.png'
 			var imagefilter:FileFilter=new FileFilter("Images(*.png)","*.png" );
 			var _imagearray:Array=new Array(imagefilter)
 			bitmapData=new BitmapData(myDisplay.dContainer.width,myDisplay.dContainer.height)
            bitmapData.draw(myDisplay.dContainer);
            bytearray = PNG.encode(bitmapData)
            try
            {
             req = new URLRequest('/../blazeds/EquationEditorFinal-debug/file2.jsp');  
			 req.method = URLRequestMethod.POST;  
 			req.data = bytearray;  
 			req.contentType="application/octet-stream";  
 			_url.load(req);
 			req= new URLRequest(strURL);  
 			
			 req.method = URLRequestMethod.GET;  
			 fileRef.download(req)
            }
            catch(error:IOError)
            {
            	Alert.show(error.getStackTrace());
            }
 		}
 		
 			public function checkSelection():void
 		{
 			
 			if(checkbox1.selected==true)
 			removeBorder(symbols_canvas)
 			else
 			{
 				addBorder(symbols_canvas)
 			}
 		}
 		
 		 public function addBorder(hbox1:*):void
 		{
 				var _children:Array=hbox1.getChildren();
 				
 			for (var i:int=0;i< _children.length;i++)
 			{
 				var _flag:Boolean=false;
 				var	_displayObject:*=_children[i];
 				 for(var index:int=0;index<GlobalData.identityArray.length;index++)
 				{
 					if(_displayObject.name==GlobalData.identityArray[index])
 					_flag=true;
 				}	 		
 				if(_displayObject is HBox&&_flag)
 				{
 				_displayObject.setStyle('borderColor','#dad8d8')
 				_displayObject.setStyle('borderThickness','2')
				_displayObject.setStyle('borderStyle','solid')
				_displayObject.drawFocus(true);
 				}
			 		 if(_displayObject.numChildren>0&&!(_displayObject is Label))
 					addBorder(_displayObject)
 				
 			 }
 		}
 		 public function removeBorder(hbox1:*):void
 		{
 			var _children:Array=hbox1.getChildren();
 			for (var i:int=0;i< _children.length;i++)
 			{
 				var	_displayObject:*=_children[i];
 			 		_displayObject.clearStyle('borderColor')
 					_displayObject.clearStyle('borderThickness')
 					_displayObject.clearStyle('borderStyle')
 					_displayObject.drawFocus(false);
 			 		 if(_displayObject.numChildren>0&&!(_displayObject is Label))
 					removeBorder(_displayObject)
 			 }
 		 }
 
 		
  		 public function getTitle():void
 		 {
 		 	if(_closeflag==0)
 		 	{
 		 	_titlePanel=new Panel();
 		 	_control=new ControlBar();
 		 	_control.setStyle('horizontalAlign','right')
 		 	var _submit:Button=new Button();
 		 	var _cancel:Button=new Button();
 		 	_cancel.label="Cancel"
 		 	_titlePanel.setStyle('addedEffect','PanelZoom');
 		 	_titlePanel.setStyle('removedEffect','PanelDissolve');
 		 	_titlePanel.setStyle('horizontalAlign','center');
 		 	_titlePanel.x=350;
 		 	_titlePanel.y=155;
 		 	_titlePanel.title="Equation";
 		 	var _form:FormItem=new FormItem();
 		 	_form.label="Enter the title";
 		 	 _titlevalue=new TextInput();
 		 	 
 		 	 _form.addChild(_titlevalue);
 		 	_titlePanel.addChild(_form);
 		 	_titlePanel.addChild(_submit);
 		 	_titlePanel.addChild(_cancel);
 		 	_submit.label="Submit";
 		 	_submit.addEventListener(MouseEvent.CLICK,returnvalue);
 		 	_cancel.addEventListener(MouseEvent.CLICK,closePanel);
 		 	addChild(_titlePanel);
 		 	_closeflag=1;
 		 	}
 		  }
 		 public function closePanel(event:MouseEvent):void
 		 {
 				this.removeChild(_titlePanel)
 				_closeflag=0;	 
 		 }
 		 public function returnvalue(event:MouseEvent):void
 		 {
 		 	var flag:int=0;
 		 	equationtitle=_titlevalue.text;
 		 	 for(var i:int=0;i<List_of_titles.length;i++)
 		 	{
 		 		if(List_of_titles[i]==equationtitle)
 		 		{
 		 			flag=1;
 		 			_titlevalue.text="";
 		 			break;
 		 		}	
 		 		if(equationtitle=='')
 		 		{
					flag=1;
 		 			_titlevalue.text="";
 		 			break;
 		 			_titlevalue.errorString="Enter the title"
 		 		
 		 		}
 		 	}
 		 	if(flag==0)
 		 	{
 		 		
 		 	equationtitle=_titlevalue.text	
			 removeChild(_titlePanel)
			 service.send();
			 initList();
 		 	}
 		 	_closeflag=0;
 		 }
 		 
 		 public function doPublish():void
 		 {
 		 	
 		 	getTitle();
 		 	generateMathML();
 		 	UID=UIDUtil.createUID();
 		 	username=loginvalue.text;
 		 	storeuser=username;
 		 	storeMathML=mathG.mathml.toString();
 		    //Alert.show('updated mathml is '+mathG.mathml.toString());
 		    mathInput.text=new XML(mathG.mathml.toString()).toXMLString();
 		  }
 		  
		 public function onResult(event:ResultEvent):void
		 {
		 	var i:int=0;
		 	 var ResultValue:XML=XML(event.result)
		 	 List_of_titles=new Array();
		 	 for each(var xml1:XML in ResultValue.children())
		 	 {
     		 	List_of_titles[i]=(xml1.toString());
     		 	i++;
    		 }
    		
    		 equationNames.dataProvider=List_of_titles;
    	 }
    	
    	public function onFault(evt:FaultEvent):void
    	{
    	//	Alert.show('fauly'+evt.fault.getStackTrace());
    	}
	 public function initMatrix():void
		 {

 		 	matrixPanel_obj=new MatrixPanel();
 		 	matrixPanel_obj.initMat();
 		 	matrixWindow=matrixPanel_obj.addResizeListeners();

 		 }
		public function openMatrix():void
		{
			
			matrixWindow.addEventListener(MouseEvent.CLICK,closMatrix);
	//		matrixWindow.showCloseButton=true;
 			matrixWindow.x=120;
 			matrixWindow.y=50;
 			this.addChild(matrixWindow);
 			matrixPanel_obj.reinitialise();
		}
		public function closMatrix(event:MouseEvent):void
		{
			this.removeChild(TitleWindow(event.target))
		}

		
