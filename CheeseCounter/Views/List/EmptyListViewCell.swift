//
//  EmptyListViewCell.swift
//  CheeseCounter
//
//  Created by xiilab on 2018. 2. 21..
//  Copyright © 2018년 xiilab. All rights reserved.
//

import UIKit

class EmptyListViewCell: BaseListViewCell{
  override var model: MainSurveyList.CheeseData?{
    didSet{
      cheeseLabel.text = model?.option_cut_cheese
      heartLabel.text = model?.empathy_count
      contents.text = model?.title
      heartButton.isSelected = true
      
      let attributeString = NSMutableAttributedString(
        string: "선택응답 : ",
        attributes: [.font:UIFont.CheeseFontBold(size: 10.8)])
      attributeString.append(
        NSAttributedString(string: model?.select_ask ?? String(),
                           attributes: [.foregroundColor:UIColor.lightGray,.font:UIFont.CheeseFontBold(size: 10.8)]))
      detailContents.attributedText = attributeString
      peopleLabel.text = model?.reply_count ?? "0"
      
      cheeseImage.removeFromSuperview()
      cheeseLabel.removeFromSuperview()
    }
  }
}
