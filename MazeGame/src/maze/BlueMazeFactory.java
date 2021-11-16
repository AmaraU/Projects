package maze;

public class BlueMazeFactory extends MazeFactory{

    @Override
    public Door MakeDoor(Room r1, Room r2) {
        BrownDoor theDoor = new BrownDoor(r1, r2);
        return theDoor;
    }

    @Override
    public Wall MakeWall() {
        BlueWall theWall = new BlueWall();
        return theWall;
    }

    @Override
    public Room MakeRoom(int i) {
        GreenRoom theRoom = new GreenRoom(i);
        return theRoom;
    }

}
