# examples
# Collections Tests - Fuc****** collections!!!
$listDouble = [System.Collections.Generic.List[double]]::new()
$listDouble.AddRange([double[]]@(1,2,3,4))

# Cast a specific type to match the type param of the method
$testDoubleArray = @(1,2,3,4)
[LiveCharts.Helpers.Extentions]::AsChartValues([System.Object[]]$testDoubleArray )