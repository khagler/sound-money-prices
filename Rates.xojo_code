#tag Class
Protected Class Rates
	#tag Method, Flags = &h0
		Function BitcoinsForFiat(fiat As Double) As Double
		  Return fiat / self.BitcoinRate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(currencyCode As String)
		  Dim rateSocket As New HTTPSecureSocket
		  Dim ratesString As String
		  Dim savedRates As New Dictionary
		  Dim oldRatesMessage As String = ""
		  
		  // Get the saved rates from the prefs in case we can't get new rates
		  savedRates = App.Prefs.Value("LastRates", Nil)
		  
		  If self.BitcoinRatesJSON = Nil Then
		    // TODO: Make this asynchronous
		    rateSocket.Yield = True
		    ratesString = rateSocket.Get(self.kBitcoinRatesURL, 5)
		    If rateSocket.ErrorCode <> 0 And savedRates <> Nil Then
		      // There was an error when retrieving the bitcoin rates, so use the old ones
		      // from the preferences if possible
		      ratesString = savedRates.Value("BitcoinRates")
		      oldRatesMessage = oldRatesMessage + "Bitcoin"
		    End If
		    Try
		      self.BitcoinRatesJSON = New JSONItem(ratesString)
		    Catch e As JSONException
		      MsgBox("JSON Exception: " + e.Message)
		    End Try
		    
		  End If
		  
		  if self.PMRatesXML = Nil Then
		    self.PMRatesXML = New XmlDocument
		    
		    // TODO: Make this asynchronous
		    rateSocket.Yield = True
		    ratesString = rateSocket.Get(self.kGoldSilverRatesURL, 5)
		    If rateSocket.ErrorCode <> 0 And savedRates <> Nil Then
		      // There was an error retrieving the precious metal rates, so use the old rates
		      // if possible
		      ratesString = savedRates.Value("PMRates")
		      If oldRatesMessage <> "" Then
		        oldRatesMessage = oldRatesMessage + " and "
		      End If
		      oldRatesMessage = oldRatesMessage + "precious metals"
		    End If
		    Try
		      self.PMRatesXML.LoadXml(ratesString)
		    Catch e As XmlException
		      MsgBox("XML error: " + e.Message)
		    End Try
		  End If
		  
		  // If we couldn't get some of the rates oldRatesMessage will not be empty, so we
		  // need to put up a message to alert the user.
		  If oldRatesMessage <> "" Then
		    MsgBox "Couldn't retrieve the rates for " + oldRatesMessage + ". Prices will be calculated using the rates from " + savedRates.Value("RatesDate").DateValue.AbbreviatedDate + "."
		  End If
		  
		  self.CurrencyCode = currencyCode
		  self.GetPreciousMetalRates
		  self.GetBitcoinRates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EstimateBitcoinRate()
		  // This method is used if there's no Bitcoin exchange rate available for the currency.
		  // We'll approximate by looking converting the gold equivalent to dollars, and from
		  // dollars to Bitcoin.
		  Dim goldInDollars As Currency = self.GetRateFromXML(self.PMRatesXML, "XAUUSD")
		  Dim btcInDollars As Currency = self.BitcoinRatesJSON.Child("USD").Value("24h")
		  Dim fiatInDollars As Currency = self.GoldRate / goldInDollars
		  self.BitcoinRate = fiatInDollars * btcInDollars
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FiatForGoldWeight(weight As Double) As Double
		  Return self.GoldRate * weight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FiatForSilverWeight(weight As Double) As Double
		  Return self.SilverRate * weight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetBitcoinRates()
		  If Not self.BitcoinRatesJSON.HasName(self.CurrencyCode) Then
		    // The JSON has no value for this currency, so use an estimate
		    EstimateBitcoinRate
		  Else
		    Dim currencyJSON As JSONItem = self.BitcoinRatesJSON.Child(self.CurrencyCode)
		    
		    Select Case True
		    Case currencyJSON.HasName("24h")
		      self.BitcoinRate = currencyJSON.Value("24h")
		    Case currencyJSON.HasName("7d")
		      self.BitcoinRate = currencyJSON.Value("7d")
		    Case currencyJSON.HasName("30d")
		      self.BitcoinRate = currencyJSON.Value("30d")
		    Else
		      // We got a JSON value for the currency, but it doesn't actually have any rates
		      // in it. I'm not sure if this situation can actually occur, but if it does we'll fall
		      // back on an estimate
		      EstimateBitcoinRate
		    End Select
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetPreciousMetalRates()
		  self.GoldRate = self.GetRateFromXML(self.PMRatesXML, "XAU" + self.CurrencyCode)
		  self.SilverRate = self.GetRateFromXML(self.PMRatesXML, "XAG" + self.CurrencyCode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRateFromXML(xml As XmlDocument, id As String) As Currency
		  // Takes an XmlDocument containing all of the returned rates, and a String containing the ID
		  // of one of the rates.
		  
		  Dim node As XmlNode = xml.Xql("//rate[@id='" + id + "']/Rate").Item(0)
		  // The rate is a String, which we need to convert to a Currency--we can't do that directly,
		  // hence the Variant.
		  Dim rateString As String = node.FirstChild.Value
		  Dim v As Variant = rateString
		  Return v.CurrencyValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GoldWeightForFiat(fiat As Double) As Double
		  Return fiat / self.GoldRate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SilverWeightForFiat(fiat As Double) As Double
		  Return fiat / self.SilverRate
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BitcoinRate As Currency
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared BitcoinRatesJSON As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrencyCode As String = "USD"
	#tag EndProperty

	#tag Property, Flags = &h0
		GoldRate As Currency
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared PMRatesXML As XmlDocument
	#tag EndProperty

	#tag Property, Flags = &h0
		SilverRate As Currency
	#tag EndProperty


	#tag Constant, Name = kBitcoinRatesURL, Type = String, Dynamic = False, Default = \"http://api.bitcoincharts.com/v1/weighted_prices.json", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kGoldSilverRatesURL, Type = String, Dynamic = False, Default = \"https://query.yahooapis.com/v1/public/yql\?q\x3Dselect%20%2A%20from%20yahoo.finance.xchange%20where%20pair%20in%20%28%22XAUARS%22%2C%20%22XAGARS%22%2C%20%22XAUAUD%22%2C%20%22XAGAUD%22%2C%20%22XAUBRL%22%2C%20%22XAGBRL%22%2C%20%22XAUGBP%22%2C%20%22XAGGBP%22%2C%20%22XAUCAD%22%2C%20%22XAGCAD%22%2C%20%22XAUCNY%22%2C%20%22XAGCNY%22%2C%20%22XAUCZK%22%2C%20%22XAGCZK%22%2C%20%22XAUDKK%22%2C%20%22XAGDKK%22%2C%20%22XAUEUR%22%2C%20%22XAGEUR%22%2C%20%22XAUHKD%22%2C%20%22XAGHKD%22%2C%20%22XAUINR%22%2C%20%22XAGINR%22%2C%20%22XAUIDR%22%2C%20%22XAGIDR%22%2C%20%22XAUILS%22%2C%20%22XAGILS%22%2C%20%22XAUJPY%22%2C%20%22XAGJPY%22%2C%20%22XAUMXN%22%2C%20%22XAGMXN%22%2C%20%22XAUNZD%22%2C%20%22XAGNZD%22%2C%20%22XAUNOK%22%2C%20%22XAGNOK%22%2C%20%22XAUPLN%22%2C%20%22XAGPLN%22%2C%20%22XAURUB%22%2C%20%22XAGRUB%22%2C%20%22XAUSGD%22%2C%20%22XAGSGD%22%2C%20%22XAUZAR%22%2C%20%22XAGZAR%22%2C%20%22XAUSEK%22%2C%20%22XAGSEK%22%2C%20%22XAUCHF%22%2C%20%22XAGCHF%22%2C%20%22XAUTHB%22%2C%20%22XAGTHB%22%2C%20%22XAUUSD%22%2C%20%22XAGUSD%22%29&format\x3Dxml&env\x3Dstore%3A%2F%2Fdatatables.org%2Falltableswithkeys", Scope = Private
	#tag EndConstant


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
