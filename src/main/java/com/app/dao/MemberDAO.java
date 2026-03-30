package com.app.dao;

import java.util.Optional;

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
  
//  이메일과 비밀번호로 회원 조회
  public Optional<MemberVO> findByMemberEmailAndMemberPassword(MemberVO memberVO) {
	  return Optional.ofNullable(sqlSession.selectOne("member.selectByMemberEmailAndMemberPassword", memberVO));
  }
  
//  이메일로 회원 여부 조회
  public int existsByMemberEmail(String memberEmail) {
	  int a = sqlSession.selectOne("existsByMemberEmail", memberEmail);
	  System.out.println("갯수 : " + a);
	  return a;
  }
  
//  이메일로 회원 조회
  public Optional<MemberVO> findByMemberEmail(String memberEmail){
	  return Optional.ofNullable(sqlSession.selectOne("member.selectByMemberEmail", memberEmail));
  }
  
//  id로 회원 조회
  public Optional<MemberVO> findById(Long id){
	  return Optional.ofNullable(sqlSession.selectOne("member.selectById", id));
  }
  
  public Long selectIdByMemberEmail(String memberEmail) {
	  return sqlSession.selectOne("member.selectIdByMemberEmail", memberEmail);
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
