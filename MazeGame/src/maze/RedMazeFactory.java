package maze;


public class RedMazeFactory extends MazeFactory{

    @Override
    public Door MakeDoor(Room r1, Room r2) {
        Door theDoor = new Door(r1, r2);
        return theDoor;
    }

    @Override
    public Wall MakeWall() {
        RedWall theWall = new RedWall();
        return theWall;
    }

    @Override
    public Room MakeRoom(int i) {
        PinkRoom theRoom = new PinkRoom(i);
        return theRoom;
    }

}
