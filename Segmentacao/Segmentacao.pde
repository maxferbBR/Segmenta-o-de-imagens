void setup() {
  size(244,183);
  noLoop();
}

void draw() {

   PImage img = loadImage("img4.jpg"); 
   PImage img2 = createImage(img.width, img.height, RGB);
   
   // Filtro de Escala de Cinza
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int media = (int) (red(img.pixels[pos]) + 
                            green(img.pixels[pos]) + 
                            blue(img.pixels[pos])) / 3;
         img2.pixels[pos] = color(blue(img.pixels[pos]));
     }
   }
   // Filtro de Brilho
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int brilho = (int) red(img2.pixels[pos]) + 100;
         if (brilho > 255) brilho = 255;
         else if(brilho < 0) brilho = 0;
         img2.pixels[pos] = color(brilho);
     }
   }
   // Filtro de Limiarização
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         if(red(img2.pixels[pos]) > 210 &&
            y > 10 && y < 550 && x > 25) 
           img2.pixels[pos] = color(255);
         else 
           img2.pixels[pos] = color(100);
     }
   }

   
   image(img2,0,0);
}
