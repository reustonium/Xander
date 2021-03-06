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
		
		public var yVel:Number;
		public var gravity:Number;
		public var canJump:Boolean;
		public var fillJumpMeter:Boolean;
		public var jumpPower:Number;
		public var slowdownTime:Number;
		
		
		public function Player() {
			sprite = new Image(Assets.PLAYER);
			addGraphic(sprite)
			
			speed = 10;
			
			setHitbox(64, 64);
			type = "player";
			
			yVel = 0;
			gravity = 1280;
			canJump = true;
			fillJumpMeter = false;
			jumpPower = 0;
			slowdownTime = 0;
		}
		
		override public function update():void {
			super.update();
			this.x += FP.elapsed * speed;
			speed += 0.5;
			
			(this.y < 280) ? canJump=false : canJump= true;
			
			if (Input.pressed(Key.SPACE) && canJump) {
				jumpPower = 0;
				fillJumpMeter = true;
				trace("Spacebar Pressed");
			}
			
			if (fillJumpMeter) {
				if (Input.check(Key.SPACE)) {
					jumpPower -= 60;
				}
								
				if (Input.released(Key.SPACE)) {
					trace("Spacebar Released");
					if (jumpPower < -800) {
						jumpPower = -800;
					}
					trace(jumpPower);
					yVel = jumpPower;
					fillJumpMeter = false;
					canJump = false;
				}
			}
			
			var c:Clock = collide("clock", x, y) as Clock;
			if (c) {	
				c.y = FP.rand(250) + 80;
				c.moveBy(FP.rand(250) + 800, 0);
				c.setSpeed(Math.floor(FP.rand(6) - 3));
				trace('hit clock');
				slowdownTime = 0.5;
			}
			
			if (slowdownTime > 0) {
				speed -= 100 * FP.elapsed;
				slowdownTime -=FP.elapsed;
			}
			
			applyPhysics();
		}
		
		private function applyPhysics():void {
			this.y += yVel * FP.elapsed;
			yVel += gravity * FP.elapsed;
			if (this.y > 330) {
				this.y = 330;
				yVel = 0;
			}
		}
		
	}

}