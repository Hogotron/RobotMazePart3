//
//  WallLocations.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 12/1/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    // Check if robot is facing wall
    
    func isFacingWall(_ robot: ComplexRobotObject, direction: MazeDirection) -> Bool {
        
        let cell = mazeController.currentCell(robot)
        var isWall: Bool = false
        
        switch(direction) {
        case .up:
            if cell.top {
                isWall = true
            }
        case .down:
            if cell.bottom {
                isWall = true
            }
        case .left:
            if cell.left {
                isWall = true
            }
        case .right:
            if cell.right {
                isWall = true
            }
        }
        return isWall
    }

    // Check location of walls relative to robot
    
    func checkWalls(_ robot:ComplexRobotObject) -> (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int) {
        var numberOfWalls = 0
        let cell = mazeController.currentCell(robot)

        let isWallUp = cell.top
        if isWallUp {
            numberOfWalls += 1
        }
        let isWallRight = cell.right
        if isWallRight {
            numberOfWalls += 1
        }
        let isWallBottom = cell.bottom
        if isWallBottom {
            numberOfWalls += 1
        }
        
        let isWallLeft = cell.left
        if isWallLeft {
            numberOfWalls += 1
        }
        
        // Test if checkWall function works
        
        return (isWallUp, isWallRight, isWallBottom, isWallLeft, numberOfWalls)
    }
}
