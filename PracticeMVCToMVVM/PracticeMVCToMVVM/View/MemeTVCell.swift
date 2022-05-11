//
//  MemeTVCell.swift
//  PracticeMVCToMVVM
//
//  Created by Hitesh on 10/05/22.
//

import UIKit

final class MemeTVCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = String(describing: MemeTVCell.self)
}
