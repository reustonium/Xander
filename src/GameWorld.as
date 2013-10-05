package  {
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author reustonium
	 */
	public class GameWorld extends World{
		public var bg:Backdrop;
		
		public function GameWorld() {
			bg = new Backdrop(Assets.BG, false, false);
			addGraphic(bg);
		}
		
	}

}