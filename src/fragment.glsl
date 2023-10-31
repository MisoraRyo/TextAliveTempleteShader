
//uniform sampler2D udisplayment;
uniform vec2 uResolution;
uniform float uTime;
uniform float uCount;

varying vec2 vUv;
varying vec4 vWorldPosition;

const float Pi = 3.14159;

void main()
{
  vec2 pos = gl_FragCoord.xy / uResolution.xy;
  vec2 uv = vUv;
  
  // 出力
  gl_FragColor = vec4(pos, 1.0, 1.0);
}
