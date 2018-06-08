class SplashState < State

    def initialize
        @alpha = 255

        @logos = [
            Sprite.new("res/nes_controller.png"),
            Sprite.new("res/snes_controller.png"),
            Sprite.new("res/ruby.png")
        ]

        @logos.each do |logo|
            logo.scale_x = 0.5
            logo.scale_y = 0.5
        end

        @logos_pos = []

        x = -140

        while x < StateManager.window.width
            
            @logos_pos << Vector2.new(x, StateManager.window.height - 100)

            x += 140
        end
    end

    def update(input)
        @alpha -= 2 if @alpha > 0
        @alpha = 0 if @alpha < 0

        ObjectManager.get("GosuLogo").y += @alpha / 30.0
    end

    def draw
        ObjectManager.get("Bg").draw

        ObjectManager.get("GosuLogo").draw

        ObjectManager.get("Font").text = "Launcher"
        ObjectManager.get("Font").color = Color::BLACK
        ObjectManager.get("Font").scale_x = 0.5
        ObjectManager.get("Font").scale_y = 0.5
        ObjectManager.get("Font").x = (StateManager.window.width - ObjectManager.get("Font").width) / 2 + 40
        ObjectManager.get("Font").y = StateManager.window.height - ObjectManager.get("GosuLogo").y - 105

        ObjectManager.get("Font").draw

        i = 0
        @logos_pos.each do |pos|
            @logos[i % @logos.size].position = pos
            @logos[i % @logos.size].draw
            pos.x += 5

            if pos.x > (@logos_pos.size - 1) * 140
                pos.x = -140
            end

            i += 1
        end

        Gosu.draw_rect(0,
            0,
            StateManager.window.width,
            StateManager.window.height,
            Color.new(@alpha, 255, 255, 255),
            0)
    end

end