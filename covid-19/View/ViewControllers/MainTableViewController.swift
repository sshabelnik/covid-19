
import UIKit

protocol MainTableViewControllerDelegate: AnyObject{
    func setSelectedCountry(country: CountryDataModelObject)
}

class MainTableViewController: UIViewController {
    
    var presenter: MainViewOutput!
    
    var worldData: WorldDataModelObject?
    var selectedCountry: CountryDataModelObject?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getData()
        presenter.getAndSaveWorldData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        registerNibs()
    }
    
    func registerNibs(){
        let countryNib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        tableView.register(countryNib, forCellReuseIdentifier: "CountryTableViewCell")

        let currentCountryNib = UINib(nibName: "CurrentCountryTableViewCell", bundle: nil)
        tableView.register(currentCountryNib, forCellReuseIdentifier: "CurrentCountryTableViewCell")
        
        let worldStatsNib = UINib(nibName: "WorldStatsTableViewCell", bundle: nil)
        tableView.register(worldStatsNib, forCellReuseIdentifier: "WorldStatsTableViewCell")
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.prepareSegue(for: segue)
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
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentCountryTableViewCell") as! CurrentCountryTableViewCell
            guard let country = selectedCountry else { return UITableViewCell()}
            cell.setCurrentCountry(country: country)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
            guard let country = selectedCountry else { return UITableViewCell()}
            DispatchQueue.main.async {
                cell.setupCell(for: country)
            }
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorldStatsTableViewCell") as! WorldStatsTableViewCell
            guard let worldData = worldData else { return UITableViewCell() }
            cell.setupCell(world: worldData)
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
            return 250
        case 2:
            return 350
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            performSegue(withIdentifier: "selectingSegue", sender: nil)
        }
    }
}

extension MainTableViewController: MainViewInput {
    func setCurrentCountry(country: CountryDataModelObject) {
        self.selectedCountry = country
        self.tableView.reloadData()
    }
    
    func setWorldData(data: WorldDataModelObject) {
        self.worldData = data
        self.tableView.reloadData()
    }
}


