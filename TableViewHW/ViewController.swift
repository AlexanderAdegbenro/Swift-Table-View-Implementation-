//
//  ViewController.swift
//  TableViewHW
//
//  Created by Consultant on 2/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var CountriesTableView: UITableView!
    
    struct Constants {
        static let cellIdentifier  = "MagicCountryCell"
    }
    
    var countries: [String] = ["Germany", "France" , "China" , "Brazil" , "Australia" , "India" , "Canada", "USA" , "Mexico" , "Ghana" , "Argentina" , "Egypt"]

    var continentCountry: [String: String] = ["Germany" : "Europe", "France" : "Europe" , "China" : "Asia", "Brazil" : "South America", "Australia": "Australia" , "India" : "Asia", "Canada": "North America", "USA": "North America" , "Mexico": "North Americca" , "Ghana": "Africa" , "Argentina": "South America" , "Egypt": "Africa" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CountriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var CellContentConfig = tableViewCell.defaultContentConfiguration()
        let countryname = countries[indexPath.row]
        CellContentConfig.text = countryname
        CellContentConfig.secondaryText = continentCountry[countryname] ?? "Continent Name"
        tableViewCell.contentConfiguration = CellContentConfig
        return tableViewCell 
        
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("user tapped cell at \(countries[indexPath.row])indexPath")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
