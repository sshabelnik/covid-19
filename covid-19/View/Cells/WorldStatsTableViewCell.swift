
import UIKit
import Charts

class WorldStatsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var confirmedCovidLabel: UILabel!
    @IBOutlet weak var sickCovidLabel: UILabel!
    @IBOutlet weak var recoveredCovidLabel: UILabel!
    @IBOutlet weak var deathsCovidLabel: UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    var sickDataEntry = PieChartDataEntry(value: 0)
    var recoveredDataEntry = PieChartDataEntry(value: 0)
    var deathsDataEntry = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.mainView.layer.shadowColor = UIColor.black.cgColor
//        self.mainView.layer.shadowOpacity = 0.5
//        self.mainView.layer.shadowOffset = .zero
//        self.mainView.layer.shadowRadius = 3.0
//        
//        self.mainView.layer.cornerRadius = 10.0
        
    }
    
    func setupCell(world: WorldDataModelObject){
        self.confirmedCovidLabel.text = String(world.totalConfirmedCases.formattedWithSeparator)
        self.sickCovidLabel.text = String((world.totalSickCases).formattedWithSeparator)
        self.recoveredCovidLabel.text = String(world.totalRecoveredCases.formattedWithSeparator)
        self.deathsCovidLabel.text = String(world.totalDeaths.formattedWithSeparator)
        setupPieChartView(world: world)
    }
    
    func setupPieChartView(world: WorldDataModelObject){
        sickDataEntry.value = Double(world.totalSickCases)
        recoveredDataEntry.value = Double(world.totalRecoveredCases)
        deathsDataEntry.value = Double(world.totalDeaths)
        
        numberOfDownloadsDataEntries = [sickDataEntry, recoveredDataEntry, deathsDataEntry]
        pieChartView.legend.enabled = false
        pieChartView.chartDescription?.enabled = false
        pieChartView.transparentCircleRadiusPercent = 0
        pieChartView.holeRadiusPercent = 0.8
        
        updateChartData()
    }
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        chartDataSet.selectionShift = 0
        chartDataSet.drawValuesEnabled = false
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor.orange,  UIColor.green, UIColor.red]
        chartDataSet.colors = colors

        pieChartView.data = chartData
        
    }
}
