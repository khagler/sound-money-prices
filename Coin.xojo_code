#tag Class
Protected Class Coin
	#tag Method, Flags = &h0
		Sub Constructor(coinName As String = "", coinWeight As Double = 0.0, coinMetal As Metals = Metals.Gold)
		  // This is the default constructor.
		  
		  self.Name = coinName
		  self.Weight = coinWeight
		  self.Metal = coinMetal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(coinName As String, coinWeight As Double, coinMetal As String)
		  // This constructor is used when the metal type is a string. It just calls the default constructor with
		  // the appropriate value from the Metals enumeration in place of that string, or raises an exception
		  // if the metal type is unknown.
		  
		  Select Case coinMetal.Lowercase
		  Case "copper"
		    self.Constructor(coinName, coinWeight, Metals.Copper)
		  Case "silver"
		    self.Constructor(coinName, coinWeight, Metals.Silver)
		  Case "gold"
		    self.Constructor(coinName, coinWeight, Metals.Gold)
		  Case "platinum"
		    self.Constructor(coinName, coinWeight, Metals.Platinum)
		  Else
		    Dim r As New RuntimeException
		    r.ErrorNumber = -1
		    r.Message = "Unknown metal type: " + coinMetal
		    Raise r
		  End Select
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Metal As Metals
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Weight As Double
	#tag EndProperty


	#tag Enum, Name = Metals, Type = Integer, Flags = &h0
		Copper
		  Silver
		  Gold
		Platinum
	#tag EndEnum


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
			Name="Metal"
			Group="Behavior"
			Type="Metals"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
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
		#tag ViewProperty
			Name="Weight"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
