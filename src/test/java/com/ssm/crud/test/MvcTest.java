package com.ssm.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Employee;

/**
 * 使用 spring 模块提供的测试请求功能测试 crud 的正确性
 * 
 * @author 92811
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration // 传入 web 应用的 IOC 容器，表示测试环境使用的ApplicationContext将是WebApplicationContext类型的
@ContextConfiguration(locations = { "classpath:applicationContext.xml" , "classpath:spring-mvc.xml"})
public class MvcTest {

	// 传入 springmvc 的 IOC 容器
	@Autowired
	WebApplicationContext context;
	// 虚拟 mvc 请求，获取到处理结果.
	MockMvc mockMvc;

	@Before // 初始化方法
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@SuppressWarnings("unchecked")
	@Test
	public void testPage() throws Exception{
		
		// 模拟请求拿到返回值（需要为目标方法赋参）
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5"))
				.andReturn();
		
		// 请求成功后请求域中会有 pageInfo
		MockHttpServletRequest request = result.getRequest();
		System.out.println(request.getAttribute("pageInfo"));
		PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
		System.out.println("当前页码：" + pageInfo.getPageNum());
		System.out.println("总页码：" + pageInfo.getPages());
		System.out.println("总记录数：" + pageInfo.getTotal());
		System.out.println("在页面需要连续显示的页码：");
		int[] nums = pageInfo.getNavigatepageNums();
		for(int i = 0; i < nums.length ; i++){
			System.out.print( nums[i] );
		}
		System.out.println();
		
		List<Employee> emps = pageInfo.getList();
		for(Employee e: emps ){
			System.out.println("员工ID：" + e.getEmpId() + "  员工姓名：" + e.getEmpName());
		}
	}
	
}
