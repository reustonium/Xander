package  {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author reustonium
	 */
	public class Player extends Entity {
		
		public var sprite:Image
		public var speed:Number;
		public var jumpTime:Number;
		public var sSinceLastJump:Number;
		
		public function Player() {
			sprite = new Image(Assets.PLAYER);
			addGraphic(sprite)
			
			speed = 10;
			
			setHitbox(64, 64);
			type = "player";
		}
		
		override public function update():void {
			super.update();
			this.x += FP.elapsed * speed;
			speed++;
			
			if (Input.check(Key.SPACE)) {
				this.y -= 10;
			}
			
			
			sSinceLastJump += FP.elapsed;
		}
		
	}

}