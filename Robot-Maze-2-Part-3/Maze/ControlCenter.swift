//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
        // Identify if robot's forward movement is blocked
        
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        // Create local constant identifying wall locations
        
        let myWallInfo = checkWalls(myRobot)
        
        // Categorize the robot's current location based on the number of walls
        
        let isThreeWayJunction = myWallInfo.numberOfWalls == 1
        let isTwoWayPath = myWallInfo.numberOfWalls == 2
        let isDeadEnd = myWallInfo.numberOfWalls == 3

        // Program the robot's movement based on whether it's movement is blocked and the surrounding wall locations
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, wallInfo: (myWallInfo))
        } else if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
        } else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(myRobot, wallInfo: (myWallInfo))
        } else if isDeadEnd {
            if !robotIsBlocked {
                myRobot.move()
            } else {
                myRobot.rotateRight()
            }
        }
    }
    
    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}
