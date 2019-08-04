//
//  ThemableViews.swift
//  BartisUtilities
//
//  Created by Alex Bartis on 06/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import Foundation
import UIKit

/// Classes to be subclassed in order to set theming
/// without setting theming for a base SDK object

open class ThemableTableView: UITableView {}
open class ThemableTableViewLabel: UILabel {}
open class ThemableTableViewCell: UITableViewCell {}
open class ThemableTableViewHeader: UITableViewHeaderFooterView {}
open class ThemableTableViewHeaderLabel: UILabel {}

open class ThemableCollectionView: UICollectionView {}
open class ThemableCollectionUpperLabel: UILabel {}

open class ThemableLabel: UILabel {}
open class ThemableButton: UIButton {}
open class ThemablePopupButton: UIButton {}
open class ThemablePopupView: UIView {}
open class ThemableUIView: UIView {}

open class ThemableSegmentedControl: UISegmentedControl {}
