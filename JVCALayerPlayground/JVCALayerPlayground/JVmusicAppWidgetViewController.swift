//
//  JVmusicAppWidgetViewController.swift
//  JVCALayerPlayground
//
//  Created by Jarvan on 2017/3/28.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class JVmusicAppWidgetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.drawreplicatoreLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func drawreplicatoreLayer() {
        //        控件的长宽
        let rtWidth:CGFloat = 150,rtheight:CGFloat = 120
        
        let replicatoreLayer = CAReplicatorLayer()
        replicatoreLayer.frame = CGRect(x: 0.0, y: 0.0, width: rtWidth, height: rtheight)
        replicatoreLayer.position = view.center
        view.layer.addSublayer(replicatoreLayer)
        
        //        需要的重复的个数
        let instanceCount:Int = 3
        //        计算每一个的长宽
        let itemLayerW:CGFloat = rtWidth/CGFloat(2*instanceCount+1)
        let itemLayerH:CGFloat = rtheight/4.0*3.0
        
        
        let itemLayer = CALayer()
        itemLayer.frame = CGRect(x: itemLayerW, y: rtheight-itemLayerH, width: itemLayerW, height: itemLayerH)
        itemLayer.cornerRadius = itemLayerH/20.0
        itemLayer.backgroundColor = UIColor.red.cgColor
        replicatoreLayer.addSublayer(itemLayer)
        
        let move = CABasicAnimation(keyPath: "position.y")
        move.toValue = itemLayer.position.y + itemLayerH-itemLayerH/5.0
        move.duration = 0.5
        move.autoreverses = true
        move.repeatCount = Float.infinity
        itemLayer.add(move, forKey: nil)
        
        replicatoreLayer.instanceCount = 3
        replicatoreLayer.instanceTransform = CATransform3DMakeTranslation(2*itemLayerW, 0.0, 0.0)
        replicatoreLayer.instanceDelay = 0.33
        replicatoreLayer.masksToBounds=true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
