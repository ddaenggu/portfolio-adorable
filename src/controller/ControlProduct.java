package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelProduct;

@WebServlet("*.prod")
public class ControlProduct extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		ModelProduct mp = new ModelProduct();

		if (command.equals("/selectallwear.prod")) { // wear 게시판 상품 전체 출력 조건문

			ProductWearSelect pws = ProductWearSelect.instance();
			try {
				String view = pws.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectallwearorderbyname.prod")) { // wear 게시판 이름순으로 상품 전체 출력 조건문

			ProductWearOrderByNameSelect pwobns = ProductWearOrderByNameSelect.instance();
			try {
				String view = pwobns.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectallwearorderbypricedesc.prod")) { // wear 게시판 높은 가격순으로 상품 전체 출력 조건문

			ProductWearOrderByPriceDescSelect pwobpds = ProductWearOrderByPriceDescSelect.instance();
			try {
				String view = pwobpds.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectallwearorderbyprice.prod")) { // wear 게시판 낮은 가격순으로 상품 전체 출력 조건문

			ProductWearOrderByPriceSelect pwobps = ProductWearOrderByPriceSelect.instance();
			try {
				String view = pwobps.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectouter.prod")) { // wear의 outer 게시판 상품 전체 출력 조건문

			ProductOuterSelect pos = ProductOuterSelect.instance();
			try {
				String view = pos.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectouterorderbyname.prod")) { // outer 게시판 이름순으로 출력

			ProductOuterOrderByNameSelect poobns = ProductOuterOrderByNameSelect.instance();
			try {
				String view = poobns.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectouterorderbypricedesc.prod")) { // outer 게시판 높은가격순으로 출력

			ProductOuterOrderByPriceDescSelect poobpds = ProductOuterOrderByPriceDescSelect.instance();
			try {
				String view = poobpds.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectouterorderbyprice.prod")) { // outer 게시판 낮은가격순으로 출력

			ProductOuterOrderByPriceSelect poobps = ProductOuterOrderByPriceSelect.instance();
			try {
				String view = poobps.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selecttop.prod")) { // wear의 top 게시판 상품 전체 출력 조건문

			ProductTopSelect pts = ProductTopSelect.instance();
			try {
				String view = pts.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selecttoporderbyname.prod")) { // wear의 top 게시판 이름순 상품 전체 출력 조건문

			ProductTopOrderByNameSelect ptobns = ProductTopOrderByNameSelect.instance();
			try {
				String view = ptobns.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selecttoporderbypricedesc.prod")) { // wear의 top 게시판 높은가격순 상품 전체 출력 조건문

			ProductTopOrderByPriceDescSelect ptobpds = ProductTopOrderByPriceDescSelect.instance();
			try {
				String view = ptobpds.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selecttoporderbyprice.prod")) { // wear의 top 게시판 낮은가격순 상품 전체 출력 조건문

			ProductTopOrderByPriceSelect ptobps = ProductTopOrderByPriceSelect.instance();
			try {
				String view = ptobps.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectdress.prod")) { // wear의 dress 게시판 상품 전체 출력 조건문

			ProductDressSelect pds = ProductDressSelect.instance();
			try {
				String view = pds.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectdressorderbyname.prod")) { // wear의 dress 이름순으로 정렬

			ProductDressOrderByNameSelect pdobns = ProductDressOrderByNameSelect.instance();
			try {
				String view = pdobns.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectdressorderbypricedesc.prod")) { // wear의 dress 높은가격순으로 정렬

			ProductDressOrderByPriceDescSelect pdobpds = ProductDressOrderByPriceDescSelect.instance();
			try {
				String view = pdobpds.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectdressorderbyprice.prod")) { // wear의 dress 낮은가격순으로 정렬

			ProductDressOrderByPriceSelect pdobps = ProductDressOrderByPriceSelect.instance();
			try {
				String view = pdobps.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectacc.prod")) { // wear의 accessory 게시판 상품 전체 출력 조건문

			ProductAccSelect pas = ProductAccSelect.instance();
			try {
				String view = pas.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectaccorderbyname.prod")) { // wear의 accessory 게시판 이름순으로 정렬

			ProductAccOrderByNameSelect paobns = ProductAccOrderByNameSelect.instance();
			try {
				String view = paobns.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectaccorderbypricedesc.prod")) { // wear의 accessory 게시판 높은가격순으로 정렬

			ProductAccOrderByPriceDescSelect paobpds = ProductAccOrderByPriceDescSelect.instance();
			try {
				String view = paobpds.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectaccorderbyprice.prod")) { // wear의 accessory 게시판 낮은가격순으로 정렬

			ProductAccOrderByPriceSelect paobps = ProductAccOrderByPriceSelect.instance();
			try {
				String view = paobps.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/insertcart.prod")) { // 제품 select해서 cart에 insert하는 조건문

			CartInsert ci = CartInsert.instance();
			try {
				String view = ci.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectcart.prod")) { // cart목록 전체 select하는 조건문

			CartSelect sc = CartSelect.instance();
			try {
				String view = sc.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/updatecartquantity.prod")) { // cart 수량 update하는 조건문

			CartQuantityUpdate cqu = CartQuantityUpdate.instance();
			try {
				String view = cqu.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/deletecart.prod")) { // cart 삭제

			CartDelete cd = CartDelete.instance();
			try {
				String view = cd.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectoneproduct.prod")) { // 주문하기위해서 제품 하나 선택하는 것

			OneProductSelect ops = OneProductSelect.instance();
			try {
				String view = ops.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/insertorder.prod")) { // order insert

			OrderInsert oi = OrderInsert.instance();
			try {
				String view = oi.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectmyorder.prod")) { // 내가 주문한 목록들 select

			MyOrderSelect mos = MyOrderSelect.instance();
			try {
				String view = mos.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectallproduct.prod")) { // cart에서 주문할때 제품 전체 다 들고오는 조건문

			AllProductSelect aps = AllProductSelect.instance();
			try {
				String view = aps.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/insertallproduct.prod")) { // 여러개의 상품들 한꺼번에 insert 주문

			AllOrderInsert aoi = AllOrderInsert.instance();
			try {
				String view = aoi.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectrecommend.prod")) { // recommend게시판 출력 조건문

			RecommendSelect rs = RecommendSelect.instance();
			try {
				String view = rs.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectrecommendorderbyname.prod")) { // recommend게시판 이름순으로 출력 조건문

			RecommendSelectOrderByName rsobn = RecommendSelectOrderByName.instance();
			try {
				String view = rsobn.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectrecommendorderbypricedesc.prod")) { // recommend게시판 높은가격순 출력 조건문

			RecommendSelectOrderByPriceDesc rsobpd = RecommendSelectOrderByPriceDesc.instance();
			try {
				String view = rsobpd.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (command.equals("/selectrecommendorderbyprice.prod")) { // recommend게시판 낮은가격순 출력 조건문

			RecommendSelectOrderByPrice rsobp = RecommendSelectOrderByPrice.instance();
			try {
				String view = rsobp.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
		else if (command.equals("/selectalltoy.prod")) { // toy 전체제품 신상품순으로 select
			
			ProductToySelect pts = ProductToySelect.instance();
			try {
				String view = pts.productData(request, response);
				request.getRequestDispatcher(view).forward(request, response);
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		
	}

}
