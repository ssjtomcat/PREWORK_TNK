Attribute VB_Name = "Module1"
Sub stock_market()

    'Loop through all sheets
    Dim WS_Count As Integer
    Dim T As Integer
    
    Dim starting_ws As Worksheet
    Set starting_ws = ActiveSheet
    'Set WS_Count equal to the number of worksheets in the active workbook
    WS_Count = ActiveWorkbook.Worksheets.Count
    
    For T = 1 To WS_Count
    
        ThisWorkbook.Worksheets(T).Activate
    
        'Set an initial variable for holding the ticker name
        Dim Ticker_Name As String
    
        'Get the Inital Price of the Year
        Dim Initial_Day_Price As Double
        Initial_Day_Price = Cells(2, 3).Value
    
        'Set the initial vairable for holding the total volume per ticker name
        Dim Stock_Volume As Double
        Total_Stock_Volume = 0
    
        'Keep track of the location for ticker in the summary table
        Dim Summary_Table_Row As Integer
        Summary_Table_Row = 2
    
        'Add headers for summary table
        Cells(1, 9).Value = "Ticker"
        Cells(1, 10).Value = "Yearly Change"
        Cells(1, 11).Value = "Percentage Change"
        Cells(1, 12).Value = "Total Stock Volume"
    
        'Find the last row of data
        Dim LastRow As Double
        LastRow = Cells(Rows.Count, 1).End(xlUp).Row
    
        'Loop through all tickers
        For i = 2 To LastRow
    
            'Check if we are still within the same ticker, if it is not...
            If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
        
                'Get the Last Volume of the Year
                Dim Last_Day_Price As Double
                Last_Day_Price = Cells(i, 6).Value
            
                'Set the Ticker
                Ticker_Name = Cells(i, 1).Value
            
                'Add to the Stock Volume
                Total_Stock_Volume = Total_Stock_Volume + Cells(i, 7).Value
            
                'Print the Ticker name in the Summary Table
                Range("I" & Summary_Table_Row).Value = Ticker_Name
            
                'Print the Yearly Change in the Summary Table
                Range("J" & Summary_Table_Row).Value = Last_Day_Price - Initial_Day_Price
            
                'Print the Percentage Change in the Summary Table
                    
                    'Check if Initial Day Price = 0 to prevent division by zero error
                    If Initial_Day_Price <> 0 Then
                    
                        Range("K" & Summary_Table_Row).Value = (Last_Day_Price - Initial_Day_Price) / Initial_Day_Price
                        Range("K" & Summary_Table_Row).NumberFormat = "0.00%"
                        
                    
                            'Positive change green, negative change red
                            If Range("K" & Summary_Table_Row).Value > 0 Then
                            
                                Range("K" & Summary_Table_Row).Interior.ColorIndex = "4"
                            
                            Else
                        
                                Range("K" & Summary_Table_Row).Interior.ColorIndex = "3"
                        
                            End If
                            
                    Else
                    
                        Range("K" & Summary_Table_Row).Value = 0
                        
                    End If
                
                'Print the Total Stock Volume in the Summary Table
                Range("L" & Summary_Table_Row).Value = Total_Stock_Volume
            
                'Add one to the summary table row
                Summary_Table_Row = Summary_Table_Row + 1
            
                'Reset the Total Stock Volume
                Total_Stock_Volume = 0
                                
                'Set the Inital value price for the next Ticker
                Initial_Day_Price = Cells(i + 1, 3).Value
            
                'If the cell immediately following a row is the same brand...
                Else
            
                    'Add to the Total Stock Volume
                    Total_Stock_Volume = Total_Stock_Volume + Cells(i, 7).Value
                
                End If
            
        Next i
        
        'Loop to find Greatest % Increase, Greatest % Decrease, Greatest Total Volume
        Dim LastRowHard As Double
        Dim j As Double
        Dim great_increase As Double
        Dim great_increaseTick As String
        Dim great_decrease As Double
        Dim great_decreaseTick As String
        Dim great_total_volume As Double
        Dim great_totalTick As String
        
        LastRowHard = Cells(Rows.Count, 9).End(xlUp).Row
        
        great_increase = Cells(2, 11).Value
        great_decrease = Cells(2, 11).Value
        great_total_volume = Cells(2, 12).Value
        great_increaseTick = Cells(2, 9).Value
        great_decreaseTick = Cells(2, 9).Value
        great_totalTick = Cells(2, 9).Value
        
        
        For j = 2 To LastRowHard
            
            'Find the greatest % increase
            If great_increase > Cells(j + 1, 11).Value Then
            
                great_increase = great_increase
                great_increaseTick = great_increaseTick
             
            Else
            
                great_increase = Cells(j + 1, 11).Value
                great_increaseTick = Cells(j + 1, 9).Value
            
                
            End If
            
            'Find the greatest % decrease
            If great_decrease < Cells(j + 1, 11).Value Then
            
                great_decrease = great_decrease
                great_decreaseTick = great_decreaseTick
             
            Else
            
                great_decrease = Cells(j + 1, 11).Value
                great_decreaseTick = Cells(j + 1, 9).Value
            
                
            End If
            
            'Find the greatest total volume
            If great_total_volume > Cells(j + 1, 12).Value Then
            
                great_total_volume = great_total_volume
                great_totalTick = great_totalTick
             
            Else
            
                great_total_volume = Cells(j + 1, 12).Value
                great_totalTick = Cells(j + 1, 9).Value
            
                
            End If
            
        Next j
        
        'Put the correct Ticker with the values
        Range("P1").Value = "Ticker"
        Range("P2").Value = great_increaseTick
        Range("P3").Value = great_decreaseTick
        Range("P4").Value = great_totalTick
        Range("Q1").Value = "Value"
        Range("O2").Value = "Greatest % Increase"
        Range("Q2").Value = great_increase
        Range("Q2").NumberFormat = "0.00%"
        Range("Q3").Value = great_decrease
        Range("Q3").NumberFormat = "0.00%"
        Range("Q4").Value = great_total_volume
        Range("O3").Value = "Greatest % Decrease"
        Range("O4").Value = "Greatest Total Volume"
        Range("Q4").NumberFormat = "############0"
        
        ThisWorkbook.Worksheets(T).Cells(1, 1) = 1
        
        'Autofit all columns
        Dim x As Integer
        
        For x = 1 To ActiveSheet.UsedRange.Columns.Count
            
            Columns(x).EntireColumn.AutoFit
            
        Next x
        
          
    Next T
    
    starting_ws.Activate

End Sub
