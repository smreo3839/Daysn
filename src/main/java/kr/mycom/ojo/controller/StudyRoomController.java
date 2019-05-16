package kr.mycom.ojo.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.mycom.ojo.model.PageMaker;
import kr.mycom.ojo.model.SearchCriteria;
import kr.mycom.ojo.service.RoomService;

@Controller
@RequestMapping("/room/*")
public class StudyRoomController {

	private static final Logger logger = LoggerFactory.getLogger(StudyRoomController.class);

	@Inject
	private RoomService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {// @ModelAttribute
		logger.info(cri.toString());

		// model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));/* 寃뚯떆�뙋 �듅�젙 �닔 留뚰겮 ���젆�듃 */

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		return "list";
	}

	@RequestMapping(value = "/readDetail", method = RequestMethod.GET)
	public String readDetail(@RequestParam("rcode") int rcode, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		
		/*
		 * int bno = request.getParameter("bno"); System.out.println("readPage.bno : " +
		 * rcode); System.out.println("readPage.cri : " + cri);
		 * model.addAttribute(service.read(rcode));
		 */
		System.out.println("readDetail : "+rcode);
		model.addAttribute("Room_infoVo",service.read(rcode));
		System.out.println("readDetail : "+rcode);
		return "RoomReadPage";
	}
	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET) public void
	 * listPage(Model model) throws Exception {// @ModelAttribute
	 * model.addAttribute("RoomList",service.listAll()); }
	 */
}
