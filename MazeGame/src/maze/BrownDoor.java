package maze;

import java.awt.*;

public class BrownDoor extends Door{


    public BrownDoor(Room r1, Room r2) {
        super(r1, r2);
    }

    public static final Color BROWN = new Color(153,102,0);

    @Override
    public Color getColor() {
        return BROWN;
    }
}
