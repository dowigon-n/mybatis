package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	//등록 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO board, Model model) throws Exception {
		logger.info("글 등록 화면 ...................");
	}
	
	
	//등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
//	public String registPOST(BoardVO board, Model model) throws Exception {
		logger.info("글 등록 처리.....................");
		logger.info(board.toString());  // 추가
		
		boardService.regist(board);
		
//		model.addAttribute("result", "success");
		
		//return "/board/success";
		
		rttr.addFlashAttribute("msg", "success");    //추가
		return "redirect:/board/listPage";
	}
	
	//목록
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		
		logger.info("리스트 .........................");
		model.addAttribute("list", boardService.listAll());
	}
	
	//상세 조회
//	@RequestMapping(value = "/read", method = RequestMethod.GET)
//	public void read(@RequestParam("bno") int bno, Model model) throws Exception {
//		
//		model.addAttribute(boardService.read(bno));
//		
//	}
//------아래 변경된 코드 작성함	
	
	
	
	//삭제
//	@RequestMapping(value = "/remove", method = RequestMethod.POST)
//	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
//		
//		boardService.remove(bno);
//		
//		rttr.addFlashAttribute("msg", "success");
//		return "redirect:/board/listCri";
//	}
	
	//수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception {
		
		model.addAttribute(boardService.read(bno));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		
		logger.info("게시글 수정 ..........................................");
		
		boardService.modify(board);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/board/listCri";
	}
	
	@RequestMapping(value = "/listCri", method = RequestMethod.GET)
	public void listBll(Criteria cri, Model model) throws Exception {
		
		logger.info("리스트와 Criteria............................");
		
		model.addAttribute("list", boardService.listCriteria(cri));
	}
	
	// 추가된 listPage()는 Criteria cri를 파라미터로 사용하고, Model 객체를 이용해서 발생하는 PageMaker를 저장함.
		// listPage()에서는 크게 목록 데이터를 Model에 저장하는 작업과, PageMaker를 구서해서 Model에 담는 작업이 이루어짐.
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception {
		
		logger.info(cri.toString());
		
		model.addAttribute("list", boardService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		pageMaker.setTotalCount(boardService.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(boardService.read(bno));
	}
	
	
	
	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) throws Exception {
		
		boardService.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listPage";
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(boardService.read(bno));
	}
	
	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		boardService.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/board/listPage";
	}

}
