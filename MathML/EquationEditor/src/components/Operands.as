package components
{
	import flash.utils.Dictionary;
	
	
	public class Operands 
	{
		import mx.controls.Alert;
		
		[Bindable]
		public var operands : Array = new Array()
		public var operandsC : Array = new Array()
		public var numbers : Array = new Array()
		public var arithmetic : Array = new Array()
		public var relational : Array=new Array();
		public var arrows:Array=new Array()
		public var greekCharacters:Array=new Array();	
		public var mathTags:Array=	new Array();
		public var fence:Array=new Array();	
		public var mappingTypes:Array=new Array();
		public var integralTypes:Array=new Array();
		public var summationTypes:Array=new Array();
		public var mo_Xml:XML;
		public var operators:Object=new Object();
		
		public  function Operands()
		{
			
			fence[1]=['()','[]','{}'];
			mathTags[1]=['Fraction','Under','Over','UnderOver','SuperScript','SubScript','Sqrt' ,'Root'];
			arithmetic[1]=['+','-','*','%'];
			operandsC[1]=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','α','β','γ','δ','ε','θ','λ','μ','π','σ','τ','ω'];
			operandsC[2]=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','&Alpha;','&Beta;','&Gamma;','&Delta;','&Epsilon;','&Theta;','&lambda;','&Mu;','&Pi;','&Sigma;','&tau;','&Omega;'];
			operands[1]=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
			operands[2]=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
			numbers[1]=[0,1,2,3,4,5,6,7,8,9];
			numbers[2]=[0,1,2,3,4,5,6,7,8,9];
			relational[0]=['<','>','=','!','≤','≥','∼'];
			relational[1]=['<','>','=','!','≤','≥','∼','≪','≫','≈','≃','≅','≠','≡','≜','≙','≐','∝'];
			arrows[0]=['←','↑','→','↓','↔','↕','↼','↽','⇀','⇁']
			arrows[1]=['←','↑','→','↓','↔','↕','↼','↽','⇀','⇁','↖','↗','↘','↙','↤','↥','↦','↧','↾','↿','⇂','⇃','⇄','⇅','⇆','⇐','⇑','⇒','⇓','⇔']
			arrows[2]=['LeftArrow','UpArrow','RightArrow','DownArrow','LeftRightArrow','UpDpwnArrow','leftharpoonup','leftharpoondown','rightharpoonup','rightharpoondown','UpperLeftArrow','UpperRightArrow','LowerRightArrow','LowerLeftArrow','LeftTeeArrow','UpTeeArrow','RightTeeArrow','DownTeeArrow','upharpoonright','upharpoonleft','downharpoonright','downharpoonleft','RightArrowLeftArrow','UpArrowDownArrow','LeftArrowRightArrow','DoubleLeftArrow','DoubleUpArrow','DoubleRightArrow','DoubleDownArrow','DoubleLeftRightArrow'];
			greekCharacters[0]=['α','β','γ','δ','ε','θ','λ','μ','π','σ','τ','ω']	
			greekCharacters[1]=['α','β','γ','δ','ε','θ','λ','μ','π','σ','τ','ω']
			//greekCharacters[1]=['α','β','γ','δ','ε','θ','λ','μ','π','σ','τ','ω','ζ','η','ι','κ','ν','ξ','ο','ρ','ς','υ','φ','χ','ψ']
			greekCharacters[2]=['Alpha','Beta','Gamma','Delta','Epsilon','Theta','lambda','Mu','Pi','Sigma','tau','Omega']
			
			mappingTypes[1]=['mapOver','mapUnder','mapOverUnder'];
			integralTypes[1]=['∫','∬','∭','∮','∯','∰','∱','∲','∳'];
			integralTypes[2]=['int','Int','iiint','conint','Conint','oint','cwint','cwconint','awconint'];
			summationTypes[1]=['Σ'];
			summationTypes[2]=['sum'];
		 
		 operators['&PlusMinus;']='±';operators["&times;"]='×';
         operators["&GreaterEqual;"]="≥";operators["&divide;"]="÷";
         operators["&infinity;"]="∞";
         operators["&prod;"]= "∏";
         operators["&lt;"]="<";operators["&le;"]="≤";
         operators["&CloseCurlyDoubleQuote;"]='”';
         operators["&CloseCurlyQuote;"]="’";operators["&LeftAngleBracket;"]="<";
         operators["&LeftBracketingBar;"]="|";operators["&LeftCeiling;"]="⌈";
         operators["&LeftDoubleBracket;"]="《";operators["&LeftFloor;"]="⌊";
         operators["&LeftDoubleBracketingBar;"]="||";operators["&DoubleVerticalBar;"]="||";
         operators["&OpenCurlyDoubleQuote;"]='“';operators["&OpenCurlyQuote;"]="‘";
         operators["&RightAngleBracket;"]=">";operators["&RightBracketingBar;"]="|";
         operators["&RightCeiling;"]="⌉";operators["&RightDoubleBracket;"]="》";
         operators["&RightDoubleBracketingBar;"]="||";operators["&DoubleVerticalBar;"]="||";
         operators["&RightFloor;"]="⌋";operators["&VerticalSeparator;"]="|";
         operators["&DoubleLeftArrow;"]="⇐";operators["&DoubleLeftRightArrow;"]="⇔";
		}
		
		public function moXML():XML
		{
			//var root:String="<intgeral/>";
			var i:int;
			var str:String;
			var mo_Xml1:XML=<integral />;
			for(i=0;i<integralTypes[1].length;i++)
			{
				str='<'+integralTypes[2][i].toString()+'>'+integralTypes[1][i].toString()+'</'+integralTypes[2][i].toString()+'>';
				mo_Xml1.appendChild(str);
			}
			
			var mo_Xml2:XML=<arrows/>;
			for(i=0;i<arrows[1].length;i++)
			{
				str='<'+arrows[2][i].toString()+'>'+arrows[1][i].toString()+'</'+arrows[2][i].toString()+'>';
				mo_Xml2.appendChild(str);
			}
			
			var mo_Xml3:XML=<summation/>;
			for(i=0;i<summationTypes[1].length;i++)
			{
				str='<'+summationTypes[2][i].toString()+' >'+summationTypes[1][i].toString()+'</'+summationTypes[2][i].toString()+'>';
				mo_Xml3.appendChild(str);
			}
			var mo_Xml4:XML=<operands/>;
			for(i=0;i<greekCharacters[1].length;i++)
			{
				
				str='<'+greekCharacters[2][i].toString()+' >'+greekCharacters[1][i].toString()+'</'+greekCharacters[2][i].toString()+'>';
				mo_Xml4.appendChild(str);
			}	
			//Alert.show('greek xml'+mo_Xml4.toString());
			for(i=0;i<operands[1].length;i++)
			{
				str='<'+operands[2][i].toString()+' >'+operands[1][i].toString()+'</'+operands[2][i].toString()+'>';
				mo_Xml4.appendChild(str);
			}	
			for(i=0;i<numbers[1].length;i++)
			{
				str='<'+numbers[2][i].toString()+' >'+numbers[1][i].toString()+'</'+numbers[2][i].toString()+'>';
				mo_Xml4.appendChild(str);
			}	
			mo_Xml=<symbols/>
			mo_Xml.appendChild(mo_Xml1);
			mo_Xml.appendChild(mo_Xml2);
			mo_Xml.appendChild(mo_Xml3);
			mo_Xml.appendChild(mo_Xml4);
			return mo_Xml;
		}
		 
	}
}