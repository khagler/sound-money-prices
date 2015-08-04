#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Quit the app if the window is closed
		  App.AutoQuit = True
		  
		  // Instantiate prefs
		  self.Prefs = New TTsSmartPreferences("Sound Money Prices")
		  
		  // Enable the Tools menu if we're not running on a Mac.
		  #If TargetMacOS <> True
		    ToolsMenu.Enabled = True
		  #Endif
		  
		  // We need to convert the currency code JSON string in the Constants.kCurrencyCodes constant into a
		  // dictionary for the CurrencyCodes property.
		  self.CurrencyCodes = New Dictionary
		  Dim currenciesJSON As New JSONItem(Constants.kCurrencyCodes)
		  For Each code As String In currenciesJSON.Names()
		    self.CurrencyCodes.Value(code) = currenciesJSON.Value(code)
		  Next
		  
		  // Now convert the coin weights JSON string in Constants.kCoinWeights into dictionaries for the CoinList
		  // shared properties
		  Dim coinsJSON As New JSONItem(Constants.kCoinWeights)
		  CoinList.SetKnownCoins(coinsJSON)
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
		Prefs As TTsSmartPreferences
	#tag EndProperty


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
