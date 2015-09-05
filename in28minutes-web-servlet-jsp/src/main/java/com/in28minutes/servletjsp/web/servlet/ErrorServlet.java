package com.in28minutes.servletjsp.web.servlet;

import static com.in28minutes.servletjsp.web.util.Views.ERROR_PAGE;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ErrorServlet")
public class ErrorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processError(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processError(request, response);
	}

	private void processError(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// customize error message
		Throwable throwable = (Throwable) request
				.getAttribute("javax.servlet.error.exception");

		String servletName = (String) request
				.getAttribute("javax.servlet.error.servlet_name");

		request.setAttribute(
				"error",
				"Servlet " + servletName + " has thrown an exception "
						+ throwable.getClass().getName() + " : "
						+ throwable.getMessage() + ":"
						+ Arrays.toString(throwable.getStackTrace()));

		request.getRequestDispatcher(ERROR_PAGE).forward(request, response);
	}
}