package com.kh.like5.booking.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.like5.booking.model.vo.Booking;
import com.kh.like5.booking.model.vo.Office;
import com.kh.like5.common.model.vo.Attachment;
import com.kh.like5.common.model.vo.PageInfo;

@Repository
public class BookingDao {

	public ArrayList<Office> selectList(SqlSessionTemplate sqlSession, Booking b){
		return (ArrayList)sqlSession.selectList("bookingMapper.selectList", b);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookingMapper.selectListCount");
	}
	
	public ArrayList<Office> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds  rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("bookingMapper.selectListAll", null, rowBounds);
	}
	
	public Office selectOffice(SqlSessionTemplate sqlSession, int officeNo) {
		return sqlSession.selectOne("bookingMapper.selectOffice", officeNo);
	}
	
	public int insertOffice(SqlSessionTemplate sqlSession, Office o) {
		return sqlSession.insert("bookingMapper.insertOffice", o);
	}
	
	public int insertOfficeAtt(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		int result = 0;
		for(Attachment att : list) {
			result = sqlSession.insert("bookingMapper.insertOfficeAtt", att);
		}
		return result;
	}
}