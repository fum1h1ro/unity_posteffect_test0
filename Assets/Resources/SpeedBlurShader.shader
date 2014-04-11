Shader "dango/PostEffects/SpeedBlurShader" {
    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
    }
    SubShader {
        Pass {
            Tags { "RenderType"="Opaque" }
            //LOD 200
            Lighting Off
            Cull Off
            ZTest Always
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha
            Fog { mode off }

CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

    sampler2D _MainTex;
    half4 _MainTex_ST;

// モバイル用のシンプルなやつ
struct appdata_mobile {
    float4 vertex : POSITION;
    half4 color : COLOR;
    fixed4 texcoord : TEXCOORD0;
};
struct v2f {
    float4 pos : SV_POSITION;
    half4 color : COLOR;
    fixed2 uv : TEXCOORD0;
};

v2f vert(appdata_mobile v) {
    v2f o;
    o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
    o.color = v.color;//_Color;// * v.color;
    o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
    return o;
}
half4 frag(v2f i) : COLOR {
    half4 tex = tex2D(_MainTex, i.uv);
    return tex;
    //return i.color * half4(tex.xyz, 1);
}
ENDCG
        }
    } 
    FallBack "Diffuse"
}
