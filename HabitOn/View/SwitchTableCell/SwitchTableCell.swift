//
//  SwitchTableCell.swift
//  HabitOn
//
//  Created by Danil on 16.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

class SwitchTableCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switcher: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    public func configure(_ index: Int) {
        self.titleLabel.text = CreateHabitCellContent.titleForCell(at: index)
    }
}
