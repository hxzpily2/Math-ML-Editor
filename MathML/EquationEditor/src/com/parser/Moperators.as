package com.parser
{
	public class Moperators
	{
		public var operators:Object=new Object();
		public var specialO:Array=new Array();
		public function Moperators()
		{
			 specialO["&sum;"]=  "∑";
          specialO["&prod;"]=  "∏";
           specialO["&int;"]=  "∫";specialO["&Int;"]=  "∬";
		 operators['&PlusMinus;']='±';operators["&times;"]='×';
         operators["&GreaterEqual;"]="≥";operators["&divide;"]="÷";
         operators["&int;"]="∫";operators["&infinity;"]="∞";
         operators["&sum;"]="∑";operators["&prod;"]= "∏";
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
		     
        
         
         
	}
}