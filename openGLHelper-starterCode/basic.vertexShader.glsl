#version 150

in vec3 position;
in vec4 color;
out vec4 col;

in vec4 positionNeighbors;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform int mode;

void main()
{
  if(mode == 1)
  {
    float smoothenedHeight = (positionNeighbors[0] + positionNeighbors[1] + positionNeighbors[2] + positionNeighbors[3]) * 5.0f;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position[0], smoothenedHeight, position[2], 1.0f);
    col = color;//max(color, vec4(0.00001f)) / max(position[1], 0.00001f) * smoothenedHeight;
  }
  else
  {
    // compute the transformed and projected vertex position (into gl_Position) 
    // compute the vertex color (into col)
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0f);
    col = color;
  }
}

