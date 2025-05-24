<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm py-3">
  <div class="container">
    <a class="navbar-brand fw-bold fs-3 text-danger" href="index.jsp">
      <i class="bi bi-shop"></i> BiteRight
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto align-items-lg-center">

        <c:choose>
          <c:when test="${not empty sessionScope.username}">
            <!-- Common authenticated links -->
            <li class="nav-item mx-2"><a class="nav-link fw-semibold" href="menu">Menu</a></li>
            <li class="nav-item mx-2"><a class="nav-link fw-semibold" href="cart">Cart</a></li>
            <li class="nav-item mx-2"><a class="nav-link fw-semibold" href="order">Orders</a></li>
            <li class="nav-item mx-2"><a class="nav-link fw-semibold" href="about.jsp">About Us</a></li>

            <!-- Admin Panel (Only for admin role) -->
            <c:if test="${sessionScope.role == 'admin'}">
              <li class="nav-item mx-2"><a class="nav-link text-warning fw-bold" href="adminDashboard">Admin Panel</a></li>
            </c:if>

            <!-- User Dropdown -->
            <li class="nav-item dropdown mx-2">
              <a class="nav-link dropdown-toggle fw-semibold" href="#" id="navbarDropdown" role="button"
                data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-person-circle me-1"></i> ${sessionScope.username}
              </a>
              <ul class="dropdown-menu dropdown-menu-end shadow-sm" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item text-danger" href="logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
              </ul>
            </li>

          </c:when>

          <c:otherwise>
            <!-- Unauthenticated links -->
            <li class="nav-item mx-2"><a class="nav-link fw-semibold" href="register.jsp">Register</a></li>
            <li class="nav-item mx-2"><a class="nav-link fw-semibold" href="login.jsp">Login</a></li>
          </c:otherwise>
        </c:choose>

      </ul>
    </div>
  </div>
</nav>

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
