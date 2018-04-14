

$Processes = Get-Process | Sort-Object -Property WS | Select-Object Name,WS,ID -Last 5 


# observablCollection is easier to handle :)
$script:observableCollection = [System.Collections.ObjectModel.ObservableCollection[Object]]::new()


####################################
# FIRST APPROACH
####################################


$DoughnutCollection = [LiveCharts.SeriesCollection]::new()

foreach ($proc in $Processes){

    $chartvalue1 = [LiveCharts.ChartValues[LiveCharts.Defaults.ObservableValue]]::new()
    $pieSeries = [LiveCharts.Wpf.PieSeries]::new()

    $value = $proc.WS/1MB
    $label = $proc.Name.ToString()

    $chartvalue1.Add([LiveCharts.Defaults.ObservableValue]::new($value))

    $pieSeries.Values = $chartvalue1
    $pieSeries.Title = $label
    $pieSeries.DataLabels = $true

    $DoughnutCollection.Add($pieSeries)

}


####################################
# SECOND APPROACH
####################################

$DoughnutCollection = [LiveCharts.SeriesCollection]::new()

$Processes2 = Get-Process | Sort-Object -Property WS | Select-Object Name,WS -Last 5 

[LiveCharts.Helpers.Extentions]::AsSeriesCollection()





#$toto = [System.Collections.Generic.IEnumerable[Object]]$Processes

#$test = [LiveCharts.Helpers.Extentions]::AsChartValues($toto)



