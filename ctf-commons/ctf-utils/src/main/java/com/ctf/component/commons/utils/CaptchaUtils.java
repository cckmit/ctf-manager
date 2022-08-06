package com.ctf.component.commons.utils;

import com.ctf.component.commons.exception.ServiceException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.FastByteArrayOutputStream;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.QuadCurve2D;
import java.awt.image.BufferedImage;
import java.util.concurrent.ThreadLocalRandom;


/**
 * 图片验证码工具类
 *
 *
 */
public class CaptchaUtils {

	private static final int WIDTH = 125;// 验证码默认宽度
	private static final int HEIGHT = 35;// 验证码默认高度
	private static final int CODE_SIZE = 4;// 验证码默认随机字符数
	private static final char[] CHAR_ARRAY = "3456789ABCDEFGHJKMNPQRSTUVWXY".toCharArray();// 验证码随机字符数组
	private static final Font[] RANDOM_FONT = new Font[] { new Font(Font.DIALOG, Font.BOLD, 33), new Font(Font.DIALOG_INPUT, Font.BOLD, 34),
			new Font(Font.SERIF, Font.BOLD, 33), new Font(Font.SANS_SERIF, Font.BOLD, 34), new Font(Font.MONOSPACED, Font.BOLD, 34) };// 验证码字体

	private CaptchaUtils() {

	}

	/**
	 * 生成图像验证码
	 *
	 * @param charCaptcha 验证码字符
	 * @return
	 */
	public static byte[] generateImageCaptcha(String charCaptcha) {
		BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		try (FastByteArrayOutputStream outputStream = new FastByteArrayOutputStream()) {
			drawGraphic(image, charCaptcha);
			ImageIO.write(image, "JPEG", outputStream);
			return outputStream.toByteArray();
		} catch (Exception e) {
			throw new ServiceException(e.toString());
		}
	}

	/**
	 * 生成验证码字符串
	 *
	 * @return
	 */
	public static String generateCharCaptcha() {
		ThreadLocalRandom random = ThreadLocalRandom.current();
		int count = CODE_SIZE;
		char[] buffer = new char[count];
		for (int i = 0; i < count; i++) {
			buffer[i] = CHAR_ARRAY[random.nextInt(CHAR_ARRAY.length)];
		}
		return new String(buffer);
	}

	/**
	 * 画验证码的图像
	 *
	 * @param bufferedImage 图像缓冲区
	 * @param charCaptcha   验证码字符
	 */
	private static void drawGraphic(BufferedImage bufferedImage, String charCaptcha) {
		ThreadLocalRandom random = ThreadLocalRandom.current();
		Graphics2D graphics2D = bufferedImage.createGraphics();// 获取图形上下文
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_NEAREST_NEIGHBOR);
		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);// 图形抗锯齿
		graphics2D.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);// 字体抗锯齿
		graphics2D.setColor(getRandomColor(210, 250));// 设定背景色，淡色
		graphics2D.fillRect(0, 0, WIDTH, HEIGHT);
		int smallCharacterCount = 20;// 画背景的小字符
		Color color = null;
		for (int i = 0; i < smallCharacterCount; i++) {
			color = getRandomColor(120, 200);
			graphics2D.setColor(color);
			String smallCharacterCode = String.valueOf(CHAR_ARRAY[random.nextInt(CHAR_ARRAY.length)]);
			graphics2D.drawString(smallCharacterCode, random.nextInt(WIDTH), random.nextInt(HEIGHT));
			color = null;
		}
		char[] buffer = charCaptcha.toCharArray();// 随机产生的4位验证码
		for (int i = 0; i < buffer.length; i++) {
			char xcode = buffer[i];
			int degree = random.nextInt(28);// 旋转度数，最好小于45度
			if (i % 2 == 0) {
				degree = degree * (-1);
			}
			int x = 22 * i;// 定义x坐标
			int y = 21;// 定义y坐标
			graphics2D.rotate(Math.toRadians(degree), x, y);// 旋转区域
			color = getRandomColor(20, 130);// 设定字体颜色
			graphics2D.setColor(color);
			graphics2D.setFont(RANDOM_FONT[random.nextInt(RANDOM_FONT.length)]);// 设定随机字体
			graphics2D.drawString("" + xcode, x + 8, y + 10);// 将验证码显示到图形中
			graphics2D.rotate(-Math.toRadians(degree), x, y);// 旋转之后再旋转回来
		}
		graphics2D.setColor(color);// 图片中间曲线使用上面缓存的Color
		BasicStroke basicStroke = new BasicStroke(3);// 线宽
		graphics2D.setStroke(basicStroke);
		QuadCurve2D.Double curve = new QuadCurve2D.Double(0d, random.nextInt(HEIGHT - 8) + (double) 4, WIDTH >> 1, HEIGHT >> 1, WIDTH,
				random.nextInt(HEIGHT - 8) + (double) 4);// 画曲线
		graphics2D.draw(curve);
		graphics2D.dispose();// 销毁图形
	}

	/**
	 * 获取给定范围的随机颜色
	 *
	 * @param minColor 最小颜色值
	 * @param maxColor 最大颜色值
	 * @return
	 */
	private static Color getRandomColor(int minColor, int maxColor) {
		ThreadLocalRandom random = ThreadLocalRandom.current();
		if (minColor > 255) {
			minColor = 255;
		}
		if (maxColor > 255) {
			maxColor = 255;
		}
		int r = minColor + random.nextInt(maxColor - minColor);
		int g = minColor + random.nextInt(maxColor - minColor);
		int b = minColor + random.nextInt(maxColor - minColor);
		return new Color(r, g, b);
	}

	/**
	 * 图像Header，避免验证码被缓存
	 *
	 * @return
	 */
	public static HttpHeaders getResponseHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.setPragma("no-cache");
		headers.setCacheControl("no-cache");
		headers.setExpires(0);
		headers.setContentType(MediaType.IMAGE_JPEG);
		return headers;
	}

}
