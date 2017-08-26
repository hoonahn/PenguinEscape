//
//  Bat.swift
//  Penguin Escape
//
//  Created by Sanghoon Ahn on 2017. 8. 26..
//  Copyright © 2017년 AHN. All rights reserved.
//

import SpriteKit

class Bat: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 44, height: 24)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Enemies")
    var flyAnimation = SKAction()
    
    init() {
        super.init(texture: nil, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        createAnimations()
        self.run(flyAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createAnimations() {
        let flyFrames: [SKTexture] = [textureAtlas.textureNamed("bat"), textureAtlas.textureNamed("bat-fly")]
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.12)
        flyAnimation = SKAction.repeatForever(flyAction)
    }
    
    func onTap() {}
}
