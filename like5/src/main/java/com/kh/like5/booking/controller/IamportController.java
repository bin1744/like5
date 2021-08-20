package com.kh.like5.booking.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.io.IOException;

import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentCancelDetail;

@Controller
@RequestMapping("submitBook.bk")
public class IamportController {
	
	IamportClient client;
	
	public IamportController() {
		this.client = this.getTestClient();
	}
	
	IamportClient getTestClient() {
		String test_api_key = "6463301009484840";//내거 넣기
		String test_api_secret = "8c19e02093968c566bb2835e8c43fe4eb0eb89cfc39a862523e347d6e9beccb0a5a92537f5bb183c";//여기도
		return new IamportClient(test_api_key, test_api_secret);
	}
	
	@Test
	public void testGetToken() {
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();
			
			assertNotNull(auth_response.getResponse());
			assertNotNull(auth_response.getResponse().getToken());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				System.out.println("http status code 401");
				break;
			case 500 :
				System.out.println("http status code 500");
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@PostMapping("payInfo")
	public void testPaymentByImpUid() {
		
		String test_imp_uid = "imp_448280090638";//내걸로바꿔야함
		try {
			IamportResponse<Payment> payment_response = client.paymentByImpUid(test_imp_uid);
			//이부분을 잘 모르겠음
			assertNotNull(payment_response.getResponse());
			assertEquals(test_imp_uid, payment_response.getResponse().getImpUid());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String test_imp_uid_cancelled = "imp_138841716839";
		try {
			IamportResponse<Payment> cancelled_response = client.paymentByImpUid(test_imp_uid_cancelled);
			
			Payment cancelled = cancelled_response.getResponse();
			PaymentCancelDetail[] cancelDetail = cancelled.getCancelHistory();
			
			assertEquals(cancelDetail.length, 1);
			assertNotNull(cancelDetail[0].getPgTid());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
