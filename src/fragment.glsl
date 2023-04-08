//https://misora.main.jp/shader_01/

#define R_LUMINANCE 0.298912
#define G_LUMINANCE 0.586611
#define B_LUMINANCE 0.114478
const vec3 monochromeScale = vec3(R_LUMINANCE, G_LUMINANCE, B_LUMINANCE);

uniform sampler2D udisplayment;//ﾃｦ窶凪｡ﾃ･ﾂｭ窶氾ｧ窶敖ｻﾃ･ﾆ陳湘｣ﾂ�ｮﾃ｣ﾆ停｡ﾃ｣ﾆ陳ｼﾃ｣窶堋ｿ

uniform vec2 resolution;
uniform float uTime;

const float Pi = 3.14159;
uniform vec2 mouse;

const int   complexity      = 30;    // More points of color.
const float mouse_factor    = 56.0;  // Makes it more/less jumpy.
const float mouse_offset    = 0.0;   // Drives complexity in the amount of curls/cuves.  Zero is a single whirlpool.
const float fluid_speed     = 2.0;  // Drives speed, higher number will make it slower.
const float color_intensity = 0.7;

const float fMosaicScale = 30.0;

varying vec2 vUv;

void main()
{

  vec4 disp = texture2D(udisplayment, vUv);
  float alpha = disp.r * 0.2 + disp.g * 0.7 + disp.b * 0.1;
  vec2 p = ( 2.0 * gl_FragCoord.xy - resolution ) / max(resolution.x,resolution.y);

  for(int i=1;i<complexity;i++)
  {
    vec2 newp = p + uTime*0.001;
    newp.x+=0.6/float(i)*cos(float(i)*p.y+uTime/fluid_speed+0.3*float(i)) + 0.5; // + mouse.y/mouse_factor+mouse_offset;
    newp.y+=0.6/float(i)*sin(float(i)*p.x+uTime/fluid_speed+0.3*float(i+10)) - 0.5; // - mouse.x/mouse_factor+mouse_offset;
    p = newp;
  }
  
  vec3 col = vec3(
    color_intensity*sin(1.0*p.x)+color_intensity,
    color_intensity*sin(3.0*p.y)+color_intensity,
    0.0
  );

  float grayColor = dot(col.rgb, monochromeScale);
  vec3 Finalcolor = vec3(grayColor) * vec3(1.0,1.0,1.0);


  gl_FragColor = vec4(vec3(1.0,1.0,1.0) - col, 1.0);

}