// Put the names of all group members here 
// Arkadiusz Gabrys qe83mepi
// Agnieszka Zacher by57zeja

in vec3 lightDNormal;
in vec3 lightPNormal;
in vec3 camera;

in vec4 vertexColor;
in vec4 vertexPos;
varying vec3 vertexNormal;

void main() {

    vec3 r;
    int s = 20;
    float dotProductTmp = 0;
    vec3 kSpec = vec3(1.0);
    vec3 cameraVec = normalize(vertexPos.xyz - camera);

    vec3 lightP_iSpec;
    vec3 lightP_iDiff;
    vec3 lightD_iDiff;

    // light D
    // diff
    dotProductTmp = dot(vertexNormal, lightDNormal);
    if (dotProductTmp < 0)
    {
        lightD_iDiff = vec3(0.0);
    }
    else
    {
        lightD_iDiff = vertexColor.xyz * dotProductTmp;
    }

    // light P
    // spec
    r = reflect(lightPNormal, vertexNormal);
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
    dotProductTmp = dot(vertexNormal, lightPNormal);
    if (dotProductTmp < 0)
    {
        lightP_iDiff = vec3(0.0);
    }
    else
    {
        lightP_iDiff = vertexColor.xyz * dotProductTmp;
    }


    // result
    vec3 result = lightP_iSpec + lightP_iDiff + lightD_iDiff;
    gl_FragColor = vec4(result.x, result.y, result.z, 1.0);
}