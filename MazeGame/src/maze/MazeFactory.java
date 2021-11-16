/*
 * MazeFactory.java
 * Copyright (c) 2008, Drexel University.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the Drexel University nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY DREXEL UNIVERSITY ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL DREXEL UNIVERSITY BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package maze;

import maze.ui.MazeViewer;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

/**
 * 
 * @author Sunny
 * @version 1.0
 * @since 1.0
 */
public abstract class MazeFactory
{
	/**
	 * Creates a small maze.
	 */
	public static Maze createMaze()
	{
		
		Maze maze = new Maze();

		Room First = new Room(0);
		maze.addRoom(First);
		Room Second = new Room(1);
		maze.addRoom(Second);

		Door doorOne = new Door(First, Second);

		First.setSide(Direction.North, doorOne);
		First.setSide(Direction.South, new Wall());
		First.setSide(Direction.East, new Wall());
		First.setSide(Direction.West, new Wall());

		Second.setSide(Direction.North, new Wall());
		Second.setSide(Direction.South, doorOne);
		Second.setSide(Direction.East, new Wall());
		Second.setSide(Direction.West, new Wall());

		maze.setCurrentRoom(First);


		return maze;
		

	}


	public Wall MakeWall() {
		Wall theWall = new Wall();
		return theWall;
	}

	public Door MakeDoor(Room r1, Room r2) {
		Door theDoor = new Door(r1, r2);
		return theDoor;
	}

	public Room MakeRoom(int i) {
		Room theRoom = new Room(i);
		return theRoom;
	}


	public boolean isStringInt(String s)
	{
		try
		{
			Integer.parseInt(s);
			return true;
		} catch (NumberFormatException ex)
		{
			return false;
		}
	}

	public Maze loadMaze(final String path) throws IOException {
		Maze maze = new Maze();

		File file = new File(path);
		BufferedReader br = new BufferedReader(new FileReader(file));

		String line;
		List<Room> roomList = new ArrayList<Room>();
		List<List> mazeList = new ArrayList<List>();
		Hashtable<Door, String> doorList = new Hashtable<Door, String>();



		while ((line = br.readLine()) != null) {
			String str[] = line.split(" ");
			List<String> words = new ArrayList<String>();
			words = Arrays.asList(str);
			mazeList.add(words);

			if (words.get(0).equals("room")) {
				int num = Integer.parseInt(words.get(1));
				Room room = MakeRoom(num);
				maze.addRoom(room);
				roomList.add(room);


			}
			if (words.get(0).equals("door")) {
				int r1 = Integer.parseInt(words.get(2));
				int r2 = Integer.parseInt(words.get(3));
				Door door = MakeDoor(roomList.get(r1), roomList.get(r2));

				if (words.get(4).equals("open")) {
					door.setOpen(true);
				}
				doorList.put(door, words.get(1));
			}


		}


		for (int i = 0; i < roomList.size(); i++) {
			if (mazeList.get(i).get(2).equals("wall")) {
				roomList.get(i).setSide(Direction.North, MakeWall());
			}
			else {
				for (Door j : doorList.keySet()) {
					if (mazeList.get(i).get(2).equals(doorList.get(j))) {
						roomList.get(i).setSide(Direction.North, j);
					}
				}
			}

			if (mazeList.get(i).get(3).equals("wall")) {
				roomList.get(i).setSide(Direction.South, MakeWall());
			}
			else {
				for (Door j : doorList.keySet()) {
					if (mazeList.get(i).get(3).equals(doorList.get(j))) {
						roomList.get(i).setSide(Direction.South, j);
					}
				}
			}

			if (mazeList.get(i).get(4).equals("wall")) {
				roomList.get(i).setSide(Direction.East, MakeWall());
			}
			else {
				for (Door j : doorList.keySet()) {
					if (mazeList.get(i).get(4).equals(doorList.get(j))) {
						roomList.get(i).setSide(Direction.East, j);
					}
				}
			}

			if (mazeList.get(i).get(5).equals("wall")) {
				roomList.get(i).setSide(Direction.West, MakeWall());
			}
			else {
				for (Door j : doorList.keySet()) {
					if (mazeList.get(i).get(5).equals(doorList.get(j))) {
						roomList.get(i).setSide(Direction.West, j);
					}
				}
			}
		}


		maze.setCurrentRoom(roomList.get(0));
		return maze;
	}

}
























/**
 * else if (mazeList.get(i).get(2).toString().substring(0,1).equals("d")) {
 * 				for (Door j : doorList.keySet()) {
 * 					if (mazeList.get(i).get(2).equals(doorList.get(j))) {
 * 						roomList.get(i).setSide(Direction.North, j);
 *                                        }*            }
 * 			}
 * 			else {
 * 				for (Room j : roomList) {
 * 					if (mazeList.get(i).get(2).equals(roomList.indexOf(j))) {
 * 						roomList.get(i).setSide(Direction.North, j);
 * 					}
 *                            }
 * 			}
 */