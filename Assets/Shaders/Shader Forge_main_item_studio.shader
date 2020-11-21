// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1021,x:33274,y:32498,varname:node_1021,prsc:2|diff-9592-RGB,normal-4413-RGB;n:type:ShaderForge.SFN_Tex2d,id:9592,x:32734,y:32327,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_9592,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6623,x:32567,y:32327,ptovrint:False,ptlb:AnotherRamp,ptin:_AnotherRamp,varname:node_6623,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:True;n:type:ShaderForge.SFN_Tex2d,id:4413,x:32734,y:32566,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_4413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7894,x:32567,y:32801,ptovrint:False,ptlb:DetailMask,ptin:_DetailMask,varname:node_7894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3949,x:32567,y:32566,ptovrint:False,ptlb:LineMask,ptin:_LineMask,varname:node_3949,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Color,id:1659,x:32122,y:33277,ptovrint:False,ptlb:ShadowColor,ptin:_ShadowColor,varname:node_1659,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.628,c2:0.628,c3:0.628,c4:1;n:type:ShaderForge.SFN_Slider,id:2972,x:31819,y:33057,ptovrint:False,ptlb:SpecularPower,ptin:_SpecularPower,varname:node_2972,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:8416,x:31817,y:32287,ptovrint:False,ptlb:SpeclarHeight,ptin:_SpeclarHeight,varname:node_8416,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.98,max:1;n:type:ShaderForge.SFN_Slider,id:9764,x:31817,y:32427,ptovrint:False,ptlb:rimpower,ptin:_rimpower,varname:node_9764,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Slider,id:6842,x:31817,y:32550,ptovrint:False,ptlb:rimV,ptin:_rimV,varname:node_6842,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Slider,id:8817,x:31817,y:32676,ptovrint:False,ptlb:ShadowExtend,ptin:_ShadowExtend,varname:node_8817,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:8327,x:31817,y:32804,ptovrint:False,ptlb:ShadowExtendAnother,ptin:_ShadowExtendAnother,varname:node_8327,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_ToggleProperty,id:7646,x:32795,y:33042,ptovrint:False,ptlb:AnotherRampFull,ptin:_AnotherRampFull,varname:node_7646,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_ToggleProperty,id:465,x:32795,y:33149,ptovrint:False,ptlb:DetailBLineG,ptin:_DetailBLineG,varname:node_465,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_ToggleProperty,id:8716,x:32947,y:33153,ptovrint:False,ptlb:DetailRLineR,ptin:_DetailRLineR,varname:node_8716,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_ToggleProperty,id:6059,x:32947,y:33042,ptovrint:False,ptlb:notusetexspecular,ptin:_notusetexspecular,varname:node_6059,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_ValueProperty,id:5498,x:33103,y:33153,ptovrint:False,ptlb:LineWidthS,ptin:_LineWidthS,varname:node_5498,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Tex2d,id:1091,x:32734,y:32801,ptovrint:False,ptlb:ColorMask,ptin:_ColorMask,varname:node_1091,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Color,id:5738,x:32271,y:33087,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5738,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9607843,c2:0.9607843,c3:0.9607843,c4:1;n:type:ShaderForge.SFN_Color,id:4550,x:32426,y:33087,ptovrint:False,ptlb:Color2,ptin:_Color2,varname:node_4550,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9607843,c2:0.9607843,c3:0.9607843,c4:1;n:type:ShaderForge.SFN_Color,id:9068,x:32580,y:33087,ptovrint:False,ptlb:Color3,ptin:_Color3,varname:node_9068,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9607843,c2:0.9607843,c3:0.9607843,c4:1;n:type:ShaderForge.SFN_Slider,id:8164,x:31819,y:32938,ptovrint:False,ptlb:Cutoff,ptin:_Cutoff,varname:node_8164,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Tex2d,id:7342,x:32393,y:32327,ptovrint:False,ptlb:PatternMask1,ptin:_PatternMask1,varname:node_7342,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5414,x:32393,y:32566,ptovrint:False,ptlb:PatternMask2,ptin:_PatternMask2,varname:node_5414,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:1607,x:32393,y:32801,ptovrint:False,ptlb:PatternMask3,ptin:_PatternMask3,varname:node_1607,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:8332,x:32271,y:33277,ptovrint:False,ptlb:Color1_2,ptin:_Color1_2,varname:node_8332,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3921569,c2:0.3921569,c3:0.3921569,c4:1;n:type:ShaderForge.SFN_Color,id:5830,x:32426,y:33277,ptovrint:False,ptlb:Color2_2,ptin:_Color2_2,varname:node_5830,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3921569,c2:0.3921569,c3:0.3921569,c4:1;n:type:ShaderForge.SFN_Color,id:9446,x:32580,y:33277,ptovrint:False,ptlb:Color3_2,ptin:_Color3_2,varname:node_9446,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3921569,c2:0.3921569,c3:0.3921569,c4:1;n:type:ShaderForge.SFN_Vector4Property,id:6349,x:32271,y:33479,ptovrint:False,ptlb:Patternuv1,ptin:_Patternuv1,varname:node_6349,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:1,v4:1;n:type:ShaderForge.SFN_Slider,id:6889,x:31819,y:33172,ptovrint:False,ptlb:patternrotator1,ptin:_patternrotator1,varname:node_6889,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_ToggleProperty,id:7957,x:32795,y:33269,ptovrint:False,ptlb:patternclamp1,ptin:_patternclamp1,varname:node_7957,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_Vector4Property,id:5452,x:32426,y:33479,ptovrint:False,ptlb:Patternuv2,ptin:_Patternuv2,varname:node_5452,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:1,v4:1;n:type:ShaderForge.SFN_Slider,id:2837,x:31819,y:33277,ptovrint:False,ptlb:patternrotator2,ptin:_patternrotator2,varname:node_2837,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_ToggleProperty,id:3391,x:32947,y:33269,ptovrint:False,ptlb:patternclamp2,ptin:_patternclamp2,varname:node_3391,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_Vector4Property,id:7802,x:32580,y:33479,ptovrint:False,ptlb:Patternuv3,ptin:_Patternuv3,varname:node_7802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0,v2:0,v3:1,v4:1;n:type:ShaderForge.SFN_Slider,id:4165,x:31819,y:33395,ptovrint:False,ptlb:patternrotator3,ptin:_patternrotator3,varname:node_4165,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_ToggleProperty,id:9336,x:33103,y:33269,ptovrint:False,ptlb:patternclamp3,ptin:_patternclamp3,varname:node_9336,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_Color,id:9833,x:32122,y:33087,ptovrint:False,ptlb:LineColor,ptin:_LineColor,varname:node_9833,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Slider,id:3234,x:31819,y:33508,ptovrint:False,ptlb:EmissionPower,ptin:_EmissionPower,varname:node_3234,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_ToggleProperty,id:8373,x:33103,y:33042,ptovrint:False,ptlb:ambientshadowOFF,ptin:_ambientshadowOFF,varname:node_8373,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;proporder:6623-9592-4413-7894-3949-1659-2972-8416-9764-6842-8817-8327-7646-465-8716-6059-5738-4550-9068-1091-7342-5414-1607-8332-5830-9446-6349-6889-7957-5452-2837-3391-7802-4165-9336-5498-9833-3234-8373-8164;pass:END;sub:END;*/

Shader "Shader Forge/main_item_studio" {
    Properties {
        _AnotherRamp ("AnotherRamp", 2D) = "white" {}
        _MainTex ("MainTex", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _DetailMask ("DetailMask", 2D) = "black" {}
        _LineMask ("LineMask", 2D) = "black" {}
        _ShadowColor ("ShadowColor", Color) = (0.628,0.628,0.628,1)
        _SpecularPower ("SpecularPower", Range(0, 1)) = 0
        _SpeclarHeight ("SpeclarHeight", Range(0, 1)) = 0.98
        _rimpower ("rimpower", Range(0, 1)) = 0.5
        _rimV ("rimV", Range(0, 1)) = 0.5
        _ShadowExtend ("ShadowExtend", Range(0, 1)) = 1
        _ShadowExtendAnother ("ShadowExtendAnother", Range(0, 1)) = 1
        [MaterialToggle] _AnotherRampFull ("AnotherRampFull", Float ) = 0
        [MaterialToggle] _DetailBLineG ("DetailBLineG", Float ) = 0
        [MaterialToggle] _DetailRLineR ("DetailRLineR", Float ) = 0
        [MaterialToggle] _notusetexspecular ("notusetexspecular", Float ) = 0
        _Color ("Color", Color) = (0.9607843,0.9607843,0.9607843,1)
        _Color2 ("Color2", Color) = (0.9607843,0.9607843,0.9607843,1)
        _Color3 ("Color3", Color) = (0.9607843,0.9607843,0.9607843,1)
        _ColorMask ("ColorMask", 2D) = "black" {}
        _PatternMask1 ("PatternMask1", 2D) = "white" {}
        _PatternMask2 ("PatternMask2", 2D) = "white" {}
        _PatternMask3 ("PatternMask3", 2D) = "white" {}
        _Color1_2 ("Color1_2", Color) = (0.3921569,0.3921569,0.3921569,1)
        _Color2_2 ("Color2_2", Color) = (0.3921569,0.3921569,0.3921569,1)
        _Color3_2 ("Color3_2", Color) = (0.3921569,0.3921569,0.3921569,1)
        _Patternuv1 ("Patternuv1", Vector) = (0,0,1,1)
        _patternrotator1 ("patternrotator1", Range(-1, 1)) = 0
        [MaterialToggle] _patternclamp1 ("patternclamp1", Float ) = 0
        _Patternuv2 ("Patternuv2", Vector) = (0,0,1,1)
        _patternrotator2 ("patternrotator2", Range(-1, 1)) = 0
        [MaterialToggle] _patternclamp2 ("patternclamp2", Float ) = 0
        _Patternuv3 ("Patternuv3", Vector) = (0,0,1,1)
        _patternrotator3 ("patternrotator3", Range(-1, 1)) = 0
        [MaterialToggle] _patternclamp3 ("patternclamp3", Float ) = 0
        _LineWidthS ("LineWidthS", Float ) = 1
        _LineColor ("LineColor", Color) = (0.5,0.5,0.5,1)
        _EmissionPower ("EmissionPower", Range(0, 1)) = 0
        [MaterialToggle] _ambientshadowOFF ("ambientshadowOFF", Float ) = 0
        _Cutoff ("Cutoff", Range(0, 1)) = 0.5
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _NormalMap_var = tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuseColor = _MainTex_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 _NormalMap_var = tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 diffuseColor = _MainTex_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
