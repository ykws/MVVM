//
//  ViewController.swift
//  MVVM
//
//  Created by KAWASHIMA Yoshiyuki on 2019/04/14.
//  Copyright © 2019 ykws. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ViewController: UIViewController {

  // MARK :- Outlets
  
  @IBOutlet weak var counterLabel: UILabel!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var minusButton: UIButton!
  
  // MARK :- Properties
  
  private let disposeBag = DisposeBag()
  private var counterModel = CounterModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    plusButton.rx.tap.bind {
      self.counterModel.countUp()
      self.counterLabel.text = self.counterModel.count.description
    }.disposed(by: disposeBag)
    
    minusButton.rx.tap.bind {
      self.counterModel.countDown()
      self.counterLabel.text = self.counterModel.count.description
    }.disposed(by: disposeBag)
  }
}
