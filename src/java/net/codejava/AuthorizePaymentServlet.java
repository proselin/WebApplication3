/**
 * AuthorizePaymentServlet class - requests PayPal for payment.
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package net.codejava;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.base.rest.PayPalRESTException;

@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthorizePaymentServlet() {
	}

        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String product = request.getParameter("product");
		String subtotal = request.getParameter("subtotal");
		String shipping = request.getParameter("shipping");
		String tax = request.getParameter("tax");
		String total = request.getParameter("total");
		
		OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);

                PaymentServices paymentServices = new PaymentServices();
                String approvalLink = paymentServices.authorizePayment(orderDetail);
                response.sendRedirect(approvalLink);
	}

}
