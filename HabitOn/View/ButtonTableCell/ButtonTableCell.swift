//
//  ButtonTableCell.swift
//  HabitOn
//
//  Created by Danil on 16.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

protocol ButtonTableCellDelegate {
    func showPopup(for index: CreateHabitType.RawValue, from button: UIButton)
}

class ButtonTableCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: RoundedButton!
    
    var delegate: ButtonTableCellDelegate?
    
    private var index: Int! = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel.textColor = ThemeManager.currentTheme().textColor
    }
    
    public func configure(with text: String, index: Int, delegate: ButtonTableCellDelegate) {
        self.titleLabel?.text = text
        self.index = index
        self.delegate = delegate
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.rotate(angle: 180.0) {
            guard self.delegate != nil else { return }
            self.delegate?.showPopup(for: self.index, from: sender)
        }
    }
    
}
