package com.bit2015.what.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit2015.what.dao.MemberDao;
import com.bit2015.what.service.AdminService;
import com.bit2015.what.vo.CommentsVo;
import com.bit2015.what.vo.ContentBoxVo;
import com.bit2015.what.vo.ContentVo;
import com.bit2015.what.vo.EventVo;
import com.bit2015.what.vo.FollowVo;
import com.bit2015.what.vo.GoodContentVo;
import com.bit2015.what.vo.GoodPlanVo;
import com.bit2015.what.vo.MemberVo;
import com.bit2015.what.vo.PlanCommentsVo;
import com.bit2015.what.vo.PlanImgVo;
import com.bit2015.what.vo.PlanVo;
import com.bit2015.what.vo.SearchListVo;
import com.bit2015.what.vo.ThemeBoxVo;
import com.bit2015.what.vo.ThemeVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping()
	public String index() {
		return "/admin/index";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, @ModelAttribute MemberVo memberVo) {
		MemberVo vo = adminService.login(memberVo);
	    System.out.println("rkekekfk"+vo.getMemberGrade());
		if(vo == null || !vo.getMemberGrade().equals("Admin")){	//로긴실패
			System.out.println("아무것도 아니야");
			return "redirect:/admin/index";
		}else{
		    System.out.println("니가 어드민이냐 ");
			//로긴처리
			
		session.setAttribute("authUser", vo);
		return "redirect:/admin/member";
	}
	}

	// member조회
	@RequestMapping("/member12")
	public String memberList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		model.addAttribute("memberList", memberList);
		return "/admin/member";
	}
	
	
	@RequestMapping("/member")
	public String memberList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<MemberVo> memberList = adminService.selectMember();
	 	int listcount = memberList.size();
	 	System.out.println("listcount"+listcount);
	 	System.out.println("페이지"+page);
	 	System.out.println("리밋"+limit);
        List<MemberVo> list=adminService.selectMember1(page, limit); 
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("memberList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/member";
}


	// member등록
	@RequestMapping("/insertmember")
	public String insertMember(MemberVo memberVo,
			@RequestParam(required = false) MultipartFile img) {
		adminService.insertMember(memberVo, img);
		return "redirect:/admin/member";
	}

	// member 삭제
	@RequestMapping("/deletemember")
	public String deleteMember(@RequestParam Long member_no) {
		adminService.deleteMember(member_no);
		return "redirect:/admin/member";
	}

	// plan 조회

	@RequestMapping("/plan1")
	public String planList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();
		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		return "/admin/plan";
	}
	
@RequestMapping("/plan")
	
	public String planList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();
		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		
	 	int listcount = planList.size();
        List<PlanVo> list=adminService.selectplan1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("planList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/plan";
}

	// plan 등록
	@RequestMapping("/insertplan")
	public String insertPlan(PlanVo planVo,
			@RequestParam(required = false) MultipartFile img) {

		adminService.insertPlan(planVo, img);

		return "redirect:/admin/plan";
	}

	// plan 삭제
	@RequestMapping("/deleteplan")
	public String deletePlan(@RequestParam Long plan_no) {
		adminService.deletePlan(plan_no);
		return "redirect:/admin/plan";

	}

	@RequestMapping("/getMemberName")
	@ResponseBody
	public MemberVo getMemberName(
			@RequestParam(required = false) Long member_no,
			@RequestParam(required = false) Long followNum) {
		if (member_no == null) {
			MemberVo memberVo = adminService.getMemberName(followNum);
			return memberVo;
		} else {
			MemberVo memberVo = adminService.getMemberName(member_no);
			return memberVo;
		}
	}

	@RequestMapping("/theme1")
	public String themeList(Model model) {
		List<ThemeVo> themeList = adminService.selectTheme();
		model.addAttribute("themeList", themeList);
		return "/admin/theme";
	}
	
	@RequestMapping("/theme")
	public String  themeList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	
	 	List<ThemeVo> themeList = adminService.selectTheme();
		model.addAttribute("themeList", themeList);

	 	
	 	int listcount = themeList.size();
        List<ThemeVo> list=adminService.selectTheme1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("themeList", list);
        model.addAttribute("listcount", listcount);
    	
	  	return "/admin/theme";
}

	@RequestMapping("/inserttheme")
	public String insertTheme(ThemeVo themeVo,
			@RequestParam(required = false) MultipartFile img) {
		adminService.insertTheme(themeVo, img);
		return "redirect:/admin/theme";
	}

	@RequestMapping("/deletetheme")
	public String deleteTheme(@RequestParam Long theme_no) {
		adminService.deleteTheme(theme_no);
		return "redirect:/admin/theme";
	}

	@RequestMapping("/themebox1")
	public String themeBoxList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<ThemeVo> themeList = adminService.selectTheme();
		List<ThemeBoxVo> themeBoxList = adminService.selectThemeBox();
		model.addAttribute("memberList", memberList);
		model.addAttribute("themeList", themeList);
		model.addAttribute("themeBoxList", themeBoxList);
		return "/admin/themebox";
	}
	
	@RequestMapping("/themebox")
	public String  themeBoxList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	
	 	List<MemberVo> memberList = adminService.selectMember();
		List<ThemeVo> themeList = adminService.selectTheme();
		List<ThemeBoxVo> themeBoxList = adminService.selectThemeBox();
		model.addAttribute("memberList", memberList);
		model.addAttribute("themeList", themeList);
		model.addAttribute("themeBoxList", themeBoxList);

	 	
	 	int listcount = themeBoxList.size();
        List<ThemeBoxVo> list=adminService.selectThemeBox1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("themeBoxList", list);
        model.addAttribute("listcount", listcount);
    	
	  	return "/admin/themebox";
}

	@RequestMapping("insertthemebox")
	public String insertThemeBox(ThemeBoxVo themeBoxVo) {
		adminService.insertThemeBox(themeBoxVo);
		return "redirect:/admin/themebox";
	}

	@RequestMapping("deletethemebox")
	public String deleteThemeBox(@RequestParam Long themeBox_no) {
		adminService.deleteThemeBox(themeBox_no);
		return "redirect:/admin/themebox";
	}

	@RequestMapping("/content1")
	public String contentList(Model model) {
		List<ContentVo> contentList = adminService.selectContent();
		model.addAttribute("contentList", contentList);
		return "/admin/content";
	}
	
	@RequestMapping("/content")
	public String  contentList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	
		List<ContentVo> contentList = adminService.selectContent();

		model.addAttribute("contentList", contentList);

	 	
	 	int listcount = contentList.size();
        List<ContentVo> list=adminService.selectContent1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("contentList", list);
        model.addAttribute("listcount", listcount);
    	
	  	return "/admin/content";
}
	
	
	
	@RequestMapping("/insertcontent")
	public String insertContent(ContentVo contentVo,
			@RequestParam(required = false) MultipartFile img) {
		adminService.insertContent(contentVo, img);
		;
		return "redirect:/admin/content";
	}

	@RequestMapping("/deletecontent")
	public String deleteContent(@RequestParam Long content_no) {
		adminService.deleteContent(content_no);
		return "redirect:/admin/content";
	}

 @RequestMapping("/comments1")
	public String commentsList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<ContentVo> contentList = adminService.selectContent();
		List<CommentsVo> commentsList = adminService.selectComments();

		model.addAttribute("memberList", memberList);
		model.addAttribute("contentList", contentList);
		model.addAttribute("commentsList", commentsList);

		return "/admin/comments";
 }
	@RequestMapping("/comments")
	public String  commentsList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<MemberVo> memberList = adminService.selectMember();
		List<ContentVo> contentList = adminService.selectContent();
		List<CommentsVo> commentsList = adminService.selectComments();

		model.addAttribute("memberList", memberList);
		model.addAttribute("contentList", contentList);
		model.addAttribute("commentsList", commentsList); 

	 	
	 	int listcount = commentsList.size();
        List<CommentsVo> list=adminService.selectComments1(page, limit); 
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("commentsList", list);
        model.addAttribute("listcount", listcount);
    	
	  	return "/admin/comments";
}

	
	
	
	

	@RequestMapping("/insertcomments")
	public String insertCommentsString(CommentsVo commentsVo) {
		adminService.insertComments(commentsVo);
		return "redirect:/admin/comments";
	}

	@RequestMapping("/deletecomments")
	public String deleteComments(@RequestParam Long comments_no) {
		adminService.deleteComments(comments_no);
		return "redirect:/admin/comments";
	}

	@RequestMapping("/follow1")
	public String followList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<FollowVo> followList = adminService.selectFollow();

		model.addAttribute("memberList", memberList);
		model.addAttribute("followList", followList);
		return "/admin/follow";
	}
	@RequestMapping("/follow")
	
	public String followList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
		List<MemberVo> memberList = adminService.selectMember();
		List<FollowVo> followList = adminService.selectFollow();

		model.addAttribute("memberList", memberList);
		model.addAttribute("followList", followList);
		
	 	int listcount = followList.size();
        List<FollowVo> list=adminService.selectFollow1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("followList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/follow";
}
	

	@RequestMapping("/insertfollow")
	public String insertFollow(FollowVo followVo) {
		adminService.insertFollow(followVo);
		return "redirect:/admin/follow";
	}

	@RequestMapping("/deletefollow")
	public String deleteFollow(@RequestParam Long follow_no) {
		adminService.deleteFollow(follow_no);
		return "redirect:/admin/follow";
	}

	@RequestMapping("/searchlist1")
	public String searchList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<SearchListVo> searchList = adminService.selectSerchList();
		model.addAttribute("memberList", memberList);
		model.addAttribute("searchList", searchList);
		return "/admin/searchlist";
	}
	
	@RequestMapping("/searchlist")
	
	public String searchList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
		List<MemberVo> memberList = adminService.selectMember();
		List<SearchListVo> searchList = adminService.selectSerchList();
		model.addAttribute("memberList", memberList);
		model.addAttribute("searchList", searchList);
		
	 	int listcount = searchList.size();
        List<SearchListVo> list=adminService.selectSearchList1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("searchList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/searchlist";
}

	@RequestMapping("/insertsearchlist")
	public String insertSearchList(SearchListVo searchListVo) {
		adminService.insertSearchList(searchListVo);
		return "redirect:/admin/searchlist";
	}

	@RequestMapping("/deletesearchlist")
	public String deleteSearchList(@RequestParam Long searchList_no) {
		adminService.deleteSearchList(searchList_no);
		return "redirect:/admin/searchlist";
	}

	@RequestMapping("/plancomments1")
	public String planCommentsList(Model model) {
		List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();
		List<PlanCommentsVo> planCommentsList = adminService.selectPlanComments();

		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		model.addAttribute("planCommentsList", planCommentsList);
		return "/admin/plancomments";
	}
	@RequestMapping("/plancomments")
	
	public String planCommentsList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();
		List<PlanCommentsVo> planCommentsList = adminService.selectPlanComments();

		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		model.addAttribute("planCommentsList", planCommentsList);
		
	 	int listcount = planCommentsList.size();
        List<PlanCommentsVo> list=adminService.selectPlanComments1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("planCommentsList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/plancomments";
}
	

	@RequestMapping("/insertplancomments")
	public String insertPlanComments(PlanCommentsVo planCommentsVo) {
		adminService.insertPlanComments(planCommentsVo);
		return "redirect:/admin/plancomments";
	}

	@RequestMapping("/deleteplancomments")
	public String deletePalnComments(@RequestParam Long planComments_no) {
		adminService.deletePlanComments(planComments_no);
		return "redirect:/admin/plancomments";
	}

	@RequestMapping("/goodplan1")
	public String goodPlanList(Model model) {
		List<GoodPlanVo> goodPlanList = adminService.selectGoodPlan();
		List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();

		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		model.addAttribute("goodPlanList", goodPlanList);

		return "/admin/goodplan";
	}
	
	@RequestMapping("/goodplan")
	
	public String goodPlanList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<GoodPlanVo> goodPlanList = adminService.selectGoodPlan();
		List<MemberVo> memberList = adminService.selectMember();
		List<PlanVo> planList = adminService.selectPlan();

		model.addAttribute("memberList", memberList);
		model.addAttribute("planList", planList);
		model.addAttribute("goodPlanList", goodPlanList);
	 	int listcount = goodPlanList.size();
        List<GoodPlanVo> list=adminService.selectgoodPlan1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("goodPlanList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/goodplan";
}

	@RequestMapping("/insertgoodplan")
	public String insertGoodPlan(GoodPlanVo goodPlanVo) {
		adminService.insertGoodPlan(goodPlanVo);
		return "redirect:/admin/goodplan";
	}

	@RequestMapping("/deletegoodplan")
	public String deleteGoodPlan(@RequestParam Long goodPlan_no) {
		adminService.deleteGoodPlan(goodPlan_no);
		return "redirect:/admin/goodplan";
	}

	@RequestMapping("/goodcontent1")
	public String goodContentList(Model model) {
		List<ContentVo> contentList = adminService.selectContent();
		List<MemberVo> memberList = adminService.selectMember();
		List<GoodContentVo> goodContentList = adminService.selectGoodContent();
		model.addAttribute("goodContentList", goodContentList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("contentList", contentList);
		return "/admin/goodcontent";
	}
	
	@RequestMapping("/goodcontent")
	
	public String goodContentList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
		List<ContentVo> contentList = adminService.selectContent();
		List<MemberVo> memberList = adminService.selectMember();
		List<GoodContentVo> goodContentList = adminService.selectGoodContent();
		model.addAttribute("goodContentList", goodContentList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("contentList", contentList);
		
	 	int listcount = goodContentList.size();
        List<GoodContentVo> list=adminService.selectgoodContent1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("goodContentList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/goodcontent";
}

	@RequestMapping("/insertgoodcontent")
	public String insertGoodContent(GoodContentVo goodContentVo) {
		adminService.insertGoodContent(goodContentVo);
		return "redirect:/admin/goodcontent";
	}

	@RequestMapping("/deletegoodcontent")
	public String deleteGoodContent(@RequestParam Long goodContent_no) {
		adminService.deleteGoodContent(goodContent_no);
		return "redirect:/admin/goodcontent";
	}

	@RequestMapping("/contentbox1")
	public String contentBoxList(Model model) {
		List<PlanVo> planList = adminService.selectPlan();
		List<ContentVo> contentList = adminService.selectContent();
		List<ContentBoxVo> contentBoxList = adminService.selectContentBox();

		model.addAttribute("planList", planList);
		model.addAttribute("contentList", contentList);
		model.addAttribute("contentBoxList", contentBoxList);
		return "/admin/contentbox";
	}
	@RequestMapping("/contentbox")
	
	public String contentBoxList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	
		List<PlanVo> planList = adminService.selectPlan();
		List<ContentVo> contentList = adminService.selectContent();
		List<ContentBoxVo> contentBoxList = adminService.selectContentBox();
		

		model.addAttribute("planList", planList);
		model.addAttribute("contentList", contentList);
	 	int listcount = contentBoxList.size();
        List<ContentBoxVo> list=adminService.selectContentBox1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("contentBoxList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/contentbox";
}
	

	@RequestMapping("/insertcontentbox")
	public String insertContentBox(ContentBoxVo contentBoxVo) {
		adminService.insertContentBox(contentBoxVo);
		return "redirect:/admin/contentbox";
	}

	@RequestMapping("/deletecontentbox")
	public String deleteContentBox(@RequestParam Long contentBox_no) {
		adminService.deleteContentBox(contentBox_no);
		return "redirect:/admin/contentbox";
	}

	@RequestMapping("/planimg1")
	public String planImgList(Model model) {
		List<PlanVo> planList = adminService.selectPlan();
		List<PlanImgVo> planImgList = adminService.selectPlanImg();

		model.addAttribute("planList", planList);
		model.addAttribute("planImgList", planImgList);
		return "/admin/planimg";
	}
	
	@RequestMapping("/planimg")
	
	public String planImgList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<PlanVo> planList = adminService.selectPlan();
		List<PlanImgVo> planImgList = adminService.selectPlanImg();

		model.addAttribute("planList", planList);
		model.addAttribute("planImgList", planImgList);
		
	 	int listcount = planImgList.size();
        List<PlanImgVo> list=adminService.selectPlanImg1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("planImgList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/planimg";
}

	@RequestMapping("/insertplanimg")
	public String insertPlanImg(PlanImgVo planImgVo,
			@RequestParam(required = false) MultipartFile img) {
		adminService.insertPlanImg(planImgVo, img);
		return "redirect:/admin/planimg";
	}

	@RequestMapping("/deleteplanimg")
	public String deletePlanImg(@RequestParam Long planImg_no) {
		adminService.deletePlanImg(planImg_no);
		return "redirect:/admin/planimg";
	}

	
	// plan_no를 선택하면 타이틀이 나옴 
	@RequestMapping("/getTitle")
	@ResponseBody
	public ContentVo getTitle(@RequestParam(required = false) Long content_no) {

		ContentVo contentVo = adminService.getTitle(content_no);
		return contentVo;

	}
	
	@RequestMapping("/event1")
	public String eventList(Model model){
		List<ContentVo> contentList = adminService.selectContent();
		List<EventVo> eventList = adminService.selectEvent();
		
		model.addAttribute("contentList",contentList);
		model.addAttribute("eventList",eventList);
		return "/admin/event";
	}
	
	@RequestMapping("/event")
	
	public String eventList(@RequestParam( required=false, defaultValue="1") int page, Model model) {
	 	int limit=5; 
	 	List<ContentVo> contentList = adminService.selectContent();
		List<EventVo> eventList = adminService.selectEvent();
		
		model.addAttribute("contentList",contentList);
		model.addAttribute("eventList",eventList);
		
	 	int listcount = eventList.size();
        List<EventVo> list=adminService.selectEvent1(page, limit);
        int maxpage=(int)((double)listcount/limit+0.95);

        int startpage=(((int)((double)page/10+0.9))-1)*10+1;
  
        int endpage=maxpage;
        if(endpage>startpage+10-1){
        	endpage=startpage+10-1;
        }
        model.addAttribute("nowpage", page);
        model.addAttribute("maxpage", maxpage);
        model.addAttribute("startpage", startpage);
        model.addAttribute("endpage", endpage);
        model.addAttribute("eventList", list);
        model.addAttribute("listcount", listcount);
        System.out.println(list);
    	
	  	return "/admin/event";
}
	
	
	@RequestMapping("/insertevent")
	public String insertEvent(EventVo eventVo){
		System.out.println("제발좀여"+eventVo);
		adminService.insertEvent(eventVo);
		return "redirect:/admin/event";
	}
	
	@RequestMapping("/deleteevent")
	public String deleteEvent(@RequestParam Long event_no){
		adminService.deleteEvent(event_no);
		return "redirect:/admin/event";
	}
   
	// title를 선택하면 content_no이 나옴 
	@RequestMapping("/getcontent_no")
	@ResponseBody
	public ContentVo getContent_no(@RequestParam(required = false) String title) {

		ContentVo contentVo = adminService.getContent_no(title);
		return contentVo;

	}
	
	// plan_no를 선택하면 planName이 나옴 
	@RequestMapping("/getplanname")
	@ResponseBody
	public PlanVo getPlanName(@RequestParam(required = false) long plan_no) {

		PlanVo planVo = adminService.getPlanName(plan_no);
		return planVo;

	}
	
	// themeBox_no를 선택하면 themeName이 나옴 
	@RequestMapping("/getthemename")
	@ResponseBody
	public ThemeVo getThemeName(@RequestParam(required = false) long theme_no) {

		ThemeVo themeVo = adminService.getThemeName(theme_no);
		return themeVo;

	}
}
