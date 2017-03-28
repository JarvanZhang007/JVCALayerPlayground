//
//  JVvisualEffectEaskViewController.swift
//  JVCALayerPlayground
//
//  Created by Jarvan on 2017/3/28.
//  Copyright © 2017年 Jarvan. All rights reserved.
//

import UIKit

class JVvisualEffectEaskViewController: UIViewController , CAAnimationDelegate  {

    @IBOutlet weak var visualView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    
    @IBAction func startAnimation(_ sender: UIButton) {
        
        self.creatMaskAnimation()
    }
    
    
    
    func creatMaskAnimation() {
//        1 定义常量
        let maskWidth:CGFloat = 180
        let maskY:CGFloat = 100
        
        
//        2 创建路径
        let maskPath = CGMutablePath.init()
        
        let outsidePath = CGPath.init(rect: self.visualView.bounds, transform: nil)
        
        let insidePath = CGPath.init(rect: CGRect.init(x: (self.view.bounds.width-maskWidth)/2.0, y: maskY, width: maskWidth, height: maskWidth), transform: nil)
        
        maskPath.addPath(outsidePath)
        maskPath.addPath(insidePath)
        
        
//        3 创建 CAShapeLayer
        let maskLayer = CAShapeLayer.init()
        maskLayer.fillRule="even-odd"
        maskLayer.path = maskPath
        
//        经过测试 使用 visualView.Layer.mask 蒙版得以保留，但毛玻璃效果没有了 错误写法
//        self.visualView.layer.mask=maskLayer
        
//        4 正确写法应该使用UIView.mask
        let maskView = UIView.init(frame: self.view.bounds)
        maskView.backgroundColor = UIColor.black
        maskView.layer.mask = maskLayer
        
        self.visualView.mask = maskView

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
