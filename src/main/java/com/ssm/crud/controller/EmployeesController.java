package com.ssm.crud.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.bean.Employee;
import com.ssm.crud.message.Msg;
import com.ssm.crud.service.EmployesService;

@Controller
public class EmployeesController {

	@Autowired
	private EmployesService employeesService;
	
	/**
	 * 员工查询
	 * @ResponseBody 注解的作用是将controller的方法的返回值转换为指定的格式（如 JSON、XML）。需要导入 jackson 包进行支持
	 * @param pn
	 * @return 注意：PageInfo 不包含操作成功还是失败等状态信息，所以需要设计一个通用的返回 JSON 数据的类
	 */
	@ResponseBody
	@RequestMapping("/emps")
	public Msg getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn){
		// 1、引入 PageHelper 分页查询插件
			// 开启分页功能: 调用 PageHelper.startPage() 方法，传入页码，及每页的大小
		PageHelper.startPage(pn, 5);
		
		List<Employee> emps = employeesService.getEmps();
		
		// 2、使用 PageInfo 包装查询后的结果，然后将其交给页面即可
			// PageInfo 封装了详细的分页信息，包含了查询到的结果数据，传入连续显示的页数
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		
		// 将分页信息加入请求域中
		return Msg.success().add("pageInfo",pageInfo);
	}

	/*@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model ){
		// 开启分页功能
		PageHelper.startPage(pn, 5);
		
		List<Employee> emps = employeesService.getEmps();
		
		PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
		
		// 将分页信息加入请求域中
		model.addAttribute("pageInfo", pageInfo);
		return "list";
	}*/
	
	/**
	 * 员工添加
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public Msg saveEmp(@Valid Employee employee,BindingResult result){
		// 保存员工时检查员工名是否可用
		Msg msg = checkUser(employee.getEmpName());
		if(msg.getCode() == 200){
			return msg;
		}
		
		if(result.hasErrors()){
			// 校验失败，应返回失败，并在模态框中显示错误信息
			List<FieldError> errors = result.getFieldErrors();
			Map<String, Object> errorsMap = new HashMap<>();
			for(FieldError error: errors ){
				// Map: key-错误字段名， value-错误信息
				errorsMap.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("fieldErrors", errorsMap);
		}
		
		employeesService.saveEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/checkUser")
	public Msg checkUser(String empName){
		// 先判断员工名是否合法
		String regex = "(^[\u2E80-\u9FFF]{2,5}$)|(^[a-zA-Z0-9_-]{5,16}$)";
		if(!empName.matches(regex)){
			return Msg.fail().add("msg", "员工姓名必须是 2-5 位中文或者 5-16位英文和数字的组合");
		}
		boolean empNameEnabled = employeesService.checkUser(empName);
		if(empNameEnabled){
			return Msg.success();
		}else{
			return Msg.fail().add("msg", "姓名已占用");
		}
	}
	
	/**
	 * 查询单个员工
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{id}")
	public Msg getEmp(@PathVariable("id") Integer id){
		Employee emp = employeesService.getEmp(id);
		return Msg.success().add("emp", emp);
	}
	
	/**
	 * 员工更新
	 * @param empId，根据主键更新时需要 {empId} 的名称和 bean 的属性名一致，否则获取不到请求信息的主键值
	 * @return
	 * 
	 * Ajax 发送 PUT 请求的两种方式：
	 * 1、通过 HiddenHttpMethodFilter过滤器，将 POST 请求转化为 PUT/DELETE，
	 *	   注意需要参数“&_method=PUT/DELETE”：
	 *		  type:"POST",
	 *		  data:$("#empUpdateModal form").serialize()+"&_method=PUT", 
	 * 2、 通过 HttpPutFormContentFilter 过滤器直接发送 PUT 请求
	 * HttpPutFormContentFilter 的作用：
	 * （由于 Tomcat的原因，如果 Ajax 直接发送 PUT 请求，处理器将接收不到请求体中的数据；）
	 * 将请求体中的数据解析包装为一个 map，request被重新包装，request.getParameter()被重写，处理器可以重新获取到请求数据.
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg updateEmp(Employee employee){
		employeesService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 员工删除（整合单个和批量）
	 * @param empIds：使用 "-" 进行连接的字符串
	 * 批量： empIds="1-2-3"
	 * 单个： empIds="1"
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empIds}",method=RequestMethod.DELETE)
	public Msg deleteEmps(@PathVariable("empIds") String empIds){
		if(empIds.contains("-")){
			// 批量删除
			String[] empIdStrs = empIds.split("-");
			List<BigDecimal> empIdList = new ArrayList<>();
			for(String empId: empIdStrs){  // 组装 id 集合
				empIdList.add(new BigDecimal(empId));
			}
			employeesService.deleteEmps(empIdList);
		}else{
			// 单个删除
			employeesService.deleteEmp(new BigDecimal(empIds));
		}
		return Msg.success();
	}
	
}
