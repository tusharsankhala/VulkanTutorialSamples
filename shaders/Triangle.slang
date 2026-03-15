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


struct VertexOutput
{
	float3 color;
	float4 sv_position : SV_Position;
	
};

[shader("vertex")]
VertexOutput vertMain(uint vid: SV_VertexId)
{
	VertexOutput vertOut;
	vertOut.sv_position = float4(positions[vid], 0.0f, 1.0f);
	vertOut.color = colors[vid];

	return vertOut;
}

[shader("fragment")]
float4 fragMain(VertexOutput inVert) : SV_Target
{
	float3 color = inVert.color;
	return float4(color, 1.0);
}