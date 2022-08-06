package com.ctf.account.service.impl;

import com.ctf.account.entity.SysUserDetail;
import com.ctf.account.mapper.SysUserDetailMapper;
import com.ctf.account.service.SysUserDetailService;
import com.ctf.cach.redis.constants.ApplicationConstants;
import com.ctf.cach.redis.util.RedisUtils;
import com.ctf.component.commons.utils.RecursiveListUtils;
import com.ctf.component.commons.utils.SequenceGenerator;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.MessageFormat;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * 用户详细信息的业务逻辑实现层
 */
@Service
@Transactional
public class SysUserDetailServiceImpl implements SysUserDetailService {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    private static SequenceGenerator sequenceGenerator = new SequenceGenerator();

    @Autowired
    private SysUserDetailMapper sysUserDetailMapper;
    @Autowired
    private RedisUtils redisUtils;


    /**
     * 查询当前用户的角色
     */
    @Override
    public List<String> getRoleCodeBySysUser(String username, String mobile) {
        return sysUserDetailMapper.getRoleCodeBySysUser(username, mobile);
    }

    /**
     * 查询当前用户的授权菜单
     */
    @Override
    public List<LinkedHashMap<String, Object>> querySysMenuAuthorityTree(String username, String mobile) {
        List<LinkedHashMap<String, Object>> totalList = sysUserDetailMapper.querySysMenuAuthorityTree(username, mobile);
        return RecursiveListUtils.queryMenuRecursiveList(totalList);
    }

    /**
     * 查询当前用户的授权按钮隐藏项
     */
    @Override
    public List<String> queryRoleMenuButton(String username, String mobile) {
        return sysUserDetailMapper.queryRoleMenuButton(username, mobile);
    }

    /**
     * 新增用户
     */
    @Override
    public void insertSysUser(SysUserDetail sysUser) {
        Integer existing = sysUserDetailMapper.getSysUserByIdentification(sysUser.getUsername().trim(), sysUser.getEmail().trim(), sysUser.getMobile().trim());
        if (existing != null && existing > 0) {
            throw new IllegalArgumentException("用户名或邮箱或手机号已存在");
        }
        sysUser.setId(sequenceGenerator.nextId());
        sysUser.setPassword(encoder.encode(sysUser.getPassword()));
        sysUser.setProvinceRegionCode("440000");
        sysUser.setCityRegionCode("440100");
        sysUserDetailMapper.insertSysUser(sysUser);
        logger.info("用户已新增： {}", sysUser.getUsername());
    }

    /**
     * 编辑用户详细信息
     */
    @Override
    public void updateSysUserDetail(SysUserDetail sysUser) {
        sysUserDetailMapper.updateSysUserDetail(sysUser);
        logger.info("用户详细信息已编辑： {}", sysUser.getId());
    }

    /**
     * 根据字段编辑用户信息
     */
    @Override
    public void updateSysUserInfo(String fieldValue, String field, Long id) {
        if ("mobile".equals(field)) {
            Integer existing = sysUserDetailMapper.getSysUserByIdEmailMobile(id, null, fieldValue.trim());
            if (existing != null && existing > 0) {
                throw new IllegalArgumentException("手机号已存在，修改失败");
            }
        } else if ("email".equals(field)) {
            Integer existing = sysUserDetailMapper.getSysUserByIdEmailMobile(id, fieldValue.trim(), null);
            if (existing != null && existing > 0) {
                throw new IllegalArgumentException("邮箱已存在，修改失败");
            }
        }
        sysUserDetailMapper.updateSysUserInfo(fieldValue, field, id);
        logger.info("用户信息已编辑： {}", id);
    }

    /**
     * 修改用户密码
     */
    @Override
    public void updatePassword(String password, String newPassword, Long id) {
        String oldPassword = sysUserDetailMapper.getPasswordById(id);
        if (!encoder.matches(password, oldPassword)) {
            throw new IllegalArgumentException("原密码不正确");
        }
        sysUserDetailMapper.updateSysUserInfo(encoder.encode(newPassword), "password", id);
        logger.info("用户密码已修改： {}", id);
    }

    /**
     * 找回密码
     */
    @Override
    public void retrievePassword(String email, String charCaptcha) {
        Integer existing = sysUserDetailMapper.getSysUserByIdentification(null, email, null);
        if (existing == null) {
            throw new IllegalArgumentException("邮箱不存在");
        }
        String charCaptchaKey = ApplicationConstants.CHAR_CAPTCHA_PREFIX + "anonymousUser";
        String charCaptchaCache = redisUtils.get(charCaptchaKey);
        if (charCaptcha.equalsIgnoreCase(charCaptchaCache)) {
            String newPassword = RandomStringUtils.randomAlphanumeric(6);
            String subject = "找回密码";
            String text = MessageFormat.format("你的账户新密码是：{0}", newPassword);

            sysUserDetailMapper.updatePasswordByEmail(encoder.encode(newPassword), email);
        } else {
            throw new IllegalArgumentException("图片验证码错误或已过期，请重新输入");
        }
        redisUtils.del(charCaptchaKey);
    }

    /**
     * 比对验证码
     */
    @Override
    public void compareCaptcha(String charCaptcha) {
        String charCaptchaKey = ApplicationConstants.CHAR_CAPTCHA_PREFIX + "anonymousUser";
        String charCaptchaCache = redisUtils.get(charCaptchaKey);

        if (!charCaptcha.equalsIgnoreCase(charCaptchaCache)) {
            throw new IllegalArgumentException("图片验证码错误或已过期，请重新输入");
        }
        redisUtils.del(charCaptchaKey);
    }


}
