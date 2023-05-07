#include "ShaderConstants.fxh"

struct PS_Input
{
    float4 position : SV_Position;
    float4 color : COLOR;
};

struct PS_Output
{
    float4 color : SV_Target;
};
static const float3 luminanceWeighting = float3(0.2125, 0.7154, 0.0721);

ROOT_SIGNATURE
void main(in PS_Input PSInput, out PS_Output PSOutput)
{
    float3 rgb = PSInput.color.rgb;
    float luminance = dot(rgb, luminanceWeighting);
    float3 greyScaleColor = float3(luminance);
    
    float3 colorContrast = float3((rgb - float3(0.5)) * 1 + float3(0.5));

    PSOutput.color = float4(mix(greyScaleColor, colorContrast, 1.2), color.a);
}
