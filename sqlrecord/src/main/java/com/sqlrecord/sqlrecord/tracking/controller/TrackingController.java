package com.sqlrecord.sqlrecord.tracking.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sqlrecord.sqlrecord.orders.model.service.OrdersService;
import com.sqlrecord.sqlrecord.orders.model.vo.MemberOrdersDetail;
import com.sqlrecord.sqlrecord.tracking.model.service.TrackingService;
import com.sqlrecord.sqlrecord.tracking.model.vo.TrackingInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/trackingRest")
public class TrackingController {
	
	
	
	private final TrackingService trackingService;
	private final OrdersService ordersService;
	
	
	@GetMapping(value = "/divide" , produces = "application/json; charset=UTF-8")
	public List<MemberOrdersDetail> getDivideTracking(String param) {
		
		List<MemberOrdersDetail> modList = ordersService.getOrdersDetailAll();
		
		
		List<MemberOrdersDetail> newList = (List<MemberOrdersDetail>) modList.stream()
																			 .filter((item) -> param.equals(item.getMemberOrdersDetailStatus()) && item.getTrackingNum() != 0)
																			 .collect(Collectors.toList());
		
		log.info("왔냐 : {}" , param);
		
		
		return  newList;
	}
	
	
	@GetMapping(value = "/insert" , produces = "application/json; charset=UTF-8")
	public TrackingInfo insertTrackingInf(int trackingNum , String  trackingInfoWhere , boolean trackingStatus) {
		
		log.info("트래킹넘버 왔냐 : {}" , trackingNum);
		log.info("트래킹웨어 왔냐 : {}" , trackingInfoWhere);
		log.info("트래킹스테이터스왔냐 : {}" , trackingStatus);
		
		MemberOrdersDetail memberOrdersDetail = ordersService.getOrdersDetailOneForTracking(trackingNum);
		
		if(trackingStatus) {
			TrackingInfo trackingInfo = new TrackingInfo();
			trackingInfo.setTrackingNum(trackingNum);
			trackingInfo.setTrackingInfoWhere(trackingInfoWhere);
			ordersService.updateMemberOrdersStatus("배송완료" , trackingNum);
			trackingService.insertTrackingInfo(trackingInfo);
		} else {
			TrackingInfo trackingInfo = new TrackingInfo();
			trackingInfo.setTrackingNum(trackingNum);
			trackingInfo.setTrackingInfoWhere(trackingInfoWhere);
			trackingService.insertTrackingInfo(trackingInfo);
		}
		
		List<TrackingInfo> trackingInfoList = trackingService.getTrackingInfoList(trackingNum);

		
		
		
		
		
		return trackingInfoList.get(trackingInfoList.size()-1);
	}
	
	
	
	
	
	
	
	
}