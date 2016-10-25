package com.ht.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * �����������
 * 
 * @author xw�ز����ṩ
 * 
 */
public class DrawImage extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public static final int WIDTH = 120;
	public static final int HEIGHT = 30;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// ��������
		BufferedImage bi = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);
		// ��û���
		Graphics g = bi.getGraphics();

		// ���ñ�Ӱɫ
		setBackGround(g);
		// ���ñ߿�
		setBorder(g);
		// ��������
		drawRandomLine(g);
		// д�����
		String random = drawRandomNum((Graphics2D) g);
		// ��������ִ���session��
		request.getSession().setAttribute("checkcode", random);
		// ��ͼ��д�������
		response.setContentType("image/jpeg");
		// ��ͷ�����������Ҫ����
		response.setDateHeader("expries", -1);
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		// ��ͼƬд�������
		ImageIO.write(bi, "jpg", response.getOutputStream());
	}

	/**
	 * ���ñ���ɫ
	 * 
	 * @param g
	 */
	private void setBackGround(Graphics g) {
		// ������ɫ
		g.setColor(Color.WHITE);
		// �������
		g.fillRect(0, 0, WIDTH, HEIGHT);

	}

	/**
	 * ���ñ߿�
	 * 
	 * @param g
	 */
	private void setBorder(Graphics g) {
		// ���ñ߿���ɫ
		g.setColor(Color.BLUE);
		// �߿�����
		g.drawRect(1, 1, WIDTH - 2, HEIGHT - 2);
	}

	/**
	 * ���������
	 * 
	 * @param g
	 */
	private void drawRandomLine(Graphics g) {
		// ������ɫ
		g.setColor(Color.GREEN);
		// ������������������
		for (int i = 0; i < 5; i++) {
			int x1 = new Random().nextInt(WIDTH);
			int y1 = new Random().nextInt(HEIGHT);
			int x2 = new Random().nextInt(WIDTH);
			int y2 = new Random().nextInt(HEIGHT);
			g.drawLine(x1, y1, x2, y2);
		}

	}

	/**
	 * ���������
	 * 
	 * @param g
	 * @return
	 */
	private String drawRandomNum(Graphics2D g) {
		StringBuffer sb = new StringBuffer();
		// ������ɫ
		g.setColor(Color.RED);
		// ��������
		g.setFont(new Font("楷体", Font.BOLD, 20));
		// ׼�����ú��ּ�
		String base = "1234567890";
		int x = 5;
		// ��������
		for (int i = 0; i < 4; i++) {
			// ����������ת�Ƕ�
			int degree = new Random().nextInt() % 10;
			// ��ȡ����
			String ch = base.charAt(new Random().nextInt(base.length())) + "";
			sb.append(ch);
			// ����Ƕ�
			g.rotate(degree * Math.PI / 180, x, 20);
			g.drawString(ch, x, 20);
			// ����Ƕ�
			g.rotate(-degree * Math.PI / 180, x, 20);
			x += 30;
		}
		return sb.toString();
	}
}
