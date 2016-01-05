package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.utils.setTimeout;
	
	public class Content extends Sprite
	{
		private var _targetBmp:Bitmap;
		private var _targetBmd:BitmapData;
		private var _stage:Stage;
		private var _pArr:Array=new Array();
		private var _cArr:Array=new Array();
		private var _radDep:Number;
		
		private var R:uint=200;
		
		public function Content(stage:Stage)
		{
			super();
			_stage=stage;
			addPic()
		}
		
		private function addPic():void
		{
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderOverHandle);
			loader.load(new URLRequest("app:/img/testIcon.png"));
		}
		
		protected function onLoaderOverHandle(event:Event):void
		{
			_targetBmp=event.target.content as Bitmap;
			_targetBmd=(event.target.content as Bitmap).bitmapData;
			this.addChild(_targetBmp);
			_targetBmp.alpha=0;
			_targetBmp.x=-_targetBmd.width/2;
			_targetBmp.y=-_targetBmd.height/2;
			getPoints();
			addLogo();
		}
		
		private function addLogo():void
		{
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderLogoHandle);
			loader.load(new URLRequest("app:/img/LOGO.png"));
		}
		
		protected function onLoaderLogoHandle(event:Event):void
		{
			var logo:Bitmap=event.target.content as Bitmap;
			addChild(logo);
			logo.x=-logo.width/2;
			logo.y=this.height/2-logo.height-20;
		}
		
		private function getPoints():void
		{
			for(var i:uint=0;i<	_targetBmd.width;i++)
			{
				for(var j:uint=0;j<	_targetBmd.height;j++)
				{
					if((_targetBmd.getPixel32(i*6,j*6)>>24&0xFF)!=0)
					{
						var p:Point=new Point(i*6,j*6);
						_pArr.push(p);
					}
				}
			}
			_radDep=360/_pArr.length;
			drawCircle();
		}
		
		private function drawCircle():void
		{
			for(var i:uint=0;i<_pArr.length;i++)
			{
				var cir:Circle=new Circle();
				cir.color=Math.random()*0xFFFFFF;
				addChild(cir);
				var radV:Number=int(Math.random()*180-90)/180*Math.PI;
				var radH:Number=int(Math.random()*360);
				var r:Number=R*Math.cos(radV);
				cir.x=r*Math.cos(radH);
				cir.y=R*Math.sin(radV);
				cir.z=r*Math.sin(radH);
				cir.scaleX=cir.scaleY=Math.abs(cir.z-R)/R/2
				cir.pos.x=cir.x;
				cir.pos.y=cir.y;
				cir.pos.z=cir.z;
				cir.pos.scale=cir.scaleX;
				cir.target.x=_pArr[i].x;
				cir.target.y=_pArr[i].y
				_cArr.push(cir);
			}
			
			toPic();
		}
		
		private function toPic():void
		{
			for(var j:uint=0;j<_cArr.length;j++)
			{
				TweenLite.to(_cArr[j],2,{x:_cArr[j].target.x-_targetBmd.width/2,y:_cArr[j].target.y-_targetBmd.height/2,scaleX:1,scaleY:1,z:0});
			}
			//setTimeout(showPic,2000)
			setTimeout(dpFunction,4000);
		}
		
		private function showPic():void
		{
			for(var j:uint=0;j<_cArr.length;j++)
			{
				TweenLite.to(_cArr[j],1,{alpha:0});
			}
			TweenLite.to(_targetBmp,2,{alpha:1});
		}
		
		private function dpFunction():void
		{
			for(var i:uint=0;i<_cArr.length;i++)
			{
				var targetX:Number=_cArr[i].pos.x;
				var targetY:Number=_cArr[i].pos.y;
				var targetZ:Number=_cArr[i].pos.z;
				var targetScale:Number=_cArr[i].pos.scale;
				TweenLite.to(_cArr[i],2,{x:targetX,y:targetY,scaleX:targetScale,scaleY:targetScale,z:targetZ});
			}
			
			setTimeout(grFunction,4000);
		}
		
		private function grFunction():void
		{
			toPic();
		}
	}
}
