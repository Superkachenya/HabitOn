//
//  SwitchTableCell.swift
//  HabitOn
//
//  Created by Danil on 16.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

protocol SwitchTableCellDelegate {
    func enableNotifications(_ flag: Bool)
}

class SwitchTableCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    var delegate: SwitchTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel.textColor = ThemeManager.currentTheme().textColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    public func configure(_ index: Int) {
        self.titleLabel.text = CreateHabitCellContent.titleForCell(at: index)
    }
    @IBAction func switchValueChanged(_ sender: Any) {
        guard delegate != nil else { return }
        delegate?.enableNotifications(switcher.isOn)
    }
}
