//
//  JVactivityIndicatorViewController.swift
//  JVCALayerPlayground
//
//  Created by Jarvan on 2017/3/28.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class JVactivityIndicatorViewController: UIViewController {

    let someView = UIView.init()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createParentView()
        
        self.activityIndicatorLayerAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createParentView(){
        var w:CGFloat,h:CGFloat;
//        系统的控件是20 宽高  我们为了展示进行放大处理
        w=self.view.frame.width/4.0
//        w=20.0
        h=w
        someView.frame=CGRect.init(x: 0, y: 0, width: w, height: h)
        someView.center=view.center
        self.view.addSubview(someView)
    }
    
    
    func activityIndicatorLayerAnimation(){
        
        // 1
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = someView.bounds
        someView.layer.addSublayer(replicatorLayer)
        
        // 2
        let instanceCount = 12  //系统的控件是12个
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceDelay = CFTimeInterval(1 / 30.0) //延迟时间
        replicatorLayer.preservesDepth = false
        
        // 3 颜色偏移
        let  AlphaOffset:Float = 0.1
        replicatorLayer.instanceAlphaOffset = AlphaOffset
        // 4  计算角度
        let angle = Float(M_PI * 2.0)/Float(instanceCount)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0)
        
    
        // 5
        let instanceLayer = CALayer()
        //第一个出现计算位置 我们这里计算的 正中心最下面的那一个item
        let  layerHeight: CGFloat = replicatorLayer.frame.width/3.0
        let  layerWidth: CGFloat = layerHeight/3.0
         instanceLayer.frame = CGRect(x: (someView.bounds.width-layerWidth)/2.0, y: (someView.bounds.height-layerHeight), width: layerWidth, height: layerHeight)
        
        instanceLayer.backgroundColor = UIColor.gray.cgColor
        instanceLayer.cornerRadius = layerWidth/2.0 //圆角
        replicatorLayer.addSublayer(instanceLayer)
        
        
//         6 添加动画
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = 0.6
        fadeAnimation.toValue = AlphaOffset
        fadeAnimation.duration = 1
        fadeAnimation.repeatCount = Float(Int.max)
        instanceLayer.add(fadeAnimation, forKey: "FadeAnimation")
        
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
