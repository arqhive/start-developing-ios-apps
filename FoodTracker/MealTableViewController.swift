//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by user on 25/03/2020.
//  Copyright © 2020 arqhive. All rights reserved.
//

import UIKit

// 동적데이터를 표시하려면 테이블뷰에 데이터 소스와 델리게이터라는 두 가지 중요한 헬퍼가 필요하다.
// 데이터 소스는 테이블 뷰에 표시해야하는 데이터를 제공한다.
// 테이블뷰 델리게이터는 테이블 뷰가 셀 선택, 행 높이 및 데이터 표시와 관련된 기타 측면을 관리하는데 도움이 된다.
class MealTableViewController: UITableViewController {
    
    //MARK: Properties
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 샘플 데이터 불러오기
        loadSampleMeals()
    }

    // MARK: - Table view data source

    // 테이블뷰에 표시할 섹션 수
    // 단일 섹션만 필요하므로 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 1개의 섹션을 반환한다.
    }

    // 현재 테이블뷰 에는 단일 섹션만 있고 각 Meal객체에는 고유한 행이 있어야 한다.
    // 즉, 행 수는 배열의 Meal 객체수여야 한다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    // 지정된 행에 표시 할 셀을 구성하고 제공한다.
    // 각 행에는 하나의 셀이 있으며, 해당 셀은 해당 행에 나타나는 내용과 해당 내용이 배치되는 방법을 결정한다.
    // 이 메소드는 테이블의 각 행에 대해 호출된다.
    // 테이블 뷰가 표시되는 행에 대한 셀만 요청하는것이 가장 효울적이다.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 테이블뷰에서 셀을 요청한다.(dequeteReusableCell)
        // 사용자가 새 셀을 만들고 오래된 셀을 삭제하는 대신 테이블은 가능한 경우 셀을 재사용하려고 한다.
        // 사용 가능한 셀이 없으면 아래 메소드는 새 셀을 인스턴스화 한다.
        // 셀이 신을 스크롤하면 재사용된다. 아래 메소드는 어떤 유형의 셀을 작성하거나 재사용해야 하는지 알려준다.
        
        // 식별자를 추가한다.
        let cellIdentifier = "MealTableViewCell"
        // 식별자를 변경하고 커스텀 셀 클래스를 작성했으므로 셀 유형을 커스텀 셀 서브클래스로 다운 캐스트한다.
        // 스토리보드가 올바르게 설정되어 있고 스토리보드의 식별자와 일치하면 다운캐스트가 실패하지 않아야 한다.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("셀 인스턴스화 실패!")
        }
        
        // 데이터소스 레이아웃에 적합한 음식을 가져온다.
        let meal = meals[indexPath.row]
        
        // 셀 구성하기
        cell.nameLabel.text = meal.name
        cell.photoImageview.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    // 화면이 되감기 되는 동작을 추가한다.
    // Save 버튼을 눌렀을때
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    //MARK: Private Method
    
    private func loadSampleMeals() {
        // 이미지를 로드 한다.
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        // 객체 3개를 만든다.
        guard let meal1 = Meal(name: "donkatsu", photo: photo1, rating: 4) else {
            fatalError("meal1을 인스턴스화 할 수 없습니다.")
        }
        
        guard let meal2 = Meal(name: "bibimbop", photo: photo2, rating: 5) else {
            fatalError("meal2을 인스턴스화 할 수 없습니다.")
        }
        
        guard let meal3 = Meal(name: "ramen", photo: photo3, rating: 3) else {
            fatalError("meal31을 인스턴스화 할 수 없습니다.")
        }
        
        // 배열에 추가한다.
        meals += [meal1, meal2, meal3]
    }
}
