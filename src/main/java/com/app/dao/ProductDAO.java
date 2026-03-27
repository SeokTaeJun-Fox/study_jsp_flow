package com.app.dao;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.app.mybatis.config.MyBatisConfig;
import com.app.vo.ProductVO;

public class ProductDAO {
	private SqlSession sqlSession;
	
	public ProductDAO(){
		sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	}
	
//	상품 등록
	public void save(ProductVO productVO) {
		sqlSession.insert("product.insert", productVO);
	};
	
//	상품 전체 조회
	public List<ProductVO> findAll() {
		return sqlSession.selectList("product.selectAll");
	}
	
//	상품 단일 조회
	public Optional<ProductVO> findById(Long id) {
		return Optional.ofNullable(sqlSession.selectOne("product.selectById", id));
	}
	
//	상품 수정
	public void update(ProductVO productVO) {
		sqlSession.update("product.update", productVO);
	}
	
//	상품 삭제
	public void delete(Long id) {
		sqlSession.delete("product.delete", id);
	}
}
