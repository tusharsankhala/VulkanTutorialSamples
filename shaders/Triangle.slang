static float2 positions[6] = float2[](
    float2(-0.5f, -0.5f),
	float2(-0.1f, 0.5f),
    float2(-0.9f, 0.5f), 

    float2(0.5f, -0.5f),
	float2(0.9f, 0.5f),
    float2(0.1f, 0.5f), 
	
);

static float3 colors[6] = float3[](
    float3(1.0f, 0.0f, 0.0f),
    float3(0.0f, 1.0f, 0.0f),
    float3(0.0f, 0.0f, 1.0f),
	
	float3(1.0f, 1.0f, 0.0f),
    float3(0.0f, 1.0f, 1.0f),
    float3(1.0f, 0.0f, 1.0f),
);

struct VertexInput
{
	float2 inPosition;
	float3 color;	
};


struct VertexOutput
{
	float4 sv_position : SV_Position;
	float3 color;
	
};

[shader("vertex")]
VertexOutput vertMain(VertexInput vsInput)
{
	VertexOutput vertOut;
	vertOut.sv_position = float4(vsInput.inPosition, 0.0f, 1.0f);
	vertOut.color = vsInput.color;

	return vertOut;
}

[shader("fragment")]
float4 fragMain(VertexOutput inVert) : SV_Target
{
	return float4(inVert.color, 1.0);
}