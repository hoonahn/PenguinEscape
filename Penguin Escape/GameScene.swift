//
//  GameScene.swift
//  Penguin Escape
//
//  Created by Sanghoon Ahn on 2017. 7. 18..
//  Copyright © 2017년 AHN. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    let cam = SKCameraNode()
    var screenCenterY = CGFloat()
    let ground = Ground()
    let player = Player()
    let motionManager = CMMotionManager()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        
        self.camera = cam
        
        screenCenterY = self.size.height / 2
        
        let bee2 = Bee()
        
        bee2.position = CGPoint(x:325, y:325)
        self.addChild(bee2)
        let bee3 = Bee()
        bee3.position = CGPoint(x:200, y:325)
        self.addChild(bee3)
        
        ground.position = CGPoint(x: -self.size.width * 2, y: 30)
        ground.size = CGSize(width: self.size.width * 6, height: 0)
        ground.createChildern()
        self.addChild(ground)
        
        player.position = CGPoint(x: 150, y: 250)
        self.addChild(player)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -5)
//        self.motionManager.startAccelerometerUpdates()
    }
    
    override func didSimulatePhysics() {
//        self.camera!.position = player.position
        // 카메라가 화면 중간에 위치하도록
        var cameraYPos = screenCenterY
        cam.yScale = 1
        cam.xScale = 1
        
        if (player.position.y > screenCenterY) {
            cameraYPos = player.position.y
            // 플레이어가 높이 날 수록 카메라 스케일을 줄임
            let percentOfMaxHeight = (player.position.y - screenCenterY) / (CGFloat(player.maxHeight) - screenCenterY)
            let newScale = 1 + percentOfMaxHeight
            cam.yScale = newScale
            cam.xScale = newScale
        }
        
        self.camera!.position = CGPoint(x: player.position.x, y: cameraYPos)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if let gameSprite = nodeTouched as? GameSprite {
                gameSprite.onTap()
            }
        }
        player.startFlapping()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.stopFlapping()
    }
    
    override func update(_ currentTime: TimeInterval) {
        player.update()
//        Tilt TEST------------------------------------------------
//        if let accelData = self.motionManager.accelerometerData {
//            var forceAmount:CGFloat
//            var movement = CGVector()
//            
//            
//            // 장치 방향에 따라 tilt의 숫자가 의도와 반대로 가리킬 수 있다.
//            // UIApplication 클래스를 통해 현재 방향 정보를 enum으로 받아옴
//            switch UIApplication.shared.statusBarOrientation {
//            case .landscapeLeft:
//                forceAmount = 20000
//            case .landscapeRight:
//                forceAmount = -20000
//            default:
//                forceAmount = 0
//            }
//         
//            if accelData.acceleration.y > 0.15 {
//                movement.dx = forceAmount
//            }
//            else if accelData.acceleration.y < -0.15 {
//                movement.dx = -forceAmount
//            }
//            player.physicsBody?.applyForce(movement)
//        }
//        ------------------------------------------------Tilt TEST
    }
}
