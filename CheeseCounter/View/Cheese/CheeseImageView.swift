//
//  CheeseImageView.swift
//  CheeseCounter
//
//  Created by xiilab on 2018. 1. 16..
//  Copyright © 2018년 xiilab. All rights reserved.
//

import UIKit
import Kingfisher

final class CheeseImageView: UIView{
  
  var model: MainSurveyList.CheeseData?{
    didSet{
      guard let cheeseModel = model else {return}
      addConstraintWithImage(model: cheeseModel)
    }
  }
  
  let imageButton1 = ImageButton()
  let imageButton2 = ImageButton()
  let imageButton3 = ImageButton()
  let imageButton4 = ImageButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  private func addConstraintWithImage(model: MainSurveyList.CheeseData){
    
    imageButton1.kf.setBackgroundImage(with: URL(string: model.ask1_img_url.getUrlWithEncoding()), for: .normal)
    imageButton2.kf.setBackgroundImage(with: URL(string: model.ask2_img_url.getUrlWithEncoding()), for: .normal)
    
    if model.type == "2"{
      addSubview(imageButton1)
      addSubview(imageButton2)
      
      imageButton1.setTitle(model.ask1, for: .normal)
      imageButton2.setTitle(model.ask2, for: .normal)
      imageButton1.snp.remakeConstraints({ (make) in
        make.left.equalToSuperview()
        make.top.equalToSuperview()
        make.bottom.equalToSuperview()
        make.right.equalTo(self.snp.centerX)
      })
      
      imageButton2.snp.remakeConstraints({ (make) in
        make.top.equalToSuperview()
        make.right.equalToSuperview()
        make.bottom.equalToSuperview()
        make.left.equalTo(imageButton1.snp.right)
      })
      
    }else if model.type == "4"{
      guard let image3URL = model.ask3_img_url
        , let image4URL = model.ask4_img_url else {return}
      
      addSubview(imageButton1)
      addSubview(imageButton2)
      addSubview(imageButton3)
      addSubview(imageButton4)
      
      imageButton1.setTitle(model.ask1, for: .normal)
      imageButton2.setTitle(model.ask2, for: .normal)
      imageButton3.setTitle(model.ask3, for: .normal)
      imageButton4.setTitle(model.ask4, for: .normal)
      
      imageButton3.kf.setBackgroundImage(with: URL(string: image3URL.getUrlWithEncoding()), for: .normal)
      imageButton4.kf.setBackgroundImage(with: URL(string: image4URL.getUrlWithEncoding()), for: .normal)
    
      imageButton1.snp.remakeConstraints({ (make) in
        make.left.equalToSuperview()
        make.top.equalToSuperview()
        make.right.equalTo(self.snp.centerX)
        make.bottom.equalTo(self.snp.centerY)
      })
      
      imageButton2.snp.remakeConstraints({ (make) in
        make.top.equalToSuperview()
        make.right.equalToSuperview()
        make.left.equalTo(imageButton1.snp.right)
        make.bottom.equalTo(self.snp.centerY)
      })
      
      imageButton3.snp.remakeConstraints({ (make) in
        make.top.equalTo(imageButton1.snp.bottom)
        make.left.equalToSuperview()
        make.right.equalTo(self.snp.centerX)
        make.bottom.equalToSuperview()
      })
      
      imageButton4.snp.remakeConstraints({ (make) in
        make.right.equalToSuperview()
        make.top.equalTo(imageButton2.snp.bottom)
        make.bottom.equalToSuperview()
        make.left.equalTo(imageButton3.snp.right)
      })
    }
    self.layoutIfNeeded()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

final class ImageButton: UIButton {
  
  let gradientLayer = CAGradientLayer()
  let topLineLayer = CALayer()
  let rightLineLayer = CALayer()
  let bottomLineLayer = CALayer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    titleLabel?.lineBreakMode = .byWordWrapping
    titleLabel?.numberOfLines = 2
    
    topLineLayer.backgroundColor = #colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1).cgColor
    bottomLineLayer.backgroundColor = #colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1).cgColor
    rightLineLayer.backgroundColor = #colorLiteral(red: 0.6117647059, green: 0.6117647059, blue: 0.6117647059, alpha: 1).cgColor
    
    gradientLayer.startPoint = CGPoint(x: 0, y: 1)
    gradientLayer.endPoint = CGPoint(x: 0, y: 0.7)
    gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
    self.layer.insertSublayer(gradientLayer, below: titleLabel?.layer)
    self.layer.addSublayer(topLineLayer)
    self.layer.addSublayer(rightLineLayer)
  
    titleLabel?.font = UIFont.CheeseFontRegular(size: 13.7)
    titleEdgeInsets = UIEdgeInsetsMake(0, 10, 15, 0)
    contentHorizontalAlignment = .left
    contentVerticalAlignment = .bottom
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.gradientLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    self.topLineLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 0.5)
    self.bottomLineLayer.frame = CGRect(x: 0, y: self.frame.height-0.5, width: self.frame.width, height: 0.5)
    self.rightLineLayer.frame = CGRect(x: self.frame.width-0.5, y: 0, width: 0.5, height: self.frame.height)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}



