<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工查询</title>
<% pageContext.setAttribute("contextPath",request.getContextPath());  %>
<script type="text/javascript" src="${contextPath }/static/jquery-js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" >
<script src="${contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
</head>
<body>
	<!-- 员工添加模态框 -->
	<div class="modal fade" id="input_emp_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label   class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="empName" id="input_empName"
									placeholder="empName">
								<span class="help-block"></span>	
							</div>
						</div>
						<div class="form-group">
							<label   class="col-sm-2 control-label">age</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="age" id="input_age" 
									placeholder="age">
							</div>
						</div>
						<div class="form-group">
							<label   class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
									<input type="radio" name="gender" id="input_gender1" value="m"
									 checked="checked"> 男
								</label> 
								<label class="radio-inline"> 
									<input type="radio" name="gender" id="input_gender2" value="f"> 女
								</label>
							</div>	
						</div>

						<div class="form-group">
							<label   class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input class="form-control" type="email" name="email" id="input_email"
									placeholder="email@163.com">
								<span class="help-block"></span>	
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">workdate</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="workdate" id="input_workdate"
									placeholder="2017/1/1">
								<span class="help-block"></span>	
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">department</label>
							<div class="col-sm-4">
								<select class="form-control" id="input_department" name="deptid">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="save_emp_button" >保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 员工修改模态框 -->
	<div class="modal fade" id="update_emp_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label   class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="update_empName"></p>
							</div>
						</div>
						<div class="form-group">
							<label   class="col-sm-2 control-label">age</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="age" id="update_age" 
									placeholder="age">
							</div>
						</div>
						<div class="form-group">
							<label   class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> 
									<input type="radio" name="gender" id="update_gender1" value="m"
									 checked="checked"> 男
								</label> 
								<label class="radio-inline"> 
									<input type="radio" name="gender" id="update_gender2" value="f"> 女
								</label>
							</div>	
						</div>

						<div class="form-group">
							<label   class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input class="form-control" type="email" name="email" id="update_email"
									placeholder="email@163.com">
								<span class="help-block"></span>	
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">workdate</label>
							<div class="col-sm-10">
								<input class="form-control" type="text" name="workdate" id="update_workdate"
									placeholder="2017/1/1">
								<span class="help-block"></span>	
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">department</label>
							<div class="col-sm-4">
								<select class="form-control" id="update_department" name="deptid" >
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="update_emp_button" >更新</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--确认框 -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			  <p>&nbsp;</p>
			  <h4 class="col-md-offset-1">员工删除：</h4>
			  <h5 class="lead col-md-offset-1" id="confirm_message"></h5>
			  <button type="button" class="btn btn-default col-md-offset-9" data-dismiss="modal">取消</button>
			  <button type="button" class="btn btn-primary " id="confirm_delete_btn">确认</button>
			  <p>&nbsp;</p>
			</div>
		</div>
	</div> 
	<!-- 搭建显示界面 -->
	<div class="container">
		<!-- 显示标题栏 -->
		<div class="row">
			<div class="col-md-12">
				<h1>EMP-CRUD</h1>
			</div>
		</div>
		
		<!-- 新增和删除按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn  btn-primary" id="input_emp_button">新增</button>
				<button type="button" class="btn btn-danger" id="delete_emp_button">删除</button>
			</div>
		</div>
		
		<!-- 表格显示员工列表 -->
		<table class="table table-hover">
			<!-- 首行员工信息标题列 -->
			<thead>
				<tr>
					<th><input type="checkbox" id="emp_check_all"/></th>
					<th>#</th>
					<th>empName</th>
					<th>age</th>
					<th>gender</th>
					<th>email</th>
					<th>workdate</th>
					<th>department</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="emps_tbody"></tbody>
			
		</table>
		
		<!-- 显示分页信息 （分页文字信息和分页条）-->
		<div class="row">
			<div class="col-md-6" id="pageInfo_text"></div>
			
			<nav aria-label="Page navigation" id="pageInfo_nav"></nav>
		</div>
	</div>
	
	<script type="text/javascript">
		// 用于保存跳转页码
		var pages ;
		var currentPage;
		/*  发送ajax 请求分页显示员工信息  */
		$(function() {
			to_page(1);
		})
		
		/* 发送ajax 请求转动指定页码 */
		function to_page(pn){
			$.ajax({
				url:"${contextPath}/emps",
				type:"GET",
				data:"pn="+pn,
				success:function(result){
					// 解析并显示员工数据
					parse_emps_table(result);
					// 显示分页数据 （分页文字信息和分页条）
					parse_pageInfo_text(result);
					parse_pageInfo_nav(result);
				}
			});
		}
		
		// 解析并显示员工数据
		function parse_emps_table(result){
			// 清除留存数据---------------------------------------------------------------------------
			// ------------ 注意：动态数据变化要放在 ajax 请求中（专门处理页面动态变化），否则会有残影
			$("#emps_tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps,function(index,emp){
				var checkTh = $("<th></th>").append("<input type='checkbox' class='emp_checkbox'/>");
				var empIdTh = $("<th></th>").append(emp.empId);
				var empNameTh = $("<th></th>").append(emp.empName);
				var ageTh = $("<th></th>").append(emp.age);
				var genderTh = $("<th></th>").append(emp.gender == "m" ? "男":"女");
				var emailTh = $("<th></th>").append(emp.email);
				//注意：数据库获得的时间为 Date 型，ajax请求成功后返回的却是 Number 型时间戳，需要 
				//---- 先通过 new Date(时间戳) 转化为 javaScript Date对象，再调用 Date 的各种本地化方法进行页面显示----
				var date = new Date(emp.workdate);
				var workdateTh = $("<th></th>").append(date.toLocaleDateString());
				var deptIdTh = $("<th></th>").append(emp.department.deptName);
				/* 为编辑按钮添加一个自定义的属性来表示当前员工的 id 值
				（获取当前员工 id 的另一种方式：$(this).parents("tr").find("th:eq(0)").text() */
				var editButtonTh = $("<button type='button' class='btn  btn-primary btn-sm btn-edit'></button>")
									.append("<span class='glyphicon glyphicon glyphicon-pencil'></span>")
									.append(" 编辑");
				var deleteButtonTh = $("<button type='button' class='btn  btn-danger btn-sm btn-delete'></button>")
									.append("<span class='glyphicon glyphicon glyphicon-pencil'></span>")
									.append(" 删除");
				$("<tr></tr>").append(checkTh)
								.append(empIdTh)
								.append(empNameTh)
								.append(ageTh)
								.append(genderTh)
								.append(emailTh)
								.append(workdateTh)
								.append(deptIdTh)
								.append($("<th></th>").append(editButtonTh).append("&nbsp;").append(deleteButtonTh))
								.appendTo($("#emps_tbody"));
				
				
			});
		}
		
		// 显示分页文字信息
		function parse_pageInfo_text(result){
			$("#pageInfo_text").empty();
			var pageInfo = result.extend.pageInfo;
			$("#pageInfo_text").append("当前第" + pageInfo.pageNum + "页")
			.append("，共" + pageInfo.pages + "页")
			.append("，共" + pageInfo.total + "条记录");
			pages = pageInfo.pages;
			currentPage = pageInfo.pageNum;
		}
		
		// 显示分页条
		function parse_pageInfo_nav(result){
			$("#pageInfo_nav").empty();
			var pageInfo = result.extend.pageInfo;
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
			var prePage = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")));
			var nextPage = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")));
			var lastPage = $("<li></li>").append($("<a></a>").append("尾页"));
			
			// 标签禁用判断
			if(!pageInfo.hasPreviousPage){
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			}
			if(!pageInfo.hasNextPage){
				nextPage.addClass("disabled");
				lastPage.addClass("disabled");
			}
			// 添加单击响应事件
			firstPage.click(function(){
				to_page(1);
				
			});
			prePage.click(function(){
				to_page(pageInfo.pageNum-1);
			});
			nextPage.click(function(){
				to_page(pageInfo.pageNum+1);
			});
			lastPage.click(function(){
				to_page(pageInfo.pages);
			});
			
			// 添加首页和前一页提示
			ul.append(firstPage).append(prePage);
			
			// 添加连续显示的页码
			$.each(pageInfo.navigatepageNums,function(index,navigatepageNum){
				var numLi = $("<li></li>").append($("<a></a>").append(navigatepageNum));
				if(pageInfo.pageNum == navigatepageNum){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(navigatepageNum);
				});
				ul.append(numLi);
			});
			
			// 添加下一页和尾页提示
			ul.append(nextPage).append(lastPage).appendTo("#pageInfo_nav");
		}
		
		/*  员工添加模块 */
		$("#input_emp_button").click(function() {
			
			//1、把表单的所有输入元素重置为它们的默认值.
			$("#input_emp_modal form")[0].reset();
			// 清空表单(所有子标签)样式.
			$("#input_emp_modal form").find("*").removeClass("has-success has-error");
			// 清空表单的提示信息.
			$("#input_emp_modal form").find(".help-block").text("");
			
			//2、发送ajax 请求获取部门信息
			get_Dept_Message("#input_department");
			
			
			//3、 开启模态框
			$("#input_emp_modal").modal({
				backdrop: false
			});
			
			// 添加校验单击响应函数
			$("#input_empName").blur(function(){
				empName_check("#input_empName");
			});
			
			$("#input_email").blur(function(){
				email_check("#input_email");
			});
			$("#input_workdate").blur(function(){
				workdate_check("#input_workdate");
			});
		});
		
		// 发送ajax 请求获取部门信息
		function get_Dept_Message(ele){
			$(ele).empty();
			$.ajax({
				url:"${contextPath}/depts",
				type:"GET",
				success:function(result){
					$.each(result.extend.depts,function(){
						$(ele).append($("<option></option>").attr("value",this.deptId)
								.append(this.deptName));
					})
				}
			});
		};
		
		// 员工保存
		$("#save_emp_button").click(function () {
			// 判断前端所有校验是否通过，如果不通过，则不能发送请求
			if(!email_check("#input_email") || !empName_check("#input_empName") || !workdate_check("#input_workdate"))
				return false;
			// Ajax serialize()：可以序列化表单（form）内容为字符串。
			//alert($("#input_emp_modal form").serialize());
			 $.ajax({
				url:"${contextPath}/emp",
				type:"POST",
				data:$("#input_emp_modal form").serialize(),
				success:function(result){
					if(result.code == 200){
						// 保存时仍需要在后端进行员工名重复性校验(姓名可用时进行其它判断)
						if(result.extend.msg){
							validate($("#input_empName"), "error", msg);
						}
						// 后端校验，防止用户非法通过前端校验
						if(result.extend.fieldErrors.empName != undefined){
							validate($("#input_empName"), "error", result.extend.fieldErrors.empName);
						}
						
						if(result.extend.fieldErrors.email != undefined){
							validate($("#input_email"), "error", result.extend.fieldErrors.email);
						}
					} else{
						// 关闭模态框
						$("#input_emp_modal").modal("hide");
						/* 页面跳转到最后一页
						分页参数合理化：查询的页码大于总页码时，会自动跳转到最后一页 */
						to_page(pages+1);
					}
				}
			});
		});
		
		// 检验员工名是否可用
		function empName_avaliable(empName_input){
			$.ajax({
				url:"${contextPath}/checkUser",
				type:"GET",
				data:"empName="+empName_input,
				success:function(result){
					if(result.code == 100){
						validate("#input_empName","success","");
					} else if (result.code == 200) {
						validate("#input_empName","error",result.extend.msg);
						// ajax 请求里设置的返回值对函数无效
						// return false ======无效
					}
				}
			});
		}
		
		// 数据格式校验函数
		function validate(tag,status,msg){
			// 清除留存的校验显示状态	
			$(tag).parent().removeClass("has-success has-error");
			$(tag).next("span").text("");
			
			// 显示校验状态
			if(status == "success"){
				$(tag).parent().addClass("has-success");
			}else if(status == "error"){
				$(tag).parent().addClass("has-error");
			}
			//显示校验信息
			$(tag).next("span").text(msg);
		}
		
		/* 数据格式前端校验  */
		/* 姓名校验 */
		function empName_check(ele){
			var empName_input = $(ele).val();
			var regex = /(^[\u2E80-\u9FFF]+$) ||(^[a-zA-Z0-9_-]{5,16}$)/;
			if (empName_input == ""){
				validate(ele,"error","员工姓名不能为空");
				return false;
			}
			// 通过正则表达式进行格式校验
			if(regex.test(empName_input)){
				// 员工名可用性校验（保存时仍需进行后端校验）
				empName_avaliable(empName_input);
			}else{
				validate(ele,"error","输入的姓名格式不正确");
				return false;
			}
			return true; // 校验通过返回 true
		}
		
		/* 邮箱校验 */
		function email_check(ele){
			var email_input = $(ele).val();
			var regex =  /^([a-zA-Z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (email_input == ""){
				validate(ele,"error","邮箱不能为空");
				return false;
			}
			// 通过正则表达式进行格式校验
			if(regex.test(email_input)){
				validate(ele,"success","");
			}else{
				validate(ele,"error","输入的邮箱格式不正确");
				return false;
			}
			return true; // 校验通过返回 true
		}
		
		/* 日期格式校验 */
		function workdate_check(ele){
			var workdate_input = $(ele).val();
			var regex =  /^[1-9]\d{3}\/([1-9]|1[0-2])\/([1-9]|[1-2]\d|3[0-1])$/;
			if (workdate_input == ""){
				validate(ele,"error","日期不能为空");
				return false;
			}
			// 通过正则表达式进行格式校验
			if(regex.test(workdate_input)){
				validate(ele,"success","");
			}else{
				validate(ele,"error","输入的日期格式不正确");
				return false;
			}
			return true; // 校验通过返回 true
		}
		
		/*  绑定事件的两种方式：1、创建按钮时绑定事件；2、按钮创建后绑定（推荐）
		使用 on 来绑定编辑响应函数 */
		
		//员工信息编辑
		$(document).on("click",".btn-edit",function(){
			// 清空表单(所有子标签)样式.
			$("#update_emp_modal form").find("*").removeClass("has-success has-error");
			
			// 清空表单的提示信息.
			$("#update_emp_modal form").find(".help-block").text("");
			
			//开启模态框
			$("#update_emp_modal").modal({
				backdrop: false
			});
			
			// 发送ajax 请求获取员工信息
			get_Dept_Message("#update_department");
			var empId = $(this).parents("tr").find("th:eq(1)").text();
			get_Emp_Message(empId);
			// 将empId 存入更新按钮中
			$("#update_emp_button").attr("empId",empId);
			
			// 信息校验
			$("#update_email").blur(function(){
				email_check("#update_email");
			});
			$("#update_workdate").blur(function(){
				workdate_check("#update_workdate");
			});
		});
		
		// 根据id 获取指定员工的信息
		function get_Emp_Message(id){
			$.ajax({
				url:"${contextPath}/emp/"+id,
				type:"GET",
				success:function(result){
					var emp = result.extend.emp;
					$("#update_empName").text(emp.empName);
					$("#update_age").val(emp.age);
					//---------------------------------------.val([]) 设置一个单选或多选框的值(数组)-------------------------------------
					$("#update_emp_modal input[name=gender]").val([emp.gender]);
					$("#update_email").val(emp.email);
					$("#update_workdate").val(new Date(emp.workdate).toLocaleDateString());
					$("#update_department").val([emp.deptid]);
				}
			});
		}
		
		// 更新员工信息
		$("#update_emp_button").click(function(){
			// 判断前端所有校验是否通过，如果不通过，则不能发送请求
			if(!email_check("#update_email") || !workdate_check("#update_workdate")){
				return false;
			}
			
			$.ajax({
				url:"${contextPath}/emp/"+$(this).attr("empId"),
				type:"put",
				data:$("#update_emp_modal form").serialize(),
				success:function(result){
					/* 
					Ajax 发送 PUT 请求的两种方式：
					1、通过 HiddenHttpMethodFilter过滤器，将 POST 请求转化为 PUT/DELETE，
					     注意需要参数“&_method=PUT/DELETE”：
						 type:"POST",
						 data:$("#empUpdateModal form").serialize()+"&_method=PUT", 
					2、 通过 HttpPutFormContentFilter 过滤器直接发送 PUT 请求
					*/
					if(result.code == 100){
						// 关闭模态框
						$("#update_emp_modal").modal("hide");
						to_page(currentPage);
					}	
				}
			});
		});
		
		// 全选全不选
		$(document).on("click","#emp_check_all",function(){
			/* 注意 attr() 获取自定义的属性值，如果强行获取 DOM 原生属性，其值为 undefined
			使用 prop() 修改和读取 DOM 原生属性的值. */
			$(".emp_checkbox").prop("checked",$(this).prop("checked"));
		})
		
		// emp_checkbox 同步全选框
		$(document).on("click",".emp_checkbox",function(){
			// 判断是否所有复选框都被选中(---checked 属性的值为true/false---).
			var flag = $(".emp_checkbox:checked").length == $(".emp_checkbox").length;
			$("#emp_check_all").prop("checked",flag);
		})
		
		
		// 单个删除
		$(document).on("click",".btn-delete",function(){
			$("#confirmModal").find("h5").text("");
			
			// 打开确认框
			$("#confirmModal").modal({
				backdrop: false
			})
			//alert($(this).parents("tr").find("th:eq(1)").text());
			var empId = $(this).parents("tr").find("th:eq(1)").text();
			var empName = $(this).parents("tr").find("th:eq(2)").text();
			// 提示信息
			$("#confirmModal").find("h5").append("确认要删除员工 "+ empName+ " 吗？");
			$("#confirm_delete_btn").click(function(){
				$.ajax({
					url:"${contextPath}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						$("#confirmModal").modal("hide");
						to_page(currentPage);
					}
				})
			});
		})
		
		// 批量删除
		$("#delete_emp_button").click(function(){
			$("#confirmModal").find("h5").text("");
			
			// 开启删除模态框
			$("#confirmModal").modal({
				backdrop: false
			})
			
			// 提示信息
			$("#confirmModal").find("h5").append("确认要删除所有选择员工吗？");
			
			// 将所选员工 id 转化为字符串（例”1-2-3“）
			var empIds = "";
			$.each($(".emp_checkbox:checked"),function(){
				empIds += $(this).parents("tr").find("th:eq(1)").text() + "-";
			});
			
			$("#confirm_delete_btn").click(function(){
				$.ajax({
					url:"${contextPath}/emp/"+empIds,
					type:"DELETE",
					success:function(result){
						$("#confirmModal").modal("hide");
						to_page(currentPage);
					}
				})
			});
		});
	</script>
</body>
</html>