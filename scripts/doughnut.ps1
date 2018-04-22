####################################
# LOAD VIEW XAML
####################################

$XamlChildWindow = LoadXaml($viewFolder+"\doughnut.xaml")
$Childreader     = (New-Object System.Xml.XmlNodeReader $XamlChildWindow)
$DoughnutXaml   = [Windows.Markup.XamlReader]::Load($Childreader)

$DoughnutView  = $Form.FindName("DoughnutView")
$DoughnutView.Children.Add($DoughnutXaml)    | Out-Null    

####################################
# INITIALIZE CONTROL
####################################

$Doughnut  = $DoughnutXaml.FindName("Doughnut")

####################################
# DATAS
####################################

$Processes = Get-Process | Sort-Object -Property WS | Select-Object Name,WS,ID -Last 5 


####################################
# FIRST APPROACH
####################################

# observablCollection is easier to handle :)
$script:observableCollection = [System.Collections.ObjectModel.ObservableCollection[Object]]::new()
$DoughnutCollection = [LiveCharts.SeriesCollection]::new()

foreach ($proc in $Processes){

    $chartvalue1 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
    $doughnutSeries = [LiveCharts.Wpf.PieSeries]::new()

    $value = $proc.WS/10MB
    $label = $proc.Name.ToString()

    $chartvalue1.Add([LiveCharts.Defaults.ObservableValue]::new($value))

    $doughnutSeries.Values = $chartvalue1
    $doughnutSeries.Title = $label
    $doughnutSeries.DataLabels = $true

    $DoughnutCollection.Add($doughnutSeries)

}






