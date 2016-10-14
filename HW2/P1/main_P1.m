 clear; 
 img = imread('P1-bridge.jpg'); 
 out = myhisteq(img); 
 imwrite(out, 'P1-bridge-out.jpg')
 
 
 img = imread('P1-snow.jpg'); 
 out = myhisteq(img); 
 imwrite(out, 'P1-snow-out.jpg')
 
 img = imread('echo&me.jpg'); 
 out = myhisteq(img); 
 imwrite(out, 'echo&me2.jpg')
 
 img = imread('echo.jpg'); 
 out = myhisteq(img); 
 imwrite(out, 'echo2.jpg')
 
 
 
 
 
 