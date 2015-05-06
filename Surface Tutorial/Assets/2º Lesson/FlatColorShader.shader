// Shader Category / Name
Shader "Custom/Research/Flat Color" {
	// Unity Properties
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
	}
	
	// SubShader
	SubShader {
	
		// SubShader Tags
		Tags { "RenderType" = "Opaque" }
		
		// Start CG programming
		CGPROGRAM
		#pragma surface surf Lambert
		
		// If you want to know exactly what Unity does on Lambert
		// Find out the Lightning.cginc, where it is implemented.
		
		// Properties Variables
		uniform sampler2D _MainTex; // _MainTex Texture2D Sampler.
		
		// Surface Input
		struct Input {
			half4 _MainTex_UV; // _MainTex UV Coordenates.
		};
		
		// Surf function
		void surf (Input i, inout SurfaceOutput o) {
			o.Albedo = 1;
		}
		ENDCG
	}
		
	//Fallback "Diffuse"
}