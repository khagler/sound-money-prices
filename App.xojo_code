#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Instantiate prefs
		  self.Prefs = New TTsSmartPreferences("Sound Money Prices")
		  
		  // Enable the Tools menu if we're not running on a Mac.
		  #If TargetMacOS <> True
		    ToolsMenu.Enabled = True
		  #Endif
		  
		  // We need to convert the currency code JSON string in the kCurrencyCodes constant into a dictionary for
		  // the CurrencyCodes property.
		  self.CurrencyCodes = New Dictionary
		  Dim currenciesJSON As New JSONItem(self.kCurrencyCodes)
		  For Each code As String In currenciesJSON.Names()
		    self.CurrencyCodes.Value(code) = currenciesJSON.Value(code)
		  Next
		  
		  // Now convert the coin weights JSON string in kCoinWeights into dictionaries
		  Dim coinsJSON As New JSONItem(self.kCoinWeights)
		  self.GoldCoins = self.CoinJSONToDictionary(coinsJSON.Value("gold"))
		  self.SilverCoins = self.CoinJSONToDictionary(coinsJSON.Value("silver"))
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function HelpAboutSoundMoneyPrices() As Boolean Handles HelpAboutSoundMoneyPrices.Action
			AboutWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsPrefs() As Boolean Handles ToolsPrefs.Action
			PreferencesWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Function CoinJSONToDictionary(coins As JSONItem) As Dictionary
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
		Sub PopulateCurrencyPopup(popup As PopupMenu)
		  // The variant keys aren't very useful, so we need to turn them into an array of strings
		  Dim codes() As String
		  For Each value As Variant in self.CurrencyCodes.Keys()
		    codes.Append value
		  Next
		  codes.Sort
		  For i As Integer = 0 To codes.Ubound
		    popup.AddRow(self.CurrencyCodes.Value(codes(i)))
		    popup.RowTag(i) = codes(i)
		  Next
		  
		  // Now that the menu is populated, we need to check the prefs to find out what our
		  // default currency should be. If the pref isn't set, use US dollars as the default.
		  
		  Dim defaultCurrency As String = App.Prefs.Value("Currency", "USD")
		  
		  For i As Integer = 0 To popup.ListCount - 1
		    if popup.RowTag(i) = defaultCurrency Then
		      popup.ListIndex = i
		      Exit
		    End If
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrencyCodes As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		GoldCoins As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Prefs As TTsSmartPreferences
	#tag EndProperty

	#tag Property, Flags = &h0
		SilverCoins As Dictionary
	#tag EndProperty


	#tag Constant, Name = kCoinWeights, Type = String, Dynamic = False, Default = \"{\n  \"gold\": {\n    \"1 oz gold coin\": \"1\"\x2C\n    \"1/2 oz gold coin\": \"0.5\"\x2C\n    \"1/4 oz gold coin\": \"0.25\"\x2C\n    \"1/10 oz gold coin\": \"0.1\"\x2C\n    \"gold sovereign\": \"0.235420\"\x2C\n    \"gold dinar\": \"0.1366\"\n  }\x2C\n  \"silver\": {\n    \"1 oz silver coin\": \"1\"\x2C\n    \"silver dirham\": \"0.095648\"\x2C\n    \"silver dime\": \"0.07234\"\x2C\n    \"silver quarter\": \"0.18085\"\x2C\n    \"silver half dollar\": \"0.3617\"\n  }\n}", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCurrencyCodes, Type = String, Dynamic = False, Default = \"{\n\t\"ARS\": \"Argentine Pesos\"\x2C\n\t\"AUD\": \"Australian Dollars\"\x2C\n\t\"BRL\": \"Brazilian Reals\"\x2C\n\t\"GBP\": \"British Pounds\"\x2C\n\t\"CAD\": \"Canadian Dollars\"\x2C\n\t\"CNY\": \"Chinese Yuans\"\x2C\n\t\"CZK\": \"Czech Korunas\"\x2C\n\t\"DKK\": \"Danish Krones\"\x2C\n\t\"EUR\": \"Euros\"\x2C\n\t\"HKD\": \"Hong Kong Dollars\"\x2C\n\t\"INR\": \"Indian Rupees\"\x2C\n\t\"IDR\": \"Indonesian Rupiahs\"\x2C\n\t\"ILS\": \"Israeli Shekels\"\x2C\n\t\"JPY\": \"Japanese Yen\"\x2C\n\t\"MXN\": \"Mexican Pesos\"\x2C\n\t\"NZD\": \"New Zealand Dollars\"\x2C\n\t\"NOK\": \"Norwegian Krones\"\x2C\n\t\"PLN\": \"Polish Zlotys\"\x2C\n\t\"RUB\": \"Russian Rubles\"\x2C\n\t\"SGD\": \"Singapore Dollars\"\x2C\n\t\"ZAR\": \"South African Rands\"\x2C\n\t\"SEK\": \"Swedish Kronas\"\x2C\n\t\"CHF\": \"Swiss Francs\"\x2C\n\t\"THB\": \"Thai Bahts\"\x2C\n\t\"USD\": \"US Dollars\"\n}", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kPreferences, Type = String, Dynamic = False, Default = \"&Options\xE2\x80\xA6", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Preferences\xE2\x80\xA6"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
