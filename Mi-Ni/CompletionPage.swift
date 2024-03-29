//
//  Completion.swift
//  Mi-Ni
//
//  Created by Daniel Marriner on 26/07/2020.
//  Copyright © 2020 Daniel Marriner. All rights reserved.
//

import SpriteKit

class CompletionPage: SKScene {
    
    var isSinglePlayer = false
    var isYellowWin = true
    var yellowScore = 0
    var greenScore = 0
    
    override func didMove(to view: SKView) {
        scaleMode = .aspectFit
        
        if isYellowWin {
            childNode(withName: "greenWin")?.removeFromParent()
        } else {
            childNode(withName: "yellowWin")?.removeFromParent()
        }
        
        (childNode(withName: "scoreContainer")?
            .childNode(withName: "yellow")?
            .childNode(withName: "yellowScore") as? SKLabelNode)?.text = "\(yellowScore)"
        if isSinglePlayer {
            childNode(withName: "scoreContainer")?.childNode(withName: "green")?.removeFromParent()
        } else {
            (childNode(withName: "scoreContainer")?
                .childNode(withName: "green")?
                .childNode(withName: "greenScore") as? SKLabelNode)?.text = "\(greenScore)"
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        if let node = nodes(at: location).first, node.name == "mainMenu" {
            let transition = SKTransition.flipVertical(withDuration: 0.5)
            let worldScene = TitlePage(fileNamed: "TitlePage.sks")!
            worldScene.scaleMode = .aspectFit
            scene?.view?.presentScene(worldScene, transition: transition)
        }
    }

    
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
            case 53: exit(0)
            default: break
        }
    }
}
