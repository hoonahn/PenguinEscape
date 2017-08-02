//
//  GameScene.swift
//  Penguin Escape
//
//  Created by Sanghoon Ahn on 2017. 7. 18..
//  Copyright © 2017년 AHN. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let cam = SKCameraNode()
    let ground = Ground()
    let player = Player()
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        self.camera = cam
        
        let bee2 = Bee()
        bee2.position = CGPoint(x:325, y:325)
        self.addChild(bee2)
        
        let bee3 = Bee()
        bee3.position = CGPoint(x:200, y:325)
        self.addChild(bee3)
        
        ground.position = CGPoint(x: -self.size.width * 2, y: 150)
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        ground.createChildern()
        self.addChild(ground)
        
        player.position = CGPoint(x: 150, y: 250)
        self.addChild(player)
    }
    
    override func didSimulatePhysics() {
        self.camera!.position = player.position
    }
    
}
