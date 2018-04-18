# examples
# Collections Tests - Fuc** collections!!!
#$listDouble = [System.Collections.Generic.List[double]]::new()
#$listDouble.AddRange([double[]]@(1,2,3,4))

# Cast a specific type to match the type param of the method
#$testDoubleArray = @(1,2,3,4)
#[LiveCharts.Helpers.Extentions]::AsChartValues([System.Object[]]$testDoubleArray )

####################################
# SECOND APPROACH
####################################

#$DoughnutCollection = [LiveCharts.SeriesCollection]::new()
#$Processes2 = Get-Process | Sort-Object -Property WS | Select-Object Name,WS -Last 5 
#[LiveCharts.Helpers.Extentions]::AsSeriesCollection()
#$toto = [System.Collections.Generic.IEnumerable[Object]]$Processes
#$test = [LiveCharts.Helpers.Extentions]::AsChartValues($toto)

##== Serie 1 ===
 #   $lineserie1 = [LiveCharts.Wpf.LineSeries]::new()
 #   $lineserie1.Title = "serie 1"
#    $lineserie1.Values  = [LiveCharts.ChartValues[double]]::new([double[]]@(6,3,7,2))

###== Serie 2 ===

#    $lineserie2 = [LiveCharts.Wpf.LineSeries]::new()
#    $lineserie2.Title = "serie 2"
#    $lineserie2.Values  = [LiveCharts.ChartValues[double]]::new([double[]]@(4,5,2,9) )


##== Serie 3 ===
#    $lineserie3 = [LiveCharts.Wpf.LineSeries]::new()
#    $lineserie3.Title = "serie 3"
#    $lineserie3.Values  = [LiveCharts.ChartValues[double]]::new([double[]]@(7,3,5,6) )


#$seriesCollection.Add($lineserie1)
#$seriesCollection.Add($lineserie2)
#$seriesCollection.Add($lineserie3)