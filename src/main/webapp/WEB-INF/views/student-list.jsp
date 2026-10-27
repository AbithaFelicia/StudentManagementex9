
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f2f5f9;
    margin: 0;
    padding: 30px;
}

.container {
    max-width: 1000px;
    margin: auto;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 2px 10px #cccccc;
}

h2 {
    text-align: center;
    color: #243b55;
}

.message {
    color: green;
    text-align: center;
    margin: 15px;
}

.actions {
    display: flex;
    justify-content: space-between;
    gap: 10px;
    flex-wrap: wrap;
    margin: 20px 0;
}

input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button, .add, .edit, .delete {
    display: inline-block;
    padding: 9px 13px;
    border: none;
    border-radius: 4px;
    color: white;
    text-decoration: none;
    cursor: pointer;
}

button, .add {
    background: #2563eb;
}

.edit {
    background: #15803d;
}

.delete {
    background: #dc2626;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background: #243b55;
    color: white;
}

tr:nth-child(even) {
    background: #f5f7fa;
}

.empty {
    text-align: center;
    padding: 20px;
}
</style>
</head>

<body>
<div class="container">

    <h2>Student Management System</h2>

    <c:if test="${not empty message}">
        <p class="message">${message}</p>
    </c:if>

    <c:if test="${not empty searchMessage}">
        <p class="message">${searchMessage}</p>
    </c:if>

    <div class="actions">

        <a class="add"
           href="${pageContext.request.contextPath}/add">
           + Add Student
        </a>

        <form action="${pageContext.request.contextPath}/search"
              method="get">
            <input type="number"
                   name="regno"
                   placeholder="Enter registration number"
                   min="1"
                   required>
            <button type="submit">Search</button>
        </form>

        <a href="${pageContext.request.contextPath}/"
           class="add">
           Show All
        </a>

    </div>

    <table>
        <thead>
            <tr>
                <th>Registration Number</th>
                <th>Student Name</th>
                <th>CGPA</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:choose>
                <c:when test="${not empty students}">
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td><c:out value="${student.regno}"/></td>
                            <td><c:out value="${student.name}"/></td>
                            <td><c:out value="${student.cgpa}"/></td>
                            <td>
                                <a class="edit"
                                   href="${pageContext.request.contextPath}/edit/${student.regno}">
                                   Edit
                                </a>

                                <a class="delete"
                                   href="${pageContext.request.contextPath}/delete/${student.regno}"
                                   onclick="return confirm('Are you sure you want to delete this student?');">
                                   Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <tr>
                        <td colspan="4" class="empty">
                            No student records found.
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</div>
</body>
</html>
