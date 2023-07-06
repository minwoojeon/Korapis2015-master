package kr.or.korapis.test;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.RescaleOp;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;

import javax.imageio.ImageIO;

public class ImageAlphaTest {
    public static void main(String[] args) {
        // 1. 특정 이미지 리소스를 변환한다.
        String webRoot = "C:/Users/binoo/Downloads/Korapis2015-master/Korapis2015-master/res/";
        String outputPath = "C:/Users/binoo/Downloads/Korapis2015-master/Korapis2015-master/res/for_reference_bot_2_tmp";
        
        try {
            BufferedImage img = ImageIO.read(new File(webRoot + "for_reference_bot_2.png"));
            
            BufferedImage alphaImg = new BufferedImage(img.getWidth(), img.getHeight(), BufferedImage.TYPE_INT_ARGB);
            Graphics2D graphics2D = alphaImg.createGraphics();
            graphics2D.drawImage(img, null, 0, 0);
            
            for(int idx = 0; idx < 20; idx++) {
                RescaleOp r = new RescaleOp(new float[]{1f, 1f, 1f, (float) idx * 5 / 100}, new float[]{0, 0, 0, 0}, null);
                BufferedImage filter = r.filter(alphaImg, null);
                ImageIO.write(filter, "PNG", new File(outputPath + (idx * 5) + ".png"));
            }
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
}
