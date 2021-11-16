package maze;

import maze.ui.MazeViewer;

import java.io.IOException;
import java.util.Scanner;

public class MazeGameDriver {

    private String filePath = "small.maze";

    public Maze loadMaze(String path, MazeFactory factory) throws IOException {
        return factory.loadMaze(path);
    }

    public static void main(String[] args) throws IOException {

        Scanner keyboard = new Scanner(System.in);
        String input;
        System.out.println("Please enter a maze color:");
        input = keyboard.nextLine();


        if (input.toLowerCase().equals("red")) {
            MazeGameDriver something = new MazeGameDriver();
            RedMazeFactory maze = new RedMazeFactory();
            Maze newMaze = something.loadMaze("small.maze", maze);
            MazeViewer viewer = new MazeViewer(newMaze);
            viewer.run();

        } else if (input.toLowerCase().equals("blue")) {
            MazeGameDriver something = new MazeGameDriver();
            BlueMazeFactory maze = new BlueMazeFactory();
            Maze newMaze = something.loadMaze("small.maze", maze);
            MazeViewer viewer = new MazeViewer(newMaze);
            viewer.run();

        }
        else {
            System.out.println("Invalid maze color");
            System.out.println("Please enter a valid maze color (red or blue)");
        }


    }
}
