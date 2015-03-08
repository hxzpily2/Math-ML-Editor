package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import mx.controls.Label;
	public  class BitmapHandler1
	{
			[Embed(source='Fonts/STIXGeneral.otf',
		fontName='myStixFont', fontWeight='Normal',
		mimeType='application/x-font')]
		private var font1:Class;
	
		public function bitmapHandler(txtChr:String,bitmapHgt:Number,bitmapWdt:Number=50,fontHgt:Number=135,fontWdt:Number=40,autoFormat:Boolean=true,y_co_or:Boolean=false):Label
		{
			var txtLbl:Label=new Label();
			var txtChar:TextField=new TextField();
    		var tfor:TextFormat=new TextFormat();
			txtChar.text=txtChr;
			txtChar.height=fontHgt;
			txtChar.width=fontWdt;
			txtChar.embedFonts=true;
			if(autoFormat==true)
			{
				txtChar.autoSize=TextFieldAutoSize.LEFT;
   			}
   		//	txtChar.antiAliasType=AntiAliasType.NORMAL;

    		tfor.size=120;
  			tfor.font='myStixFont';
			tfor.align="center";
    		txtChar.setTextFormat(tfor);
	
			var operaTxt:BitmapData=new BitmapData(txtChar.width,txtChar.height,true,0);
			operaTxt.draw(txtChar);
	
			var bmp:Bitmap= new Bitmap(operaTxt);
       		bmp.height=bitmapHgt;
    		bmp.width=bitmapWdt;//hgt*2/3;
    		if(bmp.width!=50)
    			bmp.x=-(bmp.width*2/5);
    		else
    			bmp.x=-20;
    		bmp.y=-(bitmapHgt/4);	
    		if(y_co_or)
    		bmp.x=0;
    				
    		txtLbl.setStyle('borderStyle','none');
			txtLbl.setStyle('backgroundAlpha','0.0');
			txtLbl.setStyle('backgroundColor','#FFF888');
			txtLbl.addChild(bmp);
           // txtLbl.setStyle('paddingBottom','0.003');
			return txtLbl;
		}
		
			public function integralSymbol(txtChr:String,bitmapHgt:Number,bitmapWdt:Number=50,fontHgt:Number=135,fontWdt:Number=40,autoFormat:Boolean=true):Label
		{
			var txtLbl:Label=new Label();
			var txtChar:TextField=new TextField();
    		var tfor:TextFormat=new TextFormat();
			txtChar.text=txtChr;
			txtChar.height=fontHgt;
			txtChar.width=fontWdt;
			txtChar.embedFonts=true;
			if(autoFormat==true)
			{
				txtChar.autoSize=TextFieldAutoSize.LEFT;
   			}
   		//	txtChar.antiAliasType=AntiAliasType.NORMAL;

    		tfor.size=120;
  			tfor.font='myStixFont';
			tfor.align="center";
    		txtChar.setTextFormat(tfor);
	
			var operaTxt:BitmapData=new BitmapData(txtChar.width,txtChar.height,true,0);
			operaTxt.draw(txtChar);
	
			var bmp:Bitmap= new Bitmap(operaTxt);
       		bmp.height=bitmapHgt;
    		bmp.width=bitmapWdt;//hgt*2/3;
    		if(bmp.width!=50)
    			bmp.x=-(bmp.width*2/5);
    		else
    			bmp.x=-20;
    			
    		bmp.y=-(bitmapHgt/2);
    
    		txtLbl.setStyle('borderStyle','none');
			txtLbl.setStyle('backgroundAlpha','0.0');
			txtLbl.setStyle('backgroundColor','#FFF888');
			txtLbl.addChild(bmp);
           // txtLbl.setStyle('paddingBottom','0.003');
			return txtLbl;
		}
		
			public function drawRoot(hgt:Number,txtChr:String):Label
		{
			var txtLbl:Label=new Label();
			txtLbl.setStyle('borderStyle','none');
			txtLbl.setStyle('backgroundAlpha','0.0');
			txtLbl.setStyle('fontFamily','myStixFont');
			var txtChar:TextField=new TextField();
			txtChar.embedFonts=true;
			txtChar.autoSize=TextFieldAutoSize.LEFT;
    		var tfor:TextFormat=new TextFormat();
			tfor.size=120;
			tfor.font='myStixFont';
			tfor.align="center";
			txtChar.antiAliasType=AntiAliasType.NORMAL;
			txtChar.text=txtChr;
			txtChar.height=165;
			txtChar.width=100;
    		txtChar.setTextFormat(tfor);
			var operaTxt:BitmapData=new BitmapData(100,165,true,0XFF1234)
			operaTxt.draw(txtChar);
			var bmp:Bitmap = new Bitmap(operaTxt);
    		bmp.height=hgt+(hgt*1/3);
    		bmp.width=40;
    	//bmp.x=-(bmp.height/4);
    		bmp.y=-(bmp.height/4);
   			txtLbl.addChild(bmp);
			return txtLbl
		}
	}
}