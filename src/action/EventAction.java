package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.EventService;
import vo.ActionForward;
import vo.EventDTO;

public class EventAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		EventDTO coupon = null;

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		EventDTO eventdto = new EventDTO();

		eventdto.setId(id);

		EventService eventService = new EventService();

		boolean result = eventService.selectEvent(eventdto);

		if (result) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('오늘은 이미 이벤트에 참여하셨습니다. 내일 다시 참여해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else {
			coupon = eventService.selectCoupon();
			eventdto.setCoupon_num(coupon.getCoupon_num());
			eventdto.setCoupon_sum(coupon.getCoupon_sum());
			eventdto.setPoint(coupon.getCoupon_sum());
			request.setAttribute("coupon", coupon);

			boolean insertSuccess = eventService.insertEvent(eventdto);

			if (!insertSuccess) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('��������');");
				out.println("history.back()");
				out.println("</script>");
			} else {

				boolean updateSuccess = eventService.updatePoint(eventdto);

				if (!updateSuccess) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('��������');");
					out.println("history.back()");
					out.println("</script>");
				}
				else {
					forward = new ActionForward();
					forward.setPath("eventcomplete.jsp");
				}

			}
		}
		
		
		return forward;
	}

}
