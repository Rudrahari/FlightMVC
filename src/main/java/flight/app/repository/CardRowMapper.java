package flight.app.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import flight.app.entities.Card;

public class CardRowMapper implements RowMapper<Card>{

	@Override
	public Card mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Card card=new Card();
		card.setId(rs.getInt("id"));
		card.setCardNo(rs.getString("card_no"));
		card.setCardType(rs.getString("card_type"));
		card.setExpiryDate(rs.getDate("expiry_date"));
		card.setStatus(rs.getBoolean("status"));
		return card;
	}

}
