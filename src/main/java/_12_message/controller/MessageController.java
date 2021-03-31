package _12_message.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import _12_message.dto.MessageInfo;
import _12_message.model.MessageBean;
import _12_message.service.MessageService;

@SessionAttributes({"st_unreadMessage"})
@Controller
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	@GetMapping("/message/{id}")
	public String goToMaill(Model model, @PathVariable("id") Integer id) {
		return "_12_message/message";
	}
	
	@GetMapping("allMessage/{id}")
	public @ResponseBody String allMessage(@PathVariable("id")Integer id,
			@RequestParam("type") Integer type){
		List<MessageInfo> messageInfos = new ArrayList<>();
		List<MessageBean> messages = messageService.getAllMessage(id, type);
		for(MessageBean message:messages) {
			MessageInfo info = MessageInfo.create(message);
			messageInfos.add(info);
		}
		Gson gson = new Gson();
        String json = gson.toJson(messageInfos);
		return json;
		
	}
	
	@PostMapping("markAsRead/{id}")
	public @ResponseBody String markAsRead(Model model, @PathVariable("id") Integer id,
			@RequestParam("msgId") Integer msgId,
			@RequestParam("type") Integer type) {
		messageService.changeIsRead(messageService.getMessageById(msgId));
		
		Long unread =  messageService.unreadMessage(id, type);
		Long unreadMessage =  messageService.unreadMessage(id,type);
		model.addAttribute("st_unreadMessage", unreadMessage);
		
		
		return unread.toString();
	}
	
	@PostMapping("unRead/{id}")
	public @ResponseBody String markAsRead(Model model, @PathVariable("id") Integer id,
			@RequestParam("type") Integer type) {
		
		Long unread =  messageService.unreadMessage(id, type);
		
		
		return unread.toString();
	}
	
}
