package maze;

import java.awt.*;

public class PinkRoom extends Room {

    public PinkRoom(int num) {
        super(num);
    }

    @Override
    public Color getColor() {
        return Color.PINK;
    }
}
