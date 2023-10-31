//https://misora.main.jp/shader_01/

varying vec2 vUv;
varying vec4 vWorldPosition;

void main() {
  vUv = uv;

  vec4 worldPosition = modelMatrix * vec4( position, 1.0 );
  vWorldPosition = worldPosition;
  vec4 mvPosition =  viewMatrix * worldPosition;
  
  gl_Position = projectionMatrix * mvPosition;
}
