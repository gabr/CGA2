// Put the names of all group members here 
// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

uniform vec3 D_LightDir;
uniform vec3 P_LightPos;
uniform vec3 cameraPos;

out vec3 lightDNormal;
out vec3 lightPNormal;
out vec3 camera;

out vec4 vertexColor;
varying vec4 vertexPos;
varying vec3 vertexNormal;

void main() {

    vertexPos = gl_Vertex;
    vertexNormal = gl_Normal;
    vertexColor = gl_Color;

    camera = cameraPos;

    lightDNormal = normalize(-D_LightDir);
    lightPNormal = -normalize(gl_Vertex.xyz - P_LightPos);

    gl_Position = ftransform();
}