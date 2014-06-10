//
//  LinkTitleLabel.swift
//  Example
//
//  Created by Sam Symons on 2014-06-09.
//  Copyright (c) 2014 Sam Symons. All rights reserved.
//

import UIKit

class LinkTitleLabel: UILabel {
    override func layoutSubviews() {
        self.preferredMaxLayoutWidth = self.frame.size.width;
        super.layoutSubviews();
    }
}