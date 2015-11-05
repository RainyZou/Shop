package com.liveman.shop.global;

import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 简单的发生HTML类型邮件的工具
 *
 * @author Alan
 */
public class JavaMail {

	private static final Logger logger = Logger.getLogger(JavaMail.class.getName());
	private final String host;
	private final String user;
	private final String pwd;

	/**
	 * 初始化类，并配置邮件SMTP服务器
	 *
	 * @param host
	 *            SMTP服务器，如smtp.163.com
	 * @param user
	 *            发送邮箱地址
	 * @param pwd
	 *            发送邮箱密码
	 */
	public JavaMail(String host, String user, String pwd) {
		this.host = host;
		this.user = user;
		this.pwd = pwd;
		logger.log(Level.INFO, "smtp host = {0}", host);
		logger.log(Level.INFO, "send user = {0}", user);
	}

	/**
	 * 发送HTML格式的邮件，也可以发生纯文本格式的邮件
	 *
	 * @param title
	 *            邮件标题
	 * @param htmlContent
	 *            邮件正文，可以是HTML格式或者纯文本格式
	 * @param toEmails
	 *            收件人地址，可以是单个Email地址或者多个Email地址
	 */
	public void sendHtml(String title, String htmlContent, String... toEmails) {
		logger.log(Level.INFO, "start send email...");
		for (int i = 0; i < toEmails.length; i++) {
			logger.log(Level.INFO, "toEmails = {" + i + "}", toEmails);
		}
		logger.log(Level.INFO, "title = {0}", title);
		logger.log(Level.INFO, "htmlContent = {0}", htmlContent);
		try {
			// 建立邮件会话
			Properties props = new Properties(); // 用来在一个文件中存储键-值对的，其中键和值是用等号分隔的，
			props.put("mail.smtp.host", host);// 存储发送邮件服务器的信息
			props.put("mail.smtp.auth", "true");// 同时通过验证

			// 根据属性新建一个邮件会话
			Session s = Session.getInstance(props);
			// s.setDebug(true); //有他会打印一些调试信息。

			// 由邮件会话新建一个消息对象
			MimeMessage message = new MimeMessage(s);

			// 设置邮件
			InternetAddress from = new InternetAddress(user);
			message.setFrom(from); // 设置发件人的地址

			// 设置收件人,并设置其接收类型为TO
			for (String toEmail : toEmails) {
				InternetAddress to = new InternetAddress(toEmail);
				message.addRecipient(Message.RecipientType.TO, to);
			}

			message.setSubject(title); // 设置标题

			// 设置信件内容
			// message.setText(str_content); //发送文本邮件

			// 发送HTML邮件
			message.setContent(htmlContent, "text/html;charset=utf-8");

			// <b>你好</b><br><p>大家好</p>

			// 设置发信时间
			message.setSentDate(new Date());

			// 存储邮件信息
			message.saveChanges();

			// 发送邮件
			Transport transport = s.getTransport("smtp");

			// 以smtp方式登录邮箱,第一个参数是发送邮件用的邮件服务器SMTP地址,第二个参数为用户名,第三个参数为密码
			transport.connect(host, user, pwd);

			// 发送邮件,其中第二个参数是所有已设好的收件人地址
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();

			logger.log(Level.INFO, "Successful.");
		} catch (Exception e) {
			logger.log(Level.SEVERE, e.toString(), e);
		}
		logger.log(Level.INFO, "end send email.");
	}

	public static void main(String[] args) {
		JavaMail sendmail = new JavaMail("smtp.163.com", "taoseafood@163.com", "bjpnflymskzmzsen");
		sendmail.sendHtml("测试中文HTML邮件", "<a href='http://www.baidu.com/'>点击进入百度</a>", "alanzyy@foxmail.com");
	}
}
