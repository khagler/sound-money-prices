#tag Class
Protected Class CoinList
	#tag Method, Flags = &h0
		 Shared Function CoinJSONToDictionary(coins As JSONItem) As Dictionary
		  // This method takes a JSON item with coin names as keys and coin weights
		  // as values, and returns a dictionary with the weights as the keys and the
		  // names as the values. It's done this way because it's easier to maintain the
		  // JSON with the names as the keys, but easier to figure out which coins to
		  // use with weights as the keys.
		  
		  Dim coinDict As New Dictionary
		  
		  For Each coin As String In coins.Names
		    coinDict.Value(coins.Value(coin)) = coin
		  Next
		  
		  Return coinDict
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // We need to create a new dictionary with keys of all the coin types and values of 0
		  // for each to show that there are no coins in our list.
		  self.Coins = New Dictionary
		  
		  self.ResetCoinCount(self.GoldCoins)
		  self.ResetCoinCount(self.SilverCoins)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindCoinsForWeight(coinDict As Dictionary, targetWeight As Double) As Double
		  // The Double returned is whatever is left over below the weight of the smallest coin.
		  
		  Dim coinTotal As Integer = 0
		  
		  // Xojo makes us jump through some hoops here to get the dictionary's keys (which are strings) into an
		  // array of strings.
		  Dim coinWeights() As String
		  For Each value As Variant in coinDict.Keys
		    coinWeights.Append(value.StringValue)
		  Next
		  coinWeights.Sort
		  
		  // We need to keep looping until targetWeight is less than the smallest coin weight. We go through the coin list
		  // backwards because Xojo can't sort in reverse
		  While targetWeight > Val(coinWeights(0))
		    For i As Integer = coinWeights.Ubound DownTo 0
		      Dim coinWeight As Double = Val(coinWeights(i))
		      If coinWeight <= targetWeight Then
		        // Add a coin to the list
		        self.Coins.Value(coinDict.Value(coinWeights(i))) = self.Coins.Value(coinDict.Value(coinWeights(i))) + 1
		        coinTotal = coinTotal + coinWeight
		        targetWeight = targetWeight - coinWeight
		        Exit
		      End If
		    Next
		  Wend
		  
		  Return targetWeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindSmallestCoin(coins As Dictionary) As Double
		  // Finds the smallest coin among the coins in the passed dictionary and returns
		  // its weight as a Double.
		  
		  Dim coinWeights() As String
		  coinWeights = self.VariantArrayToStringArray(coins.Keys)
		  coinWeights.Sort
		  Return coinWeights(0).Val
		  
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

	#tag Method, Flags = &h21
		Private Function VariantArrayToStringArray(arrayIn() As Variant) As String()
		  // Xojo makes us jump through some hoops here to turn an array of variants
		  // (such as a dictionary's keys) into an array of strings.
		  
		  Dim arrayOut() As String
		  
		  For Each item As Variant in arrayIn
		    arrayOut.Append(item.StringValue)
		  Next
		  Return arrayOut
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Coins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared GoldCoins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared SilverCoins As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim outputString As String = ""
			  
			  For Each coinName As String In self.Coins.Keys
			    outputString = outputString + Str(self.Coins.Value(coinName) + " " + coinName + " ")
			  Next
			End Get
		#tag EndGetter
		StringValue As String
	#tag EndComputedProperty


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
