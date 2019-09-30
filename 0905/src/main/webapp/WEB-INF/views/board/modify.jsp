<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
</head>
<body>
	
	 		<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Modify Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <form role="form" action="/board/modify" method="post">
                         	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>"/>
                         	<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>"/>
                         	<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>"/>
                         	<input type="hidden" name="type" value="<c:out value='${cri.type}'/>"/>
                            
                            	<div class="form group">
                            		<label>Bno</label><input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly="readonly"/>
                            	</div>
                            	
                            	<div class="form group">
                            		<label>Title</label><input class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly="readonly"/>
                            	</div>
                            	
                            	<br>
                            	
                            	<div class="form-group">
                            		<label>Text area</label>
                            		<textarea class="form-control" rows="3" cols="20" name="content" ><c:out value="${board.content}"/></textarea>
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>Writer</label><input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly="readonly"/>
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>RegDate</label><input class="form-control" name="regDate" value='<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd"/>' readonly="readonly"/>
                            	</div>
                            	
                            	<div class="form-group">
                            		<label>Update Date</label><input class="form-control" name="updateDate" value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy/MM/dd"/>' readonly="readonly"/>
                            	</div>
                            	
                            	<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
                            	<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
                            	<!-- <button data-oper="list" class="btn btn-info" onclick="location.href='/board/list'">List</button> -->
                            	<button type="submit" data-oper="list" class="btn btn-info">List</button>
                            </form>                           
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           
           <script type="text/javascript">
           		$(document).ready(function(){
           			var formObj=$("form");
           			$("button").on("click", function(e){
           				e.preventDefault();
           				var operation=$(this).data("oper");
           				
           				if(operation==="remove"){
           					formObj.attr("action", "/board/remove");
           				}else if(operation==="list"){
           					self.location="/board/list";
           					return
           					formObj.attr("action", "/board/list").attr("method", "get");
           					var pageNumTag=$("input[name='pageNum']").clone();
           					var amountTag=$("input[name='amount']").clone();
           					var keywordTag=$("input[name='keyword']").clone();
           					var typeTag=$("input[name='type']").clone();
           					
           					formObj.empty();
           					formObj.append(pageNumTag);
           					formObj.append(amountTag);
           					formObj.append(keywordTag);
           					formObj.append(typeTag);
           				}
           				formObj.submit();
           			});
           		});
           </script>
           
       <%@include file="../includes/footer.jsp" %>
	
	
</body>
</html>