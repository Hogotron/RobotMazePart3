//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(_ robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        if randomNumber == 0 {
            robot.rotateLeft()
        } else if randomNumber == 1 {
            robot.rotateRight()
        }
    }
    
    func continueStraightOrRotate(_ robot: ComplexRobotObject, wallInfo:(up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        let randomNumber = arc4random() % 2
        if randomNumber == 0 {
            turnTowardClearPath(robot, wallInfo:(wallInfo))
        } else {
        robot.move()
        }
    }
    
    func turnTowardClearPath(_ robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        
        if robot.direction == .left && wallInfo.down {
            robot.rotateRight()
        } else if robot.direction == .up && wallInfo.left {
            robot.rotateRight()
        } else if robot.direction == .right && wallInfo.up {
            robot.rotateRight()
        } else if robot.direction == .down && wallInfo.right {
            robot.rotateRight()
        } else if robot.direction == .right && wallInfo.right {
            robot.rotateLeft()
        } else if robot.direction == .down && wallInfo.down {
            robot.rotateLeft()
        } else {
            robot.rotateLeft()
        }
    }

}
