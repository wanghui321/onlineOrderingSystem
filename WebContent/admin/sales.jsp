<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入样式文件和动态控制 -->
		<link href="<%=path %>/css/admin/bootstrap.min.css" rel="stylesheet">
        <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/js/admin/bootstrap.min.js"></script>
      <title>后台管理界面二</title>
</head>
 <body>
        


        <div class="container-fluid">
            <div class="row">
                
                <!--左边菜单栏-->
                <div class="col-sm-10">
                    <ol class="breadcrumb">
                        <li class="active">菜单
                        </li>
                        <li class="active">vip客户信息
                        </li>
                    </ol>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            搜索
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                    <label for="name">名称</label>
                                    <input type="text" class="form-control" id="name" placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">状态</label>
                                    <select class="form-control">
                                        <option>上架</option>
                                        <option>下架</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">开始搜索</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--
                        列表展示
                    -->
                    <div class="table-responsive">
                        <table class="table table-striped ">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>图标</th>
                                    <th>名称</th>
                                    <th>价格</th>
                                    <th>邮费</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>15</td>
                                    <td>
                                        <img src="images/a.jpg" class="img-thumbnail" style="height: 30px;" />
                                    </td>
                                    <td>麦当劳</td>
                                    <td>1800000.00￥</td>
                                    <td>1800000.00￥</td>
                                    <td>上架</td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="" class="btn btn-default">修改</a><a href="" class="btn btn-default">下架</a><a href="" class="btn btn-danger">删除</a>
                                        </div>

                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" style="float: right;">
                        <li><a href="#">«</a>
                        </li>
                        <li class="active"><a href="#">1</a>
                        </li>
                        <li class="disabled"><a href="#">2</a>
                        </li>
                        <li><a href="#">3</a>
                        </li>
                        <li><a href="#">4</a>
                        </li>
                        <li><a href="#">5</a>
                        </li>
                        <li><a href="#">»</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
         
    </body>
</html>