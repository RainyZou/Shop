package com.liveman.shop.global;

public class ShopMail {

	private static String WEBSITE_NAME = "�Ժ����̳�";
	private static String CONTENT_PATH = "http://localhost:8080/Shop/";

	public static void send(String title, String htmlContent, String... toEmails) {
		new Thread(new Runnable() {
			@Override
			public void run() {
				JavaMail sendmail = new JavaMail("smtp.163.com", "taoseafood@163.com", "bjpnflymskzmzsen");
				sendmail.sendHtml(title, htmlContent, toEmails);
			}
		}).start();
	}

	public static void sendRegisterSuccess(String userName, String email) {
		String html = "<html>" + //
				"��л��ע�����ǵ���վ�����ס�����û���" + "<br/>" + //
				userName + "<br/>" + //
				"<br/>" + //
				"<a href='" + CONTENT_PATH + "'>" + WEBSITE_NAME + "</a>" + //
				"</html>";
		send("ע��ɹ�-" + WEBSITE_NAME, html, email);
	}

	public static void sendResetLink(String uuid, String email) {
		String url = CONTENT_PATH + "user/resetPassword?uuid=" + uuid;
		String html = "<html>" + //
				"������������ӽ����������ý��棬���ӽ���2Сʱ�����" + "<br/>" + //
				"<a href='" + url + "'>" + url + "</a>" + "<br/>" + //
				"<br/>" + //
				"<a href='" + CONTENT_PATH + "'>" + WEBSITE_NAME + "</a>" + "<br/>" + //
				"</html>";
		send("��������-" + WEBSITE_NAME, html, email);
	}

	public static void main(String[] args) {
		sendResetLink("c7680ac981fa4cb7ba3dfe524309bbb7", "alanzyy@foxmail.com");
	}
}
