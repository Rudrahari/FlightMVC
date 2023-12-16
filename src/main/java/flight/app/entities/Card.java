package flight.app.entities;

import java.sql.Date;

public class Card {
	
	private int id;
	private String cardType;
	private String cardNo;
	private Date expiryDate;
	private boolean status;
	public Card() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Card(int id, String cardType, String cardNo, Date expiryDate, boolean status) {
		super();
		this.id = id;
		this.cardType = cardType;
		this.cardNo = cardNo;
		this.expiryDate = expiryDate;
		this.status = status;
	}
	public Card(String cardType, String cardNo, Date expiryDate, boolean status) {
		super();
		this.cardType = cardType;
		this.cardNo = cardNo;
		this.expiryDate = expiryDate;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Card [id=" + id + ", cardType=" + cardType + ", cardNo=" + cardNo + ", expiryDate=" + expiryDate
				+ ", status=" + status + "]";
	}
	
	

}
