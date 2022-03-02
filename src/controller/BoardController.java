package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminNoticeBoardDetailAction;
import action.AdminNoticeBoardListAction;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardSelectMineAction;
import action.BoardSelectSearchAction;
import action.BoardUpdateFormAction;
import action.BoardUpdateProAction;
import action.BoardWriteProAction;
import action.NoticeBoardDeleteProAction;
import action.NoticeBoardDetailAction;
import action.NoticeBoardListAction;
import action.NoticeBoardUpdateFormAction;
import action.NoticeBoardUpdateProAction;
import action.NoticeBoardWriteProAction;
import action.Re_ReplyWriteFormAction;
import action.Re_ReplyWriteProAction;
import action.ReplyDeleteProAction;
import action.ReplyUpdateFormAction;
import action.ReplyUpdateProAction;
import action.ReplyWriteProAction;
import vo.ActionForward;

@WebServlet("*.board")
public class BoardController extends javax.servlet.http.HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;
		
		if (command.equals("/boardWriteForm.board")) { // 글쓰는 곳으로 이동
			forward=new ActionForward();
			forward.setPath("/writetoWithmypet.jsp");
		}
		
		else if (command.equals("/boardListSelect.board")) { // WITH MYPET 글 전체목록 보여줌
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/boardWritePro.board")) { // 글 insert
			action  = new BoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/boardDetailSelect.board")) { // 글 보기
			action = new BoardDetailAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/boardDeletePro.board")) { // 게시글 삭제
			action = new BoardDeleteProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();			
			}
		}
		
		else if (command.equals("/boardUpdateForm.board")) { // 게시글 수정을 위해 글 불러오기
			action = new BoardUpdateFormAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/boardUpdatePro.board")) { // 게시글 수정
			action = new BoardUpdateProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/boardSelectMine.board")) { // 내가 쓴 글만 불러오기
			action = new BoardSelectMineAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/boardSelectSearch.board")) { // 검색기능으로 select
			action = new BoardSelectSearchAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		else if (command.equals("/replyWritePro.board")) { // 댓글 입력
			action = new ReplyWriteProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();	
			}
		}
		
		else if (command.equals("/replyDeletePro.board")) { // 댓글 삭제
			action = new ReplyDeleteProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/replyUpdateForm.board")) { // 댓글 수정을 위해 불러오는 창
			action = new ReplyUpdateFormAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/replyUpdatePro.board")) { // 댓글 수정
			action = new ReplyUpdateProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/re_replyWriteForm.board")) { // 대댓글 입력을 위한 창으로 이동
			action = new Re_ReplyWriteFormAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/re_replyWritePro.board")) { // 대댓글 입력
			action = new Re_ReplyWriteProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/noticeBoardList.board")) { // 공지사항 글 전체 보기
			action = new NoticeBoardListAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else  if (command.equals("/noticeBoardWrite.board")) { // 공지사항 글쓰기
			action = new NoticeBoardWriteProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/noticeBoardSelect.board")) { // 공지사항 글보기
			action = new NoticeBoardDetailAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/noticeBoardUpdateForm.board")) { // 공지사항 수정창으로 이동
			action = new NoticeBoardUpdateFormAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/noticeBoardUpdatePro.board")) { // 공지사항 수정
			action = new NoticeBoardUpdateProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/noticeBoardDeletePro.board")) { // 공지사항 삭제
			action = new NoticeBoardDeleteProAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/adminNoticeBoardList.board")) { // 관리자가 보는 공지사항
			action = new AdminNoticeBoardListAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/adminNoticeBoardSelect.board")) { // 관리자가 글보기
			action = new AdminNoticeBoardDetailAction();
			try {
				forward = action.execute(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	} 
}
