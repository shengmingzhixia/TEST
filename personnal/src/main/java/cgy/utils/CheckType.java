package cgy.utils;

import cgy.model.Employee;

import javax.servlet.http.HttpServletRequest;

public class CheckType {
    public static boolean getType(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null || employee.getE_id() == null) {
            request.setAttribute("message", "身份不符，请登录！");
            return false;
        } else {
            return true;
        }
    }
}
