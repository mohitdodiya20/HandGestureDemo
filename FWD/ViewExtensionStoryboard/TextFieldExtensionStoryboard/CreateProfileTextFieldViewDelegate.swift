//
//  CreateProfileTextFieldViewDelegate.swift
//  topspot
//
//  Created by Łukasz Haraźny on 27/09/16.
//  Copyright © 2016 DKA. All rights reserved.
//

import Foundation

/// Delegate for CreateProfileTextFieldView
protocol CreateProfileTextFieldViewDelegate: class {
    func shouldReturn(CreateProfileTextFieldView: CreateProfileTextFieldView) -> Bool
    func shouldChangeCharactersInOfTextFirld(inputTextField : CreateProfileTextFieldView,text : String)
}
