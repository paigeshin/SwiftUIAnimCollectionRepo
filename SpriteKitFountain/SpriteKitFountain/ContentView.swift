//
//  ContentView.swift
//  SpriteKitFountain
//
//  Created by paige on 2021/12/20.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        // If you don't give physics body, it won't have any gravity applied 
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
        ball.physicsBody?.restitution = 0.4 // speed
        ball.position = location
        addChild(ball)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        // If you don't give physics body, it won't have any gravity applied
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
        ball.physicsBody?.restitution = 0.4 // speed
        ball.position = location
        addChild(ball)
    }
    
}

struct ContentView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        return scene
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .white.opacity(0.8), .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            SpriteView(scene: scene)
                .frame(width: 320, height: 650)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
