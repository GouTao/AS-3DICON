package
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	public class ThreeDIconEffect extends Sprite
	{
		[Embed(source="../src/img/basic.jpg")]
		private var imgClass:Class;
		
		private var content:Content;
		private var dx:Number=0;
		private var dy:Number=0;
		
		private var load:URLLoader;
		//private var url1:String="http://218.240.47.219:8081/fbtj/webChat/offerNum?organid=1001&user=oXRgHt37puZ9VI7Db2g-4j2geHmo&queueid=2";
		//private var url2:String="http://218.240.47.219:8081/fbtj/webChat/beforeWaitNum?organid=1001&user=oXRgHt37puZ9VI7Db2g-4j2geHmo";
		private var url:String="http://192.168.199.203:6003/?callback=callback";
		
		private var sp:testContent;
		
		public function ThreeDIconEffect()
		{
			var basic:DisplayObject=new imgClass();
			basic.width=stage.stageWidth;
			basic.height=stage.stageHeight;
			addChild(basic);
			initMode();
			
			testHttp();
			
		}
		
		protected function onRoHandle(event:MouseEvent):void
		{
			sp.rotationZ+=180;
		}
		
		private function testHttp():void
		{
			sp=new testContent();
			addChild(sp);
			sp.x=stage.stageWidth/2;
			sp.y=stage.stageHeight/2;
			//sp.rotationZ=180;
		}
		
		protected function onComHandle(event:Event):void
		{
			
		}
		
		private function initMode():void
		{
			var cw1:ChinesWord=new ChinesWord();
			cw1.word.text="被";
			addChild(cw1);
			var cw2:ChinesWord=new ChinesWord();
			cw2.word.text="墙";
			addChild(cw2);
			var cw3:ChinesWord=new ChinesWord();
			cw3.word.text="了";
			addChild(cw3);
			cw2.x=160;
			cw3.x=320;
			
			
			var cw11:ChinesWord=new ChinesWord();
			cw11.word.text="下";
			addChild(cw11);
			var cw21:ChinesWord=new ChinesWord();
			cw21.word.text="个";
			addChild(cw21);
			var cw31:ChinesWord=new ChinesWord();
			cw31.word.text="卵";
			addChild(cw31);
			cw21.x=160;
			cw31.x=320;
			cw11.y=cw21.y=cw31.y=160;
			
			content=new Content(stage);
			addChild(content);
			content.x=stage.stageWidth/2-content.width/2;
			content.y=stage.stageHeight/2-content.height/2;
			
			stage.addEventListener(Event.ENTER_FRAME,onChangeHandle);
			content.addEventListener(MouseEvent.CLICK,onRoHandle);
		}
		
		protected function onChangeHandle(event:Event):void
		{
			dx=mouseX-stage.stageWidth/2;
			dy=mouseY-stage.stageHeight/2;
			content.rotationX=dy/(stage.stageWidth/2)*30;
			content.rotationY=-dx/(stage.stageHeight/2)*30;
		}
		
	
	}
}