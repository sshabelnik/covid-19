
import UIKit

protocol MainTableViewControllerDelegate: AnyObject{
    func setSelectedCountry(country: CountryDataModelObject)
}

class MainTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedCountry: CountryDataModelObject?
    
    let networkManager = NetworkManagerImplementation()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        registerNibs()
    }
    
//    func getData() {
//        LocalDataManagerImplementation.shared.getCountryData { (result) in
//            switch result {
//            case .failure(let error):
//                print(error)
//            case .success(let data):
//                self.selectedCountry?.stats = data
//            }
//        }
//    }
    
    func registerNibs(){
        let countryNib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(countryNib, forCellReuseIdentifier: "CountryTableViewCell")

        let currentCountryNib = UINib(nibName: "CurrentCountryTableViewCell", bundle: nil)
        tableView.register(currentCountryNib, forCellReuseIdentifier: "CurrentCountryTableViewCell")
        
        let worldStatsNib = UINib(nibName: "WorldStatsTableViewCell", bundle: nil)
        tableView.register(worldStatsNib, forCellReuseIdentifier: "WorldStatsTableViewCell")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SelectingViewController
        destinationVC.tableVCdelegate = self
    }
}

extension MainTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        default:
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            guard let country = selectedCountry else {return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentCountryTableViewCell") as! CurrentCountryTableViewCell
            cell.setCurrentCountry(country: country)
            cell.selectionStyle = .none
            return cell
        case 1:
            guard let country = selectedCountry else {return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
            DispatchQueue.main.async {
                cell.setupCell(for: country)
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorldStatsTableViewCell") as! WorldStatsTableViewCell
            networkManager.getWorldData { (result) in
                switch result{
                case.failure(let error):
                    print("Getting WorldData error: \(error)")
                case.success(let data):
                    DispatchQueue.main.async {
                        cell.setupCell(world: data)
                    }
                }
            }
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 50
        case 1:
            return 180
        case 2:
            return 350
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case 0:
            performSegue(withIdentifier: "selectingSegue", sender: nil)
        default:
            print()
        }

    }
}

extension MainTableViewController: MainTableViewControllerDelegate{
    func setSelectedCountry(country: CountryDataModelObject) {
        DispatchQueue.main.async {
            self.selectedCountry = country
            self.tableView.reloadData()
        }
    }
}
