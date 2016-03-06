#tag Class
Protected Class CoinList
	#tag Method, Flags = &h0
		Sub Constructor()
		  // If either the GoldCoins or SilverCoins shared property is nil, we need to load the
		  // JSON containing the known coins into them.
		  If self.GoldCoins = Nil Or self.SilverCoins = Nil Then
		    self.SetKnownCoins(New JSONItem(Constants.kCoinWeights))
		  End If
		  
		  // We need to create a new dictionary with keys of all the coin types and values of 0
		  // for each to show that there are no coins in our list.
		  self.Coins = New Dictionary
		  
		  self.ResetCoinCount(self.GoldCoins)
		  self.ResetCoinCount(self.SilverCoins)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fiatPrice As Double, theRates As Rates)
		  // This constructor finds a list of coins that meet a specified fiat price based on
		  // specified current rates.
		  
		  // Call the constructor with no parameters to get a fresh Coins dictionary
		  self.Constructor
		  
		  // Start by finding the gold weight for the fiat price
		  Dim PMWeight As Double = theRates.GoldWeightForFiat(fiatPrice)
		  Dim remainder As Double
		  
		  // Look for gold coins to add to the list
		  remainder = self.FindCoinsForWeight(self.GoldCoins, PMWeight)
		  
		  // Next convert the remainder weight back to fiat, and from there into silver weight
		  remainder = theRates.FiatForGoldWeight(remainder)
		  PMWeight = theRates.SilverWeightForFiat(remainder)
		  
		  // Now look for silver coins to add
		  remainder = self.FindCoinsForWeight(self.SilverCoins, PMWeight)
		  
		  self.SilverRemainder = remainder
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindCoinsForWeight(coinDict As Dictionary, targetWeight As Double) As Double
		  // The Double returned is whatever is left over below the weight of the smallest coin.
		  
		  Dim coinTotal As Integer = 0
		  
		  // Get the coin weights for this kind of coin as an array of strings. They can be
		  // found as the keys in the coinDict dictionary.
		  Dim coinWeights() As String
		  coinWeights = NativeSubclass.DictionaryCaseSensitive.VariantArrayToStringArray(coinDict.Keys)
		  coinWeights.Sort
		  
		  // Check if targetWeight is below the smallest coin weight. If it is, just return the targetWeight now.
		  If targetWeight < Val(coinWeights(0)) Then
		    Return targetWeight
		  End If
		  
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
		        // Now break out of the For loop and continue the While loop. We do this so we don't start adding
		        // smaller coins when another of the largest coins might do.
		        Exit
		      End If
		    Next
		  Wend
		  
		  Return targetWeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemainderInFiat(rate As Rates) As Double
		  Return rate.FiatForSilverWeight(self.SilverRemainder)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub RemoveCoin(coinToRemove As Coin)
		  CoinList.KnownCoins.Remove CoinList.KnownCoins.IndexOf(coinToRemove)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetCoinCount(CoinDict As Dictionary)
		  // Resets the coins whose names are keys in the dictionary to have 0 coins
		  
		  For Each coinWeight As String in CoinDict.Keys
		    self.Coins.Value(CoinDict.Value(coinWeight)) = 0
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub SetKnownCoins(coinsJSON As JSONItem)
		  // Takes JSON containing all of the known coins and sets up the class's
		  // KnownCoins shared property. This needs to be called  before a CoinList
		  // instance can be used.
		  
		  For Each coinObject As JSONItem In New JSONItem(Constants.kCoinWeights)
		    self.KnownCoins.Append Coin(coinObject)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringArrayValue() As String()
		  Dim outputArray() As String
		  Dim stringValue As String
		  
		  For Each coinName As String In self.Coins.Keys
		    If self.Coins.Value(coinName) > 0 Then
		      stringValue = Str(self.Coins.Value(coinName) + " " + coinName)
		      If self.Coins.Value(coinName) > 1 Then
		        stringValue = stringValue + "s"
		      End If
		      outputArray.Append(stringValue)
		    End If
		  Next
		  
		  Return outputArray
		End Function
	#tag EndMethod


	#tag Note, Name = Dependencies
		
		macoslib: The FindCoinsForWeight method uses NativeSubclass.DictionaryCaseSensitive.VariantArrayToStringArray from macoslib.
	#tag EndNote


	#tag Property, Flags = &h21
		Private Coins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared GoldCoins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared KnownCoins() As Coin
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared SilverCoins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SilverRemainder As Double = 0
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
			Name="StringValue"
			Group="Behavior"
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
