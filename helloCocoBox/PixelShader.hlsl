/*
* cocos2d-x   http://www.cocos2d-x.org
*
* Copyright (c) 2010-2011 - cocos2d-x community
* 
* Portions Copyright (c) Microsoft Open Technologies, Inc.
* All Rights Reserved
* 
* Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
* You may obtain a copy of the License at 
* 
* http://www.apache.org/licenses/LICENSE-2.0 
* 
* Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an 
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
* See the License for the specific language governing permissions and limitations under the License.
*/

cbuffer TextureColorBuffer
{
	bool istexture[16];
};

Texture2D shaderTexture  :register( t0 );
SamplerState SampleType : register( s0 );

struct PixelInputType
{
	float4 vertices : SV_POSITION;
    float4 color : COLOR;
	float2 texCoords : TEXCOORD;
};

////////////////////////////////////////////////////////////////////////////////
// Vertex Shader
////////////////////////////////////////////////////////////////////////////////
float4 main( PixelInputType input) : SV_TARGET
{
	float4 textureColor;
	if(istexture[0])
	{
		textureColor = shaderTexture.Sample( SampleType, input.texCoords ) * input.color;
	}
	else
	{
		textureColor = input.color;
	}
	
    return textureColor;
}