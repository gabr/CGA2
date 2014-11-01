// Put the names of all group members here 
// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

uniform vec3 D_LightDir;
uniform vec3 P_LightPos;
uniform vec3 cameraPos;

// hint: vec3 b = a.xyz

void main() {

    vec3 r;
    int s = 1;
    vec3 kSpec = vec3(1);

    vec3 iDiff;
    vec3 iSpec;

    // light D
    r = ((2 * dot(D_LightDir, gl_Vertex.xyz)) * gl_Vertex.xyz) - D_LightDir;
    iDiff = gl_Color.xyz * dot(D_LightDir, gl_Vertex.xyz);
    iSpec = kSpec * dot(cameraPos, r);

    vec3 lightD = iDiff + iSpec;

    // light P
    r = ((2 * dot(P_LightPos, gl_Vertex.xyz)) * gl_Vertex.xyz) - P_LightPos;
    iDiff = gl_Color.xyz * dot(P_LightPos, gl_Vertex.xyz);
    iSpec = kSpec * dot(cameraPos, r);

    vec3 lightP = iDiff + iSpec;

    vec3 result = lightD + lightP;
    gl_Position = ftransform();
    gl_FrontColor = vec4(result.x, result.y, result.z, 0.5);

}