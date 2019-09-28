//
//  SelfSizeTableView.swift
//  TryApp
//
//  Created by RealityFamily on 28/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import Foundation
import UIKit

class SelfSizeTableView: UITableView {
    
    override func reloadData() {
      super.reloadData()
      self.invalidateIntrinsicContentSize()
      self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: contentSize.width, height: contentSize.height)
    }
    
}
