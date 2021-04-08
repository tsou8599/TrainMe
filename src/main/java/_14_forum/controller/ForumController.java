package _14_forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForumController {

	@GetMapping("/forumAll")
	public String ForumAll (Model model) {
		
		return "/_14_forum/forum_all";
	}
	
	@GetMapping("/forumAll/newArticle")
	public String NewArticle (Model model) {
		
		return "/_14_forum/new_article";
	}
	
}
