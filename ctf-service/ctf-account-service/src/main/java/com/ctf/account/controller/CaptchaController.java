package com.ctf.account.controller;

import com.ctf.cach.redis.constants.ApplicationConstants;

import com.ctf.cach.redis.util.RedisUtils;
import com.ctf.component.commons.utils.CaptchaUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;


/**
 * 验证码的控制层
 */
@RestController
@RequestMapping("/captcha")
public class CaptchaController {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private RedisUtils redisUtils;



    /**
     * 生成图像验证码
     *
     * @param response 响应对象
     * @return
     */
    @GetMapping(path = "/generateImageCaptcha")
    public ResponseEntity<Resource> generateImageCaptcha(HttpServletResponse response) {
        ResponseEntity<Resource> responseEntity = null;
        try {
            String charCaptcha = CaptchaUtils.generateCharCaptcha();
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            redisUtils.psetex(ApplicationConstants.CHAR_CAPTCHA_PREFIX + authentication.getName(), charCaptcha);
            byte[] bytes = CaptchaUtils.generateImageCaptcha(charCaptcha);
            Resource resource = new ByteArrayResource(bytes);
            responseEntity = new ResponseEntity<>(resource, CaptchaUtils.getResponseHeaders(), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            logger.warn(e.toString());
        }
        return responseEntity;
    }


}
