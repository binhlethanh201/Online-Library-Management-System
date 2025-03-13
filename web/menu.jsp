
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.user == null || sessionScope.user.getRoleID()==1}">

    <div class="col-lg-3">
        <div class="hero__categories">
            <div class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span>THỂ LOẠI</span>
            </div>
            <ul>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="home">Tất Cả</a>
                </li>
                <c:forEach items="${listC}" var="c">
                    <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''"}>
                        <a href="home?CateID=${c.getCategoryId()}">${c.getCategoryName()}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</c:if>

<c:if test="${sessionScope.user.getRoleID()==2}">

    <div class="col-lg-3">
        <div class="hero__categories">
            <div class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span>QUẢN LÝ</span>
            </div>
            <ul>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="home">Home</a>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="userexist.jsp">Làm Thẻ</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="checkCardExist.jsp">Tạo Phiếu Mượn</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="borrowManager">Quản Lý Phiếu Mượn</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="logout">Đăng xuất</a>
                </li>
            </ul>
        </div>
        <img style="margin-top: 77px" src="img/LM-WEB.png">
    </div>
</c:if>


<c:if test="${sessionScope.user.getRoleID()==3}">

    <div class="col-lg-3">
        <div class="hero__categories">
            <div class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span>QUẢN LÝ</span>
            </div>
            <ul>

                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="listUser">Quản Lý Người Dùng</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="bookList">Quản Lý Sách</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="borrowManager">Quản Lý Phiếu Mượn</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="optionStatic.jsp">Thống Kê</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="option">Khác</a>
                </li>
                <li onmouseover="this.style.backgroundColor = '#7fad39'" onmouseout="this.style.backgroundColor = ''">
                    <a href="logout">Đăng xuất</a>
                </li>
            </ul>
        </div>
    </div>
</c:if>

