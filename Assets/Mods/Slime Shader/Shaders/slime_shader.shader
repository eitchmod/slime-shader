// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Eitch/Slime"
{
	Properties
	{
		_Refraction("Refraction", Range( 0 , 2)) = 1.2
		_Alpha("Alpha", Range( 0 , 1)) = 0.1
		[Header(Refraction)]
		_ChromaticAberration("Chromatic Aberration", Range( 0 , 0.3)) = 0.1
		_Color("Color", Color) = (0.3892734,0.7191265,0.8823529,0)
		_Matcap("Matcap", 2D) = "white" {}
		_MatcapAlpha("MatcapAlpha", Range( 0 , 1)) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_liquidmask("Liquid Area Mask", 2D) = "white" {}
		[Normal]_Texture3("Liquid Normal", 2D) = "bump" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Texture2("Liquid Density Mask", 2D) = "white" {}
		_liquidftop("liquidftop", Range( 0 , 2)) = 2
		_liquidfbot("liquidfbot", Range( 0 , 2)) = 0
		_liquidbtop("liquidbtop", Range( 0 , 2)) = 0
		_liquidbbot("liquidbbot", Range( 0 , 2)) = 0
		_liquidface("liquidface", Range( 0 , 2)) = 0
		_LiquidColor("LiquidColor", Color) = (1,1,1,1)
		_LiquidTiling("Liquid Tiling", Vector) = (0,0,2,2)
		_RippleMap("RippleMap", 2D) = "bump" {}
		_RippleStrength("RippleStrength", Range( 0 , 1)) = 0.2757124
		[Normal]_NormalMap("NormalMap", 2D) = "bump" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "AlphaTest+0" }
		Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
		
		GrabPass{ }
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 4.5
		#pragma multi_compile _ALPHAPREMULTIPLY_ON
		#pragma surface surf Standard keepalpha finalcolor:RefractionF noshadow exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float4 screenPos;
		};

		uniform sampler2D _RippleMap;
		uniform float4 _RippleMap_ST;
		uniform float _RippleStrength;
		uniform sampler2D _Texture3;
		uniform float4 _LiquidTiling;
		uniform sampler2D _liquidmask;
		uniform float4 _liquidmask_ST;
		uniform sampler2D _Texture2;
		uniform float _liquidftop;
		uniform float _liquidfbot;
		uniform float _liquidbtop;
		uniform float _liquidbbot;
		uniform float _liquidface;
		uniform sampler2D _NormalMap;
		uniform float4 _NormalMap_ST;
		uniform float4 _Color;
		uniform sampler2D _Matcap;
		uniform float _MatcapAlpha;
		uniform float4 _LiquidColor;
		uniform float _Metallic;
		uniform float _Smoothness;
		uniform float _Alpha;
		uniform sampler2D _GrabTexture;
		uniform float _ChromaticAberration;
		uniform float _Refraction;

		inline float4 Refraction( Input i, SurfaceOutputStandard o, float indexOfRefraction, float chomaticAberration ) {
			float3 worldNormal = o.Normal;
			float4 screenPos = i.screenPos;
			#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
			#else
				float scale = 1.0;
			#endif
			float halfPosW = screenPos.w * 0.5;
			screenPos.y = ( screenPos.y - halfPosW ) * _ProjectionParams.x * scale + halfPosW;
			#if SHADER_API_D3D9 || SHADER_API_D3D11
				screenPos.w += 0.00000000001;
			#endif
			float2 projScreenPos = ( screenPos / screenPos.w ).xy;
			float3 worldViewDir = normalize( UnityWorldSpaceViewDir( i.worldPos ) );
			float3 refractionOffset = ( indexOfRefraction - 1.0 ) * mul( UNITY_MATRIX_V, float4( worldNormal, 0.0 ) ) * ( 1.0 - dot( worldNormal, worldViewDir ) );
			float2 cameraRefraction = float2( refractionOffset.x, refractionOffset.y );
			float4 redAlpha = tex2D( _GrabTexture, ( projScreenPos + cameraRefraction ) );
			float green = tex2D( _GrabTexture, ( projScreenPos + ( cameraRefraction * ( 1.0 - chomaticAberration ) ) ) ).g;
			float blue = tex2D( _GrabTexture, ( projScreenPos + ( cameraRefraction * ( 1.0 + chomaticAberration ) ) ) ).b;
			return float4( redAlpha.r, green, blue, redAlpha.a );
		}

		void RefractionF( Input i, SurfaceOutputStandard o, inout half4 color )
		{
			#ifdef UNITY_PASS_FORWARDBASE
			color.rgb = color.rgb + Refraction( i, o, _Refraction, _ChromaticAberration ) * ( 1 - color.a );
			color.a = 1;
			#endif
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Normal = float3(0,0,1);
			float2 uv_RippleMap = i.uv_texcoord * _RippleMap_ST.xy + _RippleMap_ST.zw;
			float4 break86_g724 = _LiquidTiling;
			float2 appendResult88_g724 = (float2(break86_g724.z , break86_g724.w));
			float2 appendResult87_g724 = (float2(break86_g724.x , break86_g724.y));
			float2 uv_TexCoord82_g724 = i.uv_texcoord * appendResult88_g724 + appendResult87_g724;
			float2 UV90_g724 = uv_TexCoord82_g724;
			float2 uv_liquidmask = i.uv_texcoord * _liquidmask_ST.xy + _liquidmask_ST.zw;
			float4 tex2DNode83_g724 = tex2D( _liquidmask, uv_liquidmask );
			float temp_output_29_0_g727 = saturate( ( 1.0 * saturate( ( 1.0 - ( ( distance( float4( 1,0,0,1 ).rgb , tex2DNode83_g724.rgb ) - 0.0 ) / max( 0.75 , 1E-05 ) ) ) ) ) );
			float4 tex2DNode89_g724 = tex2D( _Texture2, UV90_g724 );
			float4 break5_g727 = tex2DNode89_g724;
			float temp_output_26_0_g727 = _liquidftop;
			float blendOpSrc16_g727 = ( ( temp_output_29_0_g727 * break5_g727.r ) * saturate( temp_output_26_0_g727 ) );
			float blendOpDest16_g727 = ( ( temp_output_29_0_g727 * break5_g727.g ) * saturate( ( temp_output_26_0_g727 - 1.0 ) ) );
			float temp_output_29_0_g728 = saturate( ( 1.0 * saturate( ( 1.0 - ( ( distance( float4( 0,1,0,1 ).rgb , tex2DNode83_g724.rgb ) - 0.0 ) / max( 0.75 , 1E-05 ) ) ) ) ) );
			float4 break5_g728 = tex2DNode89_g724;
			float temp_output_26_0_g728 = _liquidfbot;
			float blendOpSrc16_g728 = ( ( temp_output_29_0_g728 * break5_g728.r ) * saturate( temp_output_26_0_g728 ) );
			float blendOpDest16_g728 = ( ( temp_output_29_0_g728 * break5_g728.g ) * saturate( ( temp_output_26_0_g728 - 1.0 ) ) );
			float temp_output_29_0_g731 = saturate( ( 1.0 * saturate( ( 1.0 - ( ( distance( float4( 0,0,1,1 ).rgb , tex2DNode83_g724.rgb ) - 0.0 ) / max( 0.75 , 1E-05 ) ) ) ) ) );
			float4 break5_g731 = tex2DNode89_g724;
			float temp_output_26_0_g731 = _liquidbtop;
			float blendOpSrc16_g731 = ( ( temp_output_29_0_g731 * break5_g731.r ) * saturate( temp_output_26_0_g731 ) );
			float blendOpDest16_g731 = ( ( temp_output_29_0_g731 * break5_g731.g ) * saturate( ( temp_output_26_0_g731 - 1.0 ) ) );
			float temp_output_29_0_g739 = saturate( ( 1.0 * saturate( ( 1.0 - ( ( distance( float4( 1,1,0,1 ).rgb , tex2DNode83_g724.rgb ) - 0.0 ) / max( 0.75 , 1E-05 ) ) ) ) ) );
			float4 break5_g739 = tex2DNode89_g724;
			float temp_output_26_0_g739 = _liquidbbot;
			float blendOpSrc16_g739 = ( ( temp_output_29_0_g739 * break5_g739.r ) * saturate( temp_output_26_0_g739 ) );
			float blendOpDest16_g739 = ( ( temp_output_29_0_g739 * break5_g739.g ) * saturate( ( temp_output_26_0_g739 - 1.0 ) ) );
			float temp_output_29_0_g734 = saturate( ( 1.0 * saturate( ( 1.0 - ( ( distance( float4( 0,1,1,1 ).rgb , tex2DNode83_g724.rgb ) - 0.0 ) / max( 0.75 , 1E-05 ) ) ) ) ) );
			float4 break5_g734 = tex2DNode89_g724;
			float temp_output_26_0_g734 = _liquidface;
			float blendOpSrc16_g734 = ( ( temp_output_29_0_g734 * break5_g734.r ) * saturate( temp_output_26_0_g734 ) );
			float blendOpDest16_g734 = ( ( temp_output_29_0_g734 * break5_g734.g ) * saturate( ( temp_output_26_0_g734 - 1.0 ) ) );
			float blendOpSrc44_g724 = ( saturate( ( blendOpSrc16_g739 + blendOpDest16_g739 ) ));
			float blendOpDest44_g724 = ( saturate( ( blendOpSrc16_g734 + blendOpDest16_g734 ) ));
			float blendOpSrc49_g724 = ( saturate( ( blendOpSrc16_g731 + blendOpDest16_g731 ) ));
			float blendOpDest49_g724 = ( saturate( ( blendOpSrc44_g724 + blendOpDest44_g724 ) ));
			float blendOpSrc50_g724 = ( saturate( ( blendOpSrc16_g728 + blendOpDest16_g728 ) ));
			float blendOpDest50_g724 = ( saturate( ( blendOpSrc49_g724 + blendOpDest49_g724 ) ));
			float blendOpSrc52_g724 = ( saturate( ( blendOpSrc16_g727 + blendOpDest16_g727 ) ));
			float blendOpDest52_g724 = ( saturate( ( blendOpSrc50_g724 + blendOpDest50_g724 ) ));
			float temp_output_52_0_g724 = ( saturate( ( blendOpSrc52_g724 + blendOpDest52_g724 ) ));
			float2 uv_NormalMap = i.uv_texcoord * _NormalMap_ST.xy + _NormalMap_ST.zw;
			o.Normal = BlendNormals( UnpackScaleNormal( float4( UnpackNormal( tex2D( _RippleMap, uv_RippleMap ) ) , 0.0 ), _RippleStrength ) , BlendNormals( UnpackScaleNormal( tex2D( _Texture3, UV90_g724 ), temp_output_52_0_g724 ) , UnpackNormal( tex2D( _NormalMap, uv_NormalMap ) ) ) );
			float4 ase_vertex4Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float4 temp_output_4_0_g657 = mul( UNITY_MATRIX_MV, ase_vertex4Pos );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_vertexNormal = mul( unity_WorldToObject, float4( ase_worldNormal, 0 ) );
			float3 temp_output_5_0_g657 = mul( UNITY_MATRIX_MV, float4( ase_vertexNormal , 0.0 ) ).xyz;
			float4 break9_g657 = reflect( temp_output_4_0_g657 , float4( temp_output_5_0_g657 , 0.0 ) );
			float4 appendResult20_g657 = (float4(break9_g657.x , break9_g657.y , 0.0 , 0.0));
			float4 blendOpSrc39 = _Color;
			float4 blendOpDest39 = ( tex2D( _Matcap, (saturate( ( ( appendResult20_g657 / ( sqrt( ( pow( break9_g657.x , 2.0 ) + pow( break9_g657.y , 2.0 ) + pow( ( break9_g657.z + 1 ) , 2.0 ) ) ) * 2 ) ) + 0.5 ) )).xy ) * _MatcapAlpha );
			float temp_output_296_110 = temp_output_52_0_g724;
			float4 lerpResult293 = lerp( ( saturate( ( blendOpSrc39 + blendOpDest39 ) )) , ( _LiquidColor * temp_output_52_0_g724 ) , temp_output_296_110);
			o.Albedo = lerpResult293.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Smoothness;
			o.Alpha = max( temp_output_296_110 , _Alpha );
			o.Normal = o.Normal + 0.00001 * i.screenPos * i.worldPos;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18707
434;430;1547;781;1050.125;286.7724;2.358705;True;True
Node;AmplifyShaderEditor.CommentaryNode;298;-1584.616,-480.1218;Inherit;False;1402.121;693.8913;Skin;7;39;22;31;26;16;10;11;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;297;-1563.617,298.4448;Inherit;False;1200.817;1503.303;Liquid;11;296;87;134;137;99;108;154;133;136;237;135;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;300;17.88053,-28.73602;Inherit;False;1271.962;878.8302;Normals;9;301;307;304;302;279;246;245;308;306;;1,1,1,1;0;0
Node;AmplifyShaderEditor.Vector4Node;237;-1195.698,1128.759;Inherit;False;Property;_LiquidTiling;Liquid Tiling;19;0;Create;False;0;0;False;0;False;0,0,2,2;0,0,2,2;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;11;-1496.636,-27.39204;Inherit;False;BetterMatcap;-1;;657;b1839192452161548803429ef20292a1;0;0;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;136;-1279.109,1590.345;Inherit;False;Property;_liquidface;liquidface;17;0;Create;True;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-1278.807,1310.808;Inherit;False;Property;_liquidftop;liquidftop;13;0;Create;True;0;0;False;0;False;2;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;10;-1521.834,-235.2313;Float;True;Property;_Matcap;Matcap;6;0;Create;True;0;0;False;0;False;fd99656a9f0e2884e8b7fdc6a3b48dbc;fd99656a9f0e2884e8b7fdc6a3b48dbc;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;137;-1311.403,736.8458;Inherit;True;Property;_liquidmask;Liquid Area Mask;9;0;Create;False;0;0;False;0;False;None;88df8f397492a0f4fa4deafa7c81ae43;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;108;-1277.851,1449.51;Inherit;False;Property;_liquidbtop;liquidbtop;15;0;Create;True;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;87;-1288.815,540.996;Inherit;True;Property;_Texture3;Liquid Normal;10;1;[Normal];Create;False;0;0;False;0;False;None;82f229c3d852fd541a24067f6c1a2671;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;99;-1282.812,927.0617;Inherit;True;Property;_Texture2;Liquid Density Mask;12;0;Create;False;0;0;False;0;False;None;d00e09abdb363ea479351e8e3f02fa22;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ColorNode;154;-1223.382,367.4843;Inherit;False;Property;_LiquidColor;LiquidColor;18;0;Create;False;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;134;-1276.099,1380.508;Inherit;False;Property;_liquidfbot;liquidfbot;14;0;Create;True;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-1277.493,1518.985;Inherit;False;Property;_liquidbbot;liquidbbot;16;0;Create;True;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;16;-1150.423,-162.358;Inherit;True;Property;_TextureSample1;Texture Sample 1;13;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;26;-1143.396,61.38644;Float;False;Property;_MatcapAlpha;MatcapAlpha;7;0;Create;True;0;0;False;0;False;0;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;296;-778.2454,774.3455;Inherit;True;Liquid;-1;;724;05c3c5362929211448ac2a60765e9549;0;10;57;COLOR;1,1,1,1;False;58;SAMPLER2D;0,0,0,0;False;56;SAMPLER2D;0,0,0,0;False;55;SAMPLER2D;0,0,0,0;False;81;FLOAT4;0,0,2,2;False;60;FLOAT;0;False;61;FLOAT;0;False;62;FLOAT;0;False;63;FLOAT;0;False;64;FLOAT;0;False;3;COLOR;0;FLOAT3;59;FLOAT;110
Node;AmplifyShaderEditor.TexturePropertyNode;245;79.58944,602.0352;Inherit;True;Property;_NormalMap;NormalMap;22;1;[Normal];Create;True;0;0;False;0;False;None;03cda0a740ddaf74aabbf2e88d5aa0b5;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;302;72.37597,72.47542;Inherit;True;Property;_RippleMap;RippleMap;20;0;Create;True;0;0;False;0;False;None;None;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;246;350.9902,602.5146;Inherit;True;Property;_TextureSample2;Texture Sample 2;25;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;22;-958.6321,-371.5632;Float;False;Property;_Color;Color;5;0;Create;True;0;0;False;0;False;0.3892734,0.7191265,0.8823529,0;0.3215677,0.7545847,0.8970588,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-773.9235,-164.1036;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RelayNode;308;-25.49098,479.258;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;306;444.1118,315.4336;Inherit;False;Property;_RippleStrength;RippleStrength;21;0;Create;True;0;0;False;0;False;0.2757124;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;304;405.9186,73.35548;Inherit;True;Property;_TextureSample4;Texture Sample 2;25;0;Create;True;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BlendNormalsNode;279;692.8556,546.6694;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;18;908.4608,1080.942;Float;False;Property;_Alpha;Alpha;2;0;Create;True;0;0;False;0;False;0.1;0.614;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;307;812.8303,103.2181;Inherit;False;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BlendOpsNode;39;-510.1626,-310.0114;Inherit;True;LinearDodge;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;45;1207.786,1155.016;Float;False;Property;_Metallic;Metallic;8;0;Create;True;0;0;False;0;False;0;0.574;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;1204.61,1254.438;Float;False;Property;_Smoothness;Smoothness;11;0;Create;True;0;0;False;0;False;0;0.668;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;294;1318.119,876.3589;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;1200.042,1358.589;Inherit;False;Property;_Refraction;Refraction;1;0;Create;True;0;0;False;0;False;1.2;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;293;108.8561,-330.9063;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;301;1065.71,580.2448;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1717.232,-142.4049;Float;False;True;-1;5;ASEMaterialInspector;0;0;Standard;Eitch/Slime;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Transparent;;AlphaTest;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;5;False;-1;10;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;3;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;16;0;10;0
WireConnection;16;1;11;0
WireConnection;296;57;154;0
WireConnection;296;58;87;0
WireConnection;296;56;137;0
WireConnection;296;55;99;0
WireConnection;296;81;237;0
WireConnection;296;60;135;0
WireConnection;296;61;134;0
WireConnection;296;62;108;0
WireConnection;296;63;133;0
WireConnection;296;64;136;0
WireConnection;246;0;245;0
WireConnection;31;0;16;0
WireConnection;31;1;26;0
WireConnection;308;0;296;59
WireConnection;304;0;302;0
WireConnection;279;0;308;0
WireConnection;279;1;246;0
WireConnection;307;0;304;0
WireConnection;307;1;306;0
WireConnection;39;0;22;0
WireConnection;39;1;31;0
WireConnection;294;0;296;110
WireConnection;294;1;18;0
WireConnection;293;0;39;0
WireConnection;293;1;296;0
WireConnection;293;2;296;110
WireConnection;301;0;307;0
WireConnection;301;1;279;0
WireConnection;0;0;293;0
WireConnection;0;1;301;0
WireConnection;0;3;45;0
WireConnection;0;4;50;0
WireConnection;0;8;36;0
WireConnection;0;9;294;0
ASEEND*/
//CHKSM=2D938A09A2B19AFFDCAC15C6EE9B13B7D4282A54