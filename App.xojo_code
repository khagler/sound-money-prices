#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // We need to convert the currency code JSON string in the kCurrencyCodes constant into a dictionary for
		  // the CurrencyCodes property.
		  self.CurrencyCodes = New Dictionary
		  Dim currenciesJSON As New JSONItem(self.kCurrencyCodes)
		  For Each code As String In currenciesJSON.Names()
		    self.CurrencyCodes.Value(code) = currenciesJSON.Value(code)
		  Next
		  
		End Sub
	#tag EndEvent


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
		  
		  me.ListIndex = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrencyCodes As Dictionary
	#tag EndProperty


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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
