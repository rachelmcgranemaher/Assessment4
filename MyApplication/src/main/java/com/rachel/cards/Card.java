package com.rachel.cards;

public class Card {
	
	private String firstName, surname, address, town, county, cardNumber;
	private int cardType, expiryMonth, expiryYear;

	public Card(String firstName, String surname, String address, String town, String county, 
			String cardNumber, int cardType, int expiryMonth, int expiryYear) {
		
		this.firstName = firstName;
		this.surname = surname;
		this.address = address;
		this.town = town;
		this.county = county;
		this.cardNumber = cardNumber;
		this.cardType = cardType;
		this.expiryMonth = expiryMonth;
		this.expiryYear = expiryYear;

	}

}
