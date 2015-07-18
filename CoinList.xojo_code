#tag Class
Protected Class CoinList
	#tag Method, Flags = &h0
		Sub Constructor()
		  // We need to create a new dictionary with keys of all the coin types and values of 0
		  // for each to show that there are no coins in our list.
		  self.Coins = New Dictionary
		  
		  self.ResetCoinCount(App.GoldCoins)
		  self.ResetCoinCount(App.SilverCoins)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindCoinsForWeight(coins() As String, targetWeight As Double) As Dictionary
		  // The returned dictionary contains a "coins" key with the list of coin weights found as its value, and a "remainder" key
		  // with whatever is left over below the weight of the smallest coin.
		  
		  Dim coinTotal As Integer = 0
		  Dim coinsFound() As String
		  
		  // Sort the list of coin weights in case we didn't get it sorted
		  coins.Sort
		  
		  // We need to keep looping until targetWeight is less than the smallest coin weight. We go through the coin list
		  // backwards because Xojo can't sort in reverse
		  While targetWeight > Val(coins(0))
		    For i As Integer = coins.Ubound DownTo 0
		      Dim coinWeight As Double = Val(coins(i))
		      If coinWeight <= targetWeight Then
		        coinsFound.Append(coins(i))
		        coinTotal = coinTotal + coinWeight
		        targetWeight = targetWeight - coinWeight
		        Exit
		      End If
		    Next
		  Wend
		  
		  // Now construct the dictionary to return
		  Dim coinsAndRemainder As New Dictionary
		  coinsAndRemainder.Value("coins") = coinsFound
		  coinsAndRemainder.Value("remainder") = targetWeight
		  Return coinsAndRemainder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetCoinCount(CoinDict As Dictionary)
		  // Resets the coins whose names are keys in the dictionary to have 0 coins
		  
		  For Each coinName As String in CoinDict.Keys
		    self.Coins.Value(coinName) = 0
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Dim outputString As String = ""
		  
		  For Each coinName As String In self.Coins.Keys
		    outputString = outputString + Str(self.Coins.Value(coinName) + " " + coinName + " ")
		  Next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Coins As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
