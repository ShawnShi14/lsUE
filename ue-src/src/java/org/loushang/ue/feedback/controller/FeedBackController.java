package org.loushang.ue.feedback.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.loushang.framework.util.UUIDGenerator;
import org.loushang.ue.feedback.data.FeedBack;
import org.loushang.ue.feedback.service.IFeedBackService;
import org.loushang.ue.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/feedback")
public class FeedBackController {

	@Autowired
	IFeedBackService feedbackService;

	// 按组件id对feedback进行查询
	@RequestMapping(value = "/getFeedBacksByComId", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getFeedBacksByComId(HttpServletRequest request) {
		String comId = request.getParameter("comId");
		Map<String, Object> feedbackdata = new HashMap<String, Object>();
		List<FeedBack> feedbacks = new ArrayList<FeedBack>();
		feedbacks = feedbackService.getFeedBacksByComId(comId);
		feedbackdata.put("data", feedbacks);
		return feedbackdata;
	}

	// 对组件进行评论
	@RequestMapping(value = "/saveFeedBack", method = RequestMethod.POST)
	@ResponseBody
	public void insert(HttpServletRequest request)
			throws UnsupportedEncodingException {
		String userId = request.getParameter("userId");
		String score = request.getParameter("score");
		String content = request.getParameter("content");
		String comId = request.getParameter("comId");
		FeedBack feedBack = new FeedBack();
		TimeUtil timeUtil = new TimeUtil();
		feedBack.setUserId(userId);
		feedBack.setScore(score);
		feedBack.setContent(content);
		feedBack.setComId(comId);
		feedBack.setCreateTime(timeUtil.getCurrentDateTime());
		feedBack.setId(UUIDGenerator.getUUID());
		feedbackService.saveFeedBack(feedBack);
	}

}
