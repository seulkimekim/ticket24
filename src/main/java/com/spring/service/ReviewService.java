package com.spring.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.model.InterReviewDAO;
import com.spring.model.ReviewVO;

@Service
public class ReviewService implements InterReviewService {

	@Autowired
	private InterReviewDAO dao;

	
	// 리뷰등록하기 (트랜잭션)
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor= {Throwable.class})
	public int addReview(HashMap<String, String> paraMap) {
		
		// 리뷰시퀀스 채번하기
		String seq = dao.selectReviewSeq();
		paraMap.put("seq", seq);
		
		int n = dao.addReview(paraMap);
		if(n == 1) { // 리뷰 등록 성공시 포인트 증가(트랜잭션)
			/*if(paraMap.get("date_id") != "") {
				paraMap.put("point", "150");
				paraMap.put("pointcontent", "리뷰 예매평 포인트 적립");
			}
			else {
				paraMap.put("point", "100");
				paraMap.put("pointcontent", "리뷰 기대평 포인트 적립");
			}*/
			dao.pointAdd(paraMap);
			dao.pointInsertReview(paraMap);
		}
		return n;
	}

	// 해당 상품에 달린 리뷰목록 가져오기
	@Override
	public List<ReviewVO> reviewList(HashMap<String, String> paraMap) {
		List<ReviewVO> reviewList = dao.reviewList(paraMap);
		return reviewList;
	}

	// 해당 상품(parentProdId) 에 해당하는 총 리뷰수 알아오기
	@Override
	public int getReviewTotalCount(HashMap<String, String> paraMap) {
		int n = dao.getReviewTotalCount(paraMap);
		return n;
	}

	// 해당 상품(parentProdId) 에 해당하는 평점 알아오기
	@Override
	public double getReviewAvgStar(HashMap<String, String> paraMap) {
		double n = dao.getReviewAvgStar(paraMap);
		return n;
	}

	// 리뷰 삭제하기 (트랜잭션)
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor= {Throwable.class})
	public int delReview(HashMap<String, String> paraMap) {
		int n = dao.delReview(paraMap);
		if(n == 1) { // 리뷰 삭제 성공시 포인트 회수 및 포인트테이블 내용삭제 (트랜잭션)
			dao.pointRemove(paraMap);
			dao.pointDeleteReview(paraMap);
		}
		return n;
	}

	// 리뷰 수정하기
	@Override
	public int editReview(HashMap<String, String> paraMap) {
		int n = dao.editReview(paraMap);
		return n;
	}

	// 리뷰 추천하기
	@Override
	public int likeReview(HashMap<String, String> paraMap) {
		int n = dao.likeReview(paraMap);
		return n;
	}

	// 리뷰 추천 취소하기
	@Override
	public int dislikeReview(HashMap<String, String> paraMap) {
		int n = dao.dislikeReview(paraMap);
		return n;
	}

	@Override
	public int existLikeReview(HashMap<String, String> paraMap) {
		int n = dao.existLikeReview(paraMap);
		return n;
	}

	// 해당 공연에 대한 추천있는 리뷰와 추천수
	@Override
	public List<String> reviewLikeList(HashMap<String, String> paraMap) {
		List<String> reviewLikeList = dao.reviewLikeList(paraMap);
		return reviewLikeList;
	}
	
	// 공연에 달린 리뷰의 추천수 
	@Override
	public List<HashMap<String, String>> reviewLikecntList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> reviewLikecntList = dao.reviewLikecntList(paraMap);
		return reviewLikecntList;
	}
	
}
