package  {
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author reustonium
	 */
	public class GameWorld extends World{
		public var bg:Backdrop;
		public var bg1:Backdrop;
		public var player:Player;
		public var clock:Clock;
		
		public function GameWorld() {
			bg = new Backdrop(Assets.BG, true, false);
			bg1 = new Backdrop(Assets.BG1, true, false);
			bg1.scrollX = 0.5;
			
			addGraphic(bg);
			addGraphic(bg1);
			
			player = new Player();
			player.x = 100;
			player.y = FP.height - 150;
			add(player);
			
			clock = new Clock(-1);
			clock.x = 800;
			clock.y = FP.rand(250) + 80;
			add(clock);
		}
		
		override public function update():void {
			super.update();
			
			FP.camera.x = player.x - 150;
			if (player.x - clock.x > 150) {
				clock.y = FP.rand(250) + 80;
				clock.moveBy(FP.rand(250) + 800, 0);
				clock.setSpeed(Math.floor(FP.rand(4) - 2));
			}
		}
		
	}

}