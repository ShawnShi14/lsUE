package org.loushang.ue.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.loushang.framework.mybatis.PageUtil;
import org.loushang.ue.user.data.User;
import org.loushang.ue.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * Controller层，用于前后台交互、前后台数据格式转换
 * 
 * @author 框架产品组
 * 
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    IUserService userService;

    /**
     * 跳转用户列表页面
     * 
     * @return 用户列表页面
     */
    @RequestMapping
    public String getPage() {
        return "user/queryuser";
    }
    
    // ////////////////////////////////新增、修改//////////////////////////////////

    /**
     * 用户修改页面的跳转
     * 
     * @param id [主键ID
     * 
     * @return Map key为
     *          <code>user<code>[User对象]
     * 
     */
    @RequestMapping("/edit")
    public ModelAndView editPage(@RequestParam(value = "id", required = false) String id) {
        User user = null;
        if (id != null && !"".equals(id)) {
        	user = userService.findOne(id);
            if (user != null) {
            	user.setArchive(userService.findArchive(id));
            }
        }
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("user", user);
        return new ModelAndView("user/userdetailedit", model);
    }

    /**
     * 新增、修改用户的保存操作
     * 
     * @param user
     * 
     * @return 用户列表页面路径
     * 
     */
    @RequestMapping(value = "/save")
    public String saveUser(User user) {
        userService.save(user);
        return "redirect:/service/user";
    }

    // ////////////////////////////////删除//////////////////////////////////

    /**
     * 用户删除操作
     * 
     * @param ids [主键ID数组]
     * 
     * @return 用户列表页面路径
     * 
     */
    @RequestMapping("/delete/{ids}")
    public String deleteUser(@PathVariable String ids) {
        if (ids != null) {
            String[] idArray = ids.split(",");
            userService.delete(idArray);
        }
        return "redirect:/service/user";
    }
    
    // ////////////////////////////////查询//////////////////////////////////
    /**
     * 用户信息数据的查询
     * 
     * @param parameters, key 分别为 ： 
     *              <code>orderfield<code>[排序列]
     *              <code>orderdir<code>[排序方向desc或asc] 
     *              <code>start<code>[起始行] 
     *              <code>limit<code>[每页显示条数]
     * 
     * @return Map, key分别为：
     *              <code>total<code>[总记录条数] 
     *              <code>data<code>[用户信息列表], List 内容为 User
     * 
     */
    @RequestMapping("/data")
    @ResponseBody
    public Map query(@RequestBody Map<String, Object> parameters) {

        Map<String, Object> userdata = new HashMap<String, Object>();
        List<User> users = userService.findAll(parameters);
        userdata.put("data", users);
        // 获取总记录条数
        int total = PageUtil.getTotalCount();
        userdata.put("total", total != -1 ? total : users.size());
        return userdata;
    }
    
    @RequestMapping("/query")
    @ResponseBody
    public Map queryForepage(@RequestBody Map<String, Object> parameters) {

        Map<String, Object> userdata = new HashMap<String, Object>();
        List<User> users = userService.findAll(parameters);
        userdata.put("data", users);
        return userdata;
    }
}
