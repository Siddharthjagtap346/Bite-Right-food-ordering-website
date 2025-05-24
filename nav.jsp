<%@ page session="true" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">BiteRight</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <%
          String username = (String) session.getAttribute("username");
          if (username != null) {
        %>
          <li class="nav-item"><a class="nav-link" href="menu.jsp">Menu</a></li>
          <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
          <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
          <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
        <% } else { %>
          <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>
