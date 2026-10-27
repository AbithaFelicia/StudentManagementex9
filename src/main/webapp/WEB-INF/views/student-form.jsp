
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle}</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f2f5f9;
    margin: 0;
    padding: 40px;
}

.container {
    width: 400px;
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

label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    box-sizing: border-box;
}

button {
    width: 100%;
    margin-top: 22px;
    padding: 12px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.back {
    display: block;
    text-align: center;
    margin-top: 15px;
}
</style>
</head>

<body>
<div class="container">

    <h2>${pageTitle}</h2>

    <form action="${pageContext.request.contextPath}/save"
          method="post">

        <label>Registration Number:</label>
        <input type="number"
               name="regno"
               value="${student.regno}"
               required
               min="1"
               step="1"
               ${student.regno != null ? 'readonly' : ''}>

        <label>Student Name:</label>
        <input type="text"
               name="name"
               value="${student.name}"
               required>

        <label>CGPA:</label>
        <input type="number"
               name="cgpa"
               value="${student.cgpa}"
               min="0"
               max="10"
               step="0.01"
               required>

        <button type="submit">Save Student</button>

    </form>

    <a class="back" href="${pageContext.request.contextPath}/">
        Back to Student List
    </a>

</div>
</body>
</html>
