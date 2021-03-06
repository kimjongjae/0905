package org.smartweb.day6.controller;

import org.smartweb.day6.domain.BoardVO;
import org.smartweb.day6.domain.Criteria;
import org.smartweb.day6.domain.PageDTO;
import org.smartweb.day6.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		model.addAttribute("list", service.getList(cri));
		
		int total=service.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	  @PostMapping("/register") public String register(BoardVO board,
	  RedirectAttributes rttr) { service.register(board);
	  rttr.addFlashAttribute("result", board.getBno()); return
	  "redirect:/board/list"; }
	 
	
	
	  @GetMapping("/register") 
		  public void register() {
			  
		  }
	 
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno")Long bno, Model model, @ModelAttribute("cri")Criteria cri) {
		
		model.addAttribute("board", service.get(bno));
	}
	
//	@GetMapping("/modify")
//	public void modify() {
//		
//	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr,  @ModelAttribute("cri")Criteria cri) {
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addFlashAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")Long bno, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addFlashAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";	
	}
}
