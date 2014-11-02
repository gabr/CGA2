// Put the names of all group members here
// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

uniform vec3 D_LightDir;
uniform vec3 P_LightPos;
uniform vec3 cameraPos;

// hint: vec3 b = a.xyz

void main() {

    vec3 r;
    int s = 20;
    float dotProductTmp = 0;
    vec3 kSpec = vec3(1.0);
    vec3 cameraVec = normalize(gl_Vertex.xyz - cameraPos);

    vec3 lightP_iSpec;
    vec3 lightP_iDiff;
    vec3 lightD_iDiff;

    // light D
    // diff
    dotProductTmp = dot(gl_Normal, - D_LightDir);
    if (dotProductTmp < 0)
    {
        lightD_iDiff = vec3(0.0);
    }
    else
    {
        lightD_iDiff = gl_Color.xyz * dotProductTmp;
    }

    // light P
    // spec
    vec3 lightPNormal = -normalize(gl_Vertex.xyz - P_LightPos);
    r = reflect(lightPNormal, gl_Normal);
    dotProductTmp = dot(cameraVec, r);
    if (dotProductTmp < 0.0)
    {
        lightP_iSpec = vec3(0.0);
    }
    else
    {
        lightP_iSpec = kSpec * pow(dotProductTmp, s);
    }

    // diff    
    dotProductTmp = dot(gl_Normal, lightPNormal);
    if (dotProductTmp < 0)
    {
        lightP_iDiff = vec3(0.0);
    }
    else
    {
        lightP_iDiff = gl_Color.xyz * dotProductTmp;
    }


    // result
    vec3 result = lightP_iSpec + lightP_iDiff + lightD_iDiff;
    gl_Position = ftransform();
    gl_FrontColor = vec4(result.x, result.y, result.z, 1.0);

}