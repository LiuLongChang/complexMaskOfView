//
//  ViewController.swift
//  ComplexMaskOfView
//
//  Created by zgzzzs on 2017/6/23.
//  Copyright © 2017年 zzzsw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dynamicView : UIView! = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        /*调用方式*/

        let view = UIView.init(frame: CGRect.init(x: 40, y: 50, width: 80, height: 100))
        view.backgroundColor = UIColor.blue
        self.view.addSubview(view)


        let layer = CAShapeLayer.createMaskLayer(view: view);
        view.layer.mask = layer;






//        let shapeLayer = CAShapeLayer.init()
//        shapeLayer.frame = self.dynamicView.bounds;
//        shapeLayer.strokeEnd = 0.7;
//        shapeLayer.strokeStart = 0.1;
//
//        let path = UIBezierPath.init(rect: self.dynamicView.bounds)
//        shapeLayer.path = path.cgPath;
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = 2.0;
//        shapeLayer.strokeColor = UIColor.red.cgColor;
//        self.dynamicView.layer.addSublayer(shapeLayer);


        self.dynamicView.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200);
        self.view.addSubview(self.dynamicView);
        self.dynamicView.backgroundColor = UIColor.red

        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.dynamicView.bounds;

        let pathUse = UIBezierPath.init(ovalIn: self.dynamicView.bounds)

        shapeLayer.path = pathUse.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2.0;
        shapeLayer.strokeColor = UIColor.green.cgColor
        self.dynamicView.layer.addSublayer(shapeLayer)


        let pathAnima = CABasicAnimation.init(keyPath: "strokeEnd")
        pathAnima.duration = 3.0;
        pathAnima.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        pathAnima.fromValue = 0.0
        pathAnima.toValue = 1.0
        pathAnima.fillMode = kCAFillModeForwards
        pathAnima.isRemovedOnCompletion = false
        shapeLayer.add(pathAnima, forKey: "strokeEndAnimation");


    }


    func refreshUIWithVoicePower(voicePower:Int){


        let height = dynamicView.frame.height/2;
        





    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




extension CAShapeLayer{


    class func createMaskLayer(view:UIView)->CAShapeLayer{

        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        let rightSpace : CGFloat! = 10
        let topSpace : CGFloat! = 15

        let point1 = CGPoint.init(x: 0, y: 0);
        let point2 = CGPoint.init(x: viewWidth-rightSpace, y: 0);
        let point3 = CGPoint.init(x: viewWidth-rightSpace, y: topSpace);
        let point4 = CGPoint.init(x: viewWidth, y: topSpace);
        let point5 = CGPoint.init(x: viewWidth-rightSpace, y: topSpace+10.0);
        let point6 = CGPoint.init(x: viewWidth-rightSpace, y: viewHeight);
        let point7 = CGPoint.init(x: 0, y: viewHeight);


        let path = UIBezierPath.init()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point4)
        path.addLine(to: point5)
        path.addLine(to: point6)
        path.addLine(to: point7)
        path.close()

        let layer = CAShapeLayer.init()
        layer.path = path.cgPath

        return layer;
    }



}
