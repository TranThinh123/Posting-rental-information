<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="<c:url value='/resources/assets/images/Logo-icon.png'/>">
<title>Thống kê bài đăng</title>
<link
      href="<c:url value= '/resources/vendor/fontawesome-free/css/all.min.css'/>"
      rel="stylesheet"
      type="text/css"
    /> 
<!-- Google Fonts -->
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap");
    </style>
    <!-- Custom styles for this template-->
    <link href="<c:url value='/resources/css/admin/sb-admin-2.css'/>" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/resources/css/admin/main.css'/>" />

</head>
<body>

	<!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
         <jsp:include page="../Admin/layout/menu.jsp" />

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
          <nav
            class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
          >
            <!-- Sidebar Toggle (Topbar) -->
            <button
              id="sidebarToggleTop"
              class="btn btn-link d-md-none rounded-circle mr-3"
            >
              <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
              <!-- Nav Item - User Information -->
              <li class="nav-item dropdown no-arrow admin_Control">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="userDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                 <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                                     >${user.tenND}</span
                                   >
                                    <div style="width:40px;height:40px;border-radius:50%;overflow:hidden;">
                                    <img style="width: 100%;height: 100%;object-fit:cover" src="${user.linkanhdaidien}"/>
                                    </div>
                </a>
                <!-- Dropdown - User Information -->
                <div
                  class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                  aria-labelledby="userDropdown"
                >
                   <a class="dropdown-item" href="../nguoidung/trangcanhan">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Thông tin
                  </a>
                  <a class="dropdown-item" href="#">
                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                    Đổi mật khẩu
                  </a>
                  <div class="dropdown-divider"></div>
                  <a
                    class="dropdown-item"
                    href="<c:url value='/logout' />"
                    data-toggle="modal"
                    data-target="#logoutModal"
                  >
                    <i
                      class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                    ></i>
                    Đăng xuất
                  </a>
                </div>
              </li>
            </ul>
          </nav>
          <!-- End of Topbar -->

          <!-- Begin Page Content -->
          
            <div class="container-fluid">
            <jsp:useBean id="baivietchuaduyet" scope="request"
                        type="org.springframework.beans.support.PagedListHolder" /> 
                        <c:url value="quanlybaidang.html" var="pagedLink">
                        <c:param name="p" value="~" />
                       </c:url>
            <jsp:useBean id="baivietdaduyet" scope="request"
                        type="org.springframework.beans.support.PagedListHolder" /> 
                        <c:url value="quanlybaidang.html" var="pagedLink1">
                        <c:param name="p1" value="~" />
                       </c:url>
            <h1 class="h3 mb-4 text-gray-800">QUẢN LÝ BÀI ĐĂNG</h1>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Chờ duyệt bài</h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table
                    class="table table-bordered"
                    id="dataTable"
                    width="100%"
                    cellspacing="0"
                  >
                    <thead>
                      <tr>
                        <th>Mã bài đăng</th>
                        <th>Tiêu đề</th>
                        <th>Giá</th>
                        <th>Diện tích</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Xác nhận</th>
                        <th>Xóa</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr>
                        <th>Mã bài đăng</th>
                        <th>Tiêu đề</th>
                        <th>Giá</th>
                        <th>Diện tích</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Xác nhận</th>
                        <th>Xóa</th>
                      </tr>
                    </tfoot>
                    <tbody>
                    	<c:forEach var="bv" items="${baivietchuaduyet.pageList}">
							<tr>
								<td>${bv.mabaiviet}</td>
								<td>${bv.tieude}</td>
								<td>${bv.gia}</td>
								<td>${bv.dientich}</td>
								<td>${bv.tinhtrang}</td>
								<td>${bv.chitietbaiviet.thoigianbatdau}</td>
								
								<td>
									<a name="btnupdate" href="../admin/quanlybaidang/${bv.mabaiviet }.htm?linkEdit">
									<button type="button"  class="btn btn-warning">Duyệt</button></a>
								</td>
								<td>
									<a href="../admin/quanlybaidang/${bv.mabaiviet }.htm?linkDelete">
									<button type="button"  class="btn btn-warning">Xóa</button></a>
								</td>
							</tr>
						</c:forEach>
                    </tbody>
                  </table>
                  <tg:paging pagedListHolder="${baivietchuaduyet}"
                  pagedLink="${pagedLink}" />
                </div>
              </div>
            </div>
            
            <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">
                  Bài đăng hiện tại
                </h6>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table
                    class="table table-bordered"
                    id="post-table"
                    width="100%"
                    cellspacing="0"
                  >
                  <thead>
                      <tr>
                        <th>Mã bài đăng</th>
                        <th>Tiêu đề</th>
                        <th>Giá</th>
                        <th>Diện tích</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr>
                        <th>Mã bài đăng</th>
                        <th>Tiêu đề</th>
                        <th>Giá</th>
                        <th>Diện tích</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                      </tr>
                    </tfoot>
                    <tbody>
                    	<c:forEach var="bv" items="${baivietdaduyet.pageList}">
							<tr>
								<td>${bv.mabaiviet}</td>
								<td>${bv.tieude}</td>
								<td>${bv.gia}</td>
								<td>${bv.dientich}</td>
								<td>${bv.tinhtrang}</td>
								<td>${bv.chitietbaiviet.thoigianbatdau}</td>
							</tr>
						</c:forEach>
                    </tbody>
                  </table>
                  <tg:paging pagedListHolder="${baivietdaduyet}"
                  pagedLink="${pagedLink1}" />
                </div>
              </div>
          </div>
          <!-- /.container-fluid -->
          
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; timtro.com 2023</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
</div>
</body>
</html>