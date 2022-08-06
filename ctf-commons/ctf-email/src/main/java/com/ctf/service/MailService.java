package com.ctf.service;

import com.ctf.model.Email;
import com.ctf.model.EmailVO;

/**
 * @author Daneil
 */
public interface MailService {
    /**
     * 发送邮件带附件
     * @param emailForm
     * @return
     */
    Boolean sendMailWithAttachments(Email emailForm);

    Boolean send(EmailVO email);
}
