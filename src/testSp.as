package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class testSp extends Sprite
	{
		private var cw:ChinesWord;
		private var sp:Shape
		public function testSp()
		{
			super();
			sp=new Shape();
			sp.graphics.beginFill(0x00ccff,1);
			sp.graphics.drawRect(0,0,150,150);
			sp.graphics.endFill();
			//sp.buttonMode=true;
			addChild(sp);
			sp.x=-sp.width/2;
			sp.y=-sp.height/2;
			this.addEventListener(MouseEvent.CLICK,onClickHandle);
			cw=new ChinesWord();
			cw.word.text="上";
			cw.mouseEnabled=false;
			addChild(cw);
			cw.x=-sp.width/2;;
			cw.y=-sp.height/2;
		}
		
		protected function onClickHandle(event:MouseEvent):void
		{
			if(cw.y==-sp.height/2)
			{
				cw.y+=10;
			}
			else
			{
				cw.y=-sp.height/2;
			}
		}
	}
}