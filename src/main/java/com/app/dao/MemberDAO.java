package com.app.dao;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.MemberVO;

public class MemberDAO {
	private SqlSession sqlSession;
	
	public MemberDAO() {
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}

//  insert
  public void save(MemberVO memberVO) {
     sqlSession.insert("member.insert", memberVO);
  }
  
//  select: 전체 조회
//  public void findAll() {}
  
//  select: 단일 조회
//  이메일로 아이디를 조회
//  by[조건절]
//  find[찾아오는 값]
//  public void findIdbyMemberEmail(String memberEmail) {}
  
//  아이디와 비밀번호를 받아서 회원을 조회
//  public void findMemberByMemberEmailAndMemberPassword(String memberEmail, String memberPassword) {}
}
