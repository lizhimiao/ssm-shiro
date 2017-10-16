package com.ssm.crud.message;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回 JSON 数据的类
 * @author 92811
 *
 */
public class Msg {
	// 服务器响应请求的状态码(自定义状态码：100-成功，200-失败)
	private int code;
	// 服务器响应请求的状态信息
	private String message;
	// 存放服务器响应信息
	private Map<String, Object> extend  = new HashMap<>();
	
	public static Msg success(){
		Msg msg = new Msg();
		msg.setCode(100);
		msg.setMessage("处理成功！");
		return msg;
	}
	
	public static Msg fail(){
		Msg msg = new Msg();
		msg.setCode(200);
		msg.setMessage("处理失败！");
		return msg;
	}
	
	/**
	 * 添加查询到的数据并返回
	 * @return
	 */
	public Msg add(String key,Object value){
		this.getExtend().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	
}
