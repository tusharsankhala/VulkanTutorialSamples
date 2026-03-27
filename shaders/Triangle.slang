struct VertexInput
{
	float2 inPosition;
	float3 color;	
};

struct UniformBuffer
{
	float4x4 model;
	float4x4 view;
	float4x4 proj;
};

ConstantBuffer<UniformBuffer> ubo;


struct VertexOutput
{
	float4 position : SV_Position;
	float3 color;
	
};

[shader("vertex")]
VertexOutput vertMain(VertexInput input)
{
	VertexOutput vertOut;
	vertOut.position	= mul(ubo.proj, mul(ubo.view, mul(ubo.model, float4(input.inPosition, 0.0f, 1.0f))));
	vertOut.color		= input.color;

	return vertOut;
}

[shader("fragment")]
float4 fragMain(VertexOutput inVert) : SV_Target
{
	return float4(inVert.color, 1.0);
}