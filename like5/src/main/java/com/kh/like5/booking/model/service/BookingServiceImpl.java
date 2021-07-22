package com.kh.like5.booking.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.like5.booking.model.dao.BookingDao;
import com.kh.like5.booking.model.vo.Booking;
import com.kh.like5.booking.model.vo.Office;
import com.kh.like5.common.model.vo.Attachment;
import com.kh.like5.common.model.vo.PageInfo;

@Service
public class BookingServiceImpl implements BookingService{

	@Autowired
	private BookingDao bDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Office> selectList(Booking b) {
	
		return bDao.selectList(sqlSession, b);
	}

	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Office> selectListAll(PageInfo pi) {
		return bDao.selectListAll(sqlSession, pi);
	}

	@Override
	public ArrayList<Office> selectListAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertOffice(Office o, ArrayList<Attachment> list) {
		int result1 = bDao.insertOffice(sqlSession, o);
		int result2 = 1;
		if(list != null) {
			result2 = bDao.insertOfficeAtt(sqlSession, list);
		}
		return result1*result2;
	}

	@Override
	public int updateOffice(Office o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOffice(Office o) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Office> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Office selectOffice(int officeNo) {
		return bDao.selectOffice(sqlSession, officeNo);
	}

}