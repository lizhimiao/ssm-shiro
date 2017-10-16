package com.ssm.bean;

import java.math.BigDecimal;

public class Department {
    private BigDecimal deptId;

    private String deptName;

	public Department() {
		super();
	}

	public Department(BigDecimal deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public BigDecimal getDeptId() {
        return deptId;
    }

    public void setDeptId(BigDecimal deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}