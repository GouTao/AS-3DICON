package
{
	import flash.display.Shape;
	
	public class Circle extends Shape
	{
		private var _color:uint=0x000000;
		
		private var _pos:Object=new Object();
		private var _target:Object=new Object();
		
		public function Circle()
		{
			super();
			drawFunction();
		}
		
		private function drawFunction():void
		{
			this.graphics.beginFill(color,.8);
			this.graphics.drawCircle(0,0,2);
			this.graphics.endFill();
		}
		
		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
			this.graphics.clear();
			drawFunction();
		}

		public function get pos():Object
		{
			return _pos;
		}

		public function set pos(value:Object):void
		{
			_pos = value;
		}

		public function get target():Object
		{
			return _target;
		}

		public function set target(value:Object):void
		{
			_target = value;
		}


	}
}