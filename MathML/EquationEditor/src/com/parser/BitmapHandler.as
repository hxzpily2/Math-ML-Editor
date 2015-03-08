package com.parser
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.controls.Label;
	public  class BitmapHandler
	{
	/*		[Embed(source='Fonts/STIXGeneral.otf',
		fontName='myStixFont', fontWeight='Normal',
		mimeType='application/x-font')]
		private var font1:Class;
		*/
		public function BitmapHandler()
		{
		}
		public   function bitmapHandler(hgt:Number,txtChr:String,bmpWdt:Number=50):Label
		{
			var txtLbl:Label=new Label();
			txtLbl.setStyle('borderStyle','none');
			txtLbl.setStyle('backgroundAlpha','0.0');
			var txtChar:TextField=new TextField();
    		var tfor:TextFormat=new TextFormat();
			txtChar.text=txtChr;
			txtChar.height=135;
			txtChar.width=70;
		//	tfor.font='myStixFont';
    		tfor.size=120;
    		txtChar.setTextFormat(tfor);
			var operaTxt:BitmapData=new BitmapData(70,135,true,0XFFFFFF);
			operaTxt.draw(txtChar);
			var bmp:Bitmap= new Bitmap(operaTxt);
    		bmp.height=hgt+(hgt/4);
    		bmp.width=bmpWdt;
    		bmp.y=-(bmp.height/6);
  			txtLbl.addChild(bmp);
			return txtLbl;
		}
			public function drawRoot(hgt:Number,txtChr:String):Label
		{
			var txtLbl:Label=new Label();
			txtLbl.setStyle('borderStyle','none');
			txtLbl.setStyle('backgroundAlpha','0.0');
			var txtChar:TextField=new TextField();
    		var tfor:TextFormat=new TextFormat();
			txtChar.text=txtChr;
			txtChar.height=135;
			txtChar.width=70;
    		tfor.size=120;
    			//tfor.font='myStixFont';
    		txtChar.setTextFormat(tfor);
			var operaTxt:BitmapData=new BitmapData(70,135,true,0XFF1234)
			operaTxt.draw(txtChar);
			var bmp:Bitmap = new Bitmap(operaTxt);
    		bmp.height=hgt+(hgt*1/3);
    		bmp.width=40;
    		//bmp.y=-(bmp.height/5);
   			txtLbl.addChild(bmp);
			return txtLbl;
		}
	}
}