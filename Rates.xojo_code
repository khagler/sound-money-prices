#tag Class
Protected Class Rates
	#tag Method, Flags = &h0
		Sub Constructor()
		  self.GetPreciousMetalRates
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetPreciousMetalRates()
		  // We need to get the JSON containing the exchange rates as soon as the window activates.
		  
		  Dim ratesXML As New XmlDocument
		  Dim rateSocket As New HTTPSecureSocket
		  Dim ratesString As String
		  
		  // TODO: Make this asynchronous
		  rateSocket.Yield = True
		  ratesString = rateSocket.Get(self.kGoldSilverRatesURL, 0)
		  
		  Try
		    ratesXML.LoadXml(ratesString)
		  Catch e As XmlException
		    MsgBox("XML error: " + e.Message)
		  End Try
		  
		  self.GoldRate = self.GetRateFromXML(ratesXML, "XAUUSD")
		  self.SilverRate = self.GetRateFromXML(ratesXML, "XAGUSD")
		  
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


	#tag Property, Flags = &h0
		GoldRate As Currency
	#tag EndProperty

	#tag Property, Flags = &h0
		SilverRate As Currency
	#tag EndProperty


	#tag Constant, Name = kGoldSilverRatesURL, Type = String, Dynamic = False, Default = \"https://query.yahooapis.com/v1/public/yql\?q\x3Dselect%20%2A%20from%20yahoo.finance.xchange%20where%20pair%20in%20%28%22XAUUSD%22%2C%20%22XAGUSD%22%29&format\x3Dxml&env\x3Dstore%3A%2F%2Fdatatables.org%2Falltableswithkeys", Scope = Private
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
