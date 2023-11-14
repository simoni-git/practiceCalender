//
//  ViewController.swift
//  practiceCalender
//
//  Created by MAC on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    
    var selectedDate = Date()
    var totalSquares = [String]()
    
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var collectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
     
    }
    
    func setCellsView() {
        let width = (collectionVIew.frame.size.width - 2) / 8
        let height = (collectionVIew.frame.size.height - 2) / 8
        
        let flowLayout = collectionVIew.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView() {
        totalSquares.removeAll()
        
        let daysInMonth = CalenderHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalenderHelper().firstOfMonth(date: selectedDate)
        let startSpaces = CalenderHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while (count <= 42) {
            if (count <= startSpaces || count - startSpaces > daysInMonth) {
                totalSquares.append("")
                    
            } else {
                totalSquares.append(String(count - startSpaces))
            }
            count += 1
        }
        monthLabel.text = CalenderHelper().monthString(date: selectedDate) + " " + CalenderHelper().yearString(date: selectedDate)
        collectionVIew .reloadData()
    }
    
    @IBAction func tapNextBtn(_ sender: UIButton) {
        selectedDate = CalenderHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    
    @IBAction func tapPreviewBtn(_ sender: UIButton) {
        selectedDate = CalenderHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calenderCell", for: indexPath) as! calenderCell
        cell.dateLabel.text = totalSquares[indexPath.item]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

