//
//  GameSprite.swift
//  Penguin Escape
//
//  Created by Sanghoon Ahn on 2017. 7. 20..
//  Copyright © 2017년 AHN. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas:SKTextureAtlas { get set }
    var initialSize: CGSize { get set }
    func onTap()
}
