package org.loushang.ue.feedback.service;

import java.util.List;

import org.loushang.ue.feedback.data.FeedBack;

public interface IFeedBackService {

	/**
	 * 按组件id对feedback进行查询
	 * 
	 * @param comId
	 * @returns
	 */
	public List<FeedBack> getFeedBacksByComId(String comId);

	/**
	 * 添加组件评论
	 * 
	 * @return
	 */
	public void saveFeedBack(FeedBack feedBack);

}
