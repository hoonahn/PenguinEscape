//
//  Star.swift
//  Penguin Escape
//
//  Created by Sanghoon Ahn on 2017. 8. 26..
//  Copyright © 2017년 AHN. All rights reserved.
//

import SpriteKit

class Star: SKSpriteNode, GameSprite {
    var initialSize: CGSize = CGSize(width: 40, height: 38)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "Environment")
    var pulseAnimation = SKAction()
    
    init() {
        let starTexture = textureAtlas.textureNamed("star")
        super.init(texture: starTexture, color: .clear, size: initialSize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: size.width / 2)
        self.physicsBody?.affectedByGravity = false
        createAnimations()
        self.run(pulseAnimation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createAnimations() {
        let pulseOutGroup = SKAction.group([SKAction.fadeAlpha(to: 0.85, duration: 0.8),
                                            SKAction.scale(to: 0.6, duration: 0.8),
                                            SKAction.rotate(byAngle: -0.3, duration: 0.8)
            ])
        let pulseInGroup = SKAction.group([SKAction.fadeAlpha(to: 1, duration: 1.5),
                                            SKAction.scale(to: 1, duration: 1.5),
                                            SKAction.rotate(byAngle: 3.5, duration: 1.5)
            ])
        let pulseSequence = SKAction.sequence([pulseOutGroup,
                                               pulseInGroup])
        
        pulseAnimation = SKAction.repeatForever(pulseSequence)
    }
    
    func onTap() {}
}
