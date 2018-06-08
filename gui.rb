require_relative "neogame_0_4"

include Neogame

require_relative "splash_state"

class LauncherWindow < Window

    def initialize
        super Settings.new(1280, 640, false, "Gosu Launcher")

        ObjectManager.set(Sprite.new("res/background.png"), "Bg")

        logo = Sprite.new("res/libgosu_logo.png")
        logo.x = (self.width - logo.width) / 2
        logo.y = -logo.height - 200
        logo.scale_x = 1.2
        logo.scale_y = 1.2

        ObjectManager.set(logo, "GosuLogo")

        ObjectManager.set(SpriteFont.new(StateManager.window, "res/Ubuntu-R.ttf", 80), "Font")

        StateManager.initialize(self)
        StateManager.add_state(:splash, SplashState.new)

        StateManager.set_state(:splash)

        @use_cursor = true
    end

    def update
        StateManager.update
    end

    def draw
        StateManager.draw
    end

end

LauncherWindow.new.run()