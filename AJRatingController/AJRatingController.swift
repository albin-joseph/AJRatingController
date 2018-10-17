//
//  AJRatingController.swift
//
//  Created by Albin Joseph on 11/23/17.
//  Copyright © 2017 Albin Joseph. All rights reserved.
//

import UIKit
class AJRatingController: UIView {
    var rating:Float = 0.0
    fileprivate var backgroundView:UIView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    func setInitialiseValue() -> () {
        self.backgroundColor = UIColor.init(red: 235.0/255, green: 235.0/255, blue: 235.0/255, alpha: 1.0)
        backgroundView.frame = CGRect(x:0,y:0,width:50,height:self.bounds.size.height)
        backgroundView.backgroundColor = UIColor.init(red: 246.0/255, green: 208.0/255, blue: 57.0/255, alpha: 1.0)
        self.addSubview(backgroundView)
        setStarIcons()
    }
    
    fileprivate func setStarIcons() -> () {
        let starWidth = (self.bounds.size.width/5.0)
        for index in 0...4{
            let orginX = CGFloat(index) * starWidth
            let starFrame = CGRect(x:orginX,y:0,width:starWidth,height:self.bounds.size.height)
            let imageView:UIImageView = UIImageView.init(frame: starFrame)
            imageView.image = UIImage.init(named: "whiteRatingStar")
            self.addSubview(imageView)
        }
    }
    
    func enableRateSubmission() -> () {
        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer.init()
        tapGestureRecognizer.addTarget(self, action: #selector(gestureAction(touch:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func gestureAction(touch: UITapGestureRecognizer) -> () {
        let touchPoint = touch.location(in: self)
        backgroundView.frame = CGRect(x:0,y:0,width:touchPoint.x,height:self.bounds.size.height)
        calculateRateValue(from: touchPoint.x)
    }
    
    fileprivate func calculateRateValue(from userTapPosition:CGFloat) -> () {
        let percentage = userTapPosition * 100/self.bounds.width
        let rate:Float = Float(5 * percentage/100)
        rating = rate
    }
    
    func setRating(ratingValue:Double) -> () {
        let percentage = ratingValue * 100/5
        let rateWidth = (Double(self.bounds.size.width) * percentage)/100
        backgroundView.frame = CGRect(x:0,y:0,width:CGFloat(rateWidth),height:self.bounds.size.height)
    }
    
    func setStarColor(_ color : UIColor) -> () {
        backgroundView.backgroundColor = color
    }
    
    func setBackGroundColor(_ color: UIColor) -> () {
        backgroundColor = color
    }
    
}
