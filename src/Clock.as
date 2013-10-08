package  {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author reustonium
	 */
	public class Clock extends Entity {
		public var speed:int;
		
		public function Clock(_speed:int) {
			speed = _speed;
			addGraphic(new Image(Assets.CLOCK));
			setHitbox(80, 80);
			type = "clock";
		}
		
		public function setSpeed(_speed:int):void {
			if (_speed < -2) {
				speed = -2;
			} else if (_speed > 2) {
				speed = 2;
			}
			else { 
				speed = _speed;
			}
		}
		
		override public function update():void {
			super.update();
			x += speed;
		}
		
	}

}