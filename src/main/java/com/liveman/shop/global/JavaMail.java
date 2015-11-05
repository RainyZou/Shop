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
 * �򵥵ķ���HTML�����ʼ��Ĺ���
 *
 * @author Alan
 */
public class JavaMail {

	private static final Logger logger = Logger.getLogger(JavaMail.class.getName());
	private final String host;
	private final String user;
	private final String pwd;

	/**
	 * ��ʼ���࣬�������ʼ�SMTP������
	 *
	 * @param host
	 *            SMTP����������smtp.163.com
	 * @param user
	 *            ���������ַ
	 * @param pwd
	 *            ������������
	 */
	public JavaMail(String host, String user, String pwd) {
		this.host = host;
		this.user = user;
		this.pwd = pwd;
		logger.log(Level.INFO, "smtp host = {0}", host);
		logger.log(Level.INFO, "send user = {0}", user);
	}

	/**
	 * ����HTML��ʽ���ʼ���Ҳ���Է������ı���ʽ���ʼ�
	 *
	 * @param title
	 *            �ʼ�����
	 * @param htmlContent
	 *            �ʼ����ģ�������HTML��ʽ���ߴ��ı���ʽ
	 * @param toEmails
	 *            �ռ��˵�ַ�������ǵ���Email��ַ���߶��Email��ַ
	 */
	public void sendHtml(String title, String htmlContent, String... toEmails) {
		logger.log(Level.INFO, "start send email...");
		for (int i = 0; i < toEmails.length; i++) {
			logger.log(Level.INFO, "toEmails = {" + i + "}", toEmails);
		}
		logger.log(Level.INFO, "title = {0}", title);
		logger.log(Level.INFO, "htmlContent = {0}", htmlContent);
		try {
			// �����ʼ��Ự
			Properties props = new Properties(); // ������һ���ļ��д洢��-ֵ�Եģ����м���ֵ���õȺŷָ��ģ�
			props.put("mail.smtp.host", host);// �洢�����ʼ�����������Ϣ
			props.put("mail.smtp.auth", "true");// ͬʱͨ����֤

			// ���������½�һ���ʼ��Ự
			Session s = Session.getInstance(props);
			// s.setDebug(true); //�������ӡһЩ������Ϣ��

			// ���ʼ��Ự�½�һ����Ϣ����
			MimeMessage message = new MimeMessage(s);

			// �����ʼ�
			InternetAddress from = new InternetAddress(user);
			message.setFrom(from); // ���÷����˵ĵ�ַ

			// �����ռ���,���������������ΪTO
			for (String toEmail : toEmails) {
				InternetAddress to = new InternetAddress(toEmail);
				message.addRecipient(Message.RecipientType.TO, to);
			}

			message.setSubject(title); // ���ñ���

			// �����ż�����
			// message.setText(str_content); //�����ı��ʼ�

			// ����HTML�ʼ�
			message.setContent(htmlContent, "text/html;charset=utf-8");

			// <b>���</b><br><p>��Һ�</p>

			// ���÷���ʱ��
			message.setSentDate(new Date());

			// �洢�ʼ���Ϣ
			message.saveChanges();

			// �����ʼ�
			Transport transport = s.getTransport("smtp");

			// ��smtp��ʽ��¼����,��һ�������Ƿ����ʼ��õ��ʼ�������SMTP��ַ,�ڶ�������Ϊ�û���,����������Ϊ����
			transport.connect(host, user, pwd);

			// �����ʼ�,���еڶ�����������������õ��ռ��˵�ַ
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
		sendmail.sendHtml("��������HTML�ʼ�", "<a href='http://www.baidu.com/'>�������ٶ�</a>", "alanzyy@foxmail.com");
	}
}
