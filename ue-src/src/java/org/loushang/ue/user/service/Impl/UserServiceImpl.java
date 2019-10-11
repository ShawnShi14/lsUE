package org.loushang.ue.user.service.Impl;

import java.util.List;
import java.util.Map;

import org.loushang.ue.user.dao.ArchiveMapper;
import org.loushang.ue.user.dao.UserMapper;
import org.loushang.ue.user.data.User;
import org.loushang.ue.user.data.UserArchive;
import org.loushang.ue.user.service.IUserService;
import org.loushang.framework.util.UUIDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service层 实现类，用于业务逻辑处理，事务控制等
 * 
 * @author 框架产品组
 * 
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ArchiveMapper archiveMapper;
    
    // ////////////////////////////////新增、修改//////////////////////////////////

    /**
     * 保存新增和修改后的用户信息
     * 
     * @param user
     * 
     * @return User
     * 
     */
    @Transactional("mybatisTransactionManager")
    public User save(User user) {

        if (user.getUserId() != null && !user.getUserId().equals("")) {
            // 更新用户信息
            userMapper.update(user);
            // 更新用户档案信息
            user.getArchive().setGender(user.getUserId());
            archiveMapper.update(user.getArchive());
        } else {
            // 保存用户信息
            user.setUserId(UUIDGenerator.getUUID());
            userMapper.insert(user);
            // 保存用户档案信息
            user.getArchive().setGender(user.getUserId());
            archiveMapper.insert(user.getArchive());
        }
        return user;
    }

    // ////////////////////////////////删除//////////////////////////////////

    /**
     * 根据ID删除用户
     * 
     * @param id [ID主键]
     * 
     */
    @Transactional("mybatisTransactionManager")
    public void delete(String id) {
        // 删除用户档案信息
        archiveMapper.delete(id);
        // 删除用户信息
        userMapper.delete(id);
    }

    /**
     * 根据ID批量删除用户
     * 
     * @param ids [ID主键数组]
     * 
     */
    @Transactional("mybatisTransactionManager")
    public void delete(String[] ids) {
        // 删除用户档案信息
        archiveMapper.batchDelete(ids);
        // 删除用户信息
        userMapper.batchDelete(ids);

    }

    // ////////////////////////////////查询//////////////////////////////////

    /**
     * 查询所有用户数据
     * 
     * @param map, key 分别为 ： 
     *              <code>orderfield<code>[排序列] 
     *              <code>orderdir<code>[排序方向desc或asc] 
     *              <code>start<code>[起始行]
     *              <code>limit<code>[每页显示条数]
     *              
     * @return List, 内容为User对象列表
     * 
     */
    public List<User> findAll(Map map) {
        return userMapper.findAll(map);
    }

    /**
     * 根据ID获取用户信息
     * 
     * @param id [ID主键]
     * 
     * @return User
     * 
     */
    public User findOne(String id) {
        return userMapper.get(id);
    }

    /**
     * 根据id查询用户档案信息
     * 
     * @param id [ID主键]
     * 
     * @return UserArchive
     * 
     */
    public UserArchive findArchive(String id) {
        return archiveMapper.get(id);
    }
}
