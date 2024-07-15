package com.sqlrecord.sqlrecord.orders.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberOrdersEx {
	
	private int memberOrdersExNo;
    private String memberOrdersExType;
    private int memberOrdersExAmount;
    private String memberOrdersExDate;
    private int trackingNum;
    private String memberOrdersExAddress;
    private String memberOrdersExAddress2;
    private String memberOrdersExPostcode;
    private String memberOrdersExStatus;
    private String memberOrdersExReason;
    private MemberOrdersDetail memberOrdersDetailNo;
    
    
}